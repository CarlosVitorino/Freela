import React, { useState, useEffect, useRef } from "react";
import { useLocation, useHistory, useParams } from "react-router-dom";
import { ArrowLeftOutlined } from "@ant-design/icons";
import {
  Typography,
  Form,
  Input,
  InputNumber,
  DatePicker,
  Button,
  notification,
  Select,
  Row,
  Col,
  Card,
  Space,
  Switch,
  Popconfirm,
  Checkbox,
} from "antd";
import moment from "moment";
import { JellyTriangle } from "@uiball/loaders";
import _service from "@netuno/service-client";
import _auth from "@netuno/auth-client";

import "./index.less";

const { Title, Text } = Typography;

export default function Detail(props) {
  const [loading, setLoading] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [sessionType, setSessionType] = useState(false);
  const [sessionSubType, setSessionSubType] = useState(false);
  const [sessionSubTypeOptions, setSessionSubTypeOptions] = useState(false);
  const [clients, setClients] = useState([]);
  const [active, setActive] = useState(true);
  const [isCompany, setIsCompany] = useState(false);
  const [sessionTypeValue, setSessionTypeValue] = useState(false);
  const [contries, setContries] = useState([]);
  const { id } = useParams();
  const location = useLocation();
  const history = useHistory();
  const clientForm = useRef(null);

  const { Option } = Select;
  const { TextArea } = Input;
  const layout = {
    wrapperCol: {
      xs: { span: 12 },
      sm: { span: 12 },
      md: { span: 24 },
      lg: { span: 24 },
    },
  };

  const colStyle = { padding: "8px 0px" };

  useEffect(() => {
    onFetchSessionType();
    onFetchSessionSubType();
    onFetchClients();
    onFetchCountries();
    if (clientForm.current && id) onFetchDetail();
  }, [location]);

  useEffect(() => {
    if (sessionTypeValue && sessionType && sessionSubType && clientForm.current && !sessionSubTypeOptions)
      handleTypeChange(sessionTypeValue);
  }, [sessionTypeValue, sessionType, sessionSubType]);

  const onFetchDetail = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "client/detail",
      data: { clientId: parseInt(id) },
      success: (response) => {
        setLoading(false);
        if (response.json.result && response.json.data.length === 1) {
          let data = response.json.data[0];
          if (data["start_date"]) {
            data["start_date"] = moment(data["start_date"]);
          }
          if (data["date_of_birth"]) {
            data["date_of_birth"] = moment(data["date_of_birth"]);
          }
          data["client_association_id"] = data.client_association_id === 0 ? null : data.client_association_id;
          data.is_company && setIsCompany(true);
          setActive(data["active"]);
          setSessionTypeValue(data.default_session_type);
          clientForm.current.setFieldsValue(data);
        } else {
          notification["warning"]({
            message: "Ocorreu um erro a carregar os dados",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: (error) => {
        setLoading(false);
        notification["error"]({
          message: "Ocorreu um erro a carregar os dados",
          description: "Detail - Ocorreu um erro a carregar os dados, por favor tente novamente.",
        });

        _auth.logout();
        history.push("/login");
      },
    });
  };

  const onFetchSessionType = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "sessionType",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setSessionType(response.json.data);
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
        }
      },
      fail: (error) => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const onFetchSessionSubType = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "sessionSubType",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setSessionSubType(response.json.data);
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
        }
      },
      fail: (error) => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const onFetchClients = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "client/list",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setClients(response.json.data);
        } else {
          notification["warning"]({
            message: "Ocorreu um erro a carregar os dados",
            description: response.json.error,
          });
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Ocorreu um erro a carregar os dados",
          description: "Ocorreu um erro a carregar os dados, por favor tente novamente.",
        });

        _auth.logout();
        history.push("/login");
      },
    });
  };

  const onFetchCountries = () => {
    fetch("https://restcountries.com/v2/all?fields=name")
      .then((response) => response.json())
      .then((data) => {
        const countries = data.map((country) => ({
          value: country.name,
          label: country.name,
        }));
        setContries(countries);
        if (clientForm.current.country === undefined) {
          clientForm.current.setFieldsValue({
            country: countries.find((country) => country.value === "Portugal").value,
          });
        }
      });
  };

  const onFinish = (values) => {
    setSubmitting(true);
    if (values["start_date"]) {
      values["start_date"] = values["start_date"].format("YYYY-MM-DD");
    }
    if (values["date_of_birth"]) {
      values["date_of_birth"] = values["date_of_birth"].format("YYYY-MM-DD");
    }
    if (id) {
      values["id"] = parseInt(id);
    }

    values["is_company"] = isCompany;
    _service({
      method: "PUT",
      url: "client",
      data: values,
      success: (response) => {
        if (response.json.result) {
          notification["success"]({
            message: "Client Saved",
            description: "Client saved successfully.",
          });
          props.history.goBack();
          setSubmitting(false);
        } else {
          notification["warning"]({
            message: "Client not saved",
            description: response.json.error,
          });
          setSubmitting(false);
        }
      },
      fail: () => {
        setSubmitting(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const onFinishFailed = (errorInfo) => {
    console.log("Failed:", errorInfo);
  };

  const toggleActivation = () => {
    _service({
      method: "PUT",
      url: "client/toggle",
      data: {
        active: !active,
        clientId: id,
      },
      success: (response) => {
        if (response.json.result) {
          notification["success"]({
            message: !active ? "Client Actived!" : "Client Inactived!",
            description: "Client Activated successfully.",
          });
          setActive(!active);
          setSubmitting(false);
        } else {
          notification["warning"]({
            message: "Client activation toggle error!",
            description: response.json.error,
          });
          setSubmitting(false);
        }
      },
      fail: () => {
        setSubmitting(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const handleDeleteRecord = () => {
    setLoading(true);
    _service({
      method: "DELETE",
      url: "client",
      data: {
        id: id,
      },
      success: (response) => {
        if (response.json.result) {
          notification["success"]({
            message: "Status updated!",
            description: "Status updated successfully.",
          });
          props.history.goBack();
          setLoading(false);
        } else {
          notification["warning"]({
            message: "Status toggle error!",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const handleTypeChange = (value) => {
    const sessionTypeObj = sessionType.find((item) => item.value === value);
    if (sessionTypeObj) {
      const newSessionSubTypeOptions = sessionSubType.filter((item) => {
        return sessionTypeObj.id == item.type_id;
      });
      const fields = clientForm.current.getFieldsValue();
      if (fields && fields.default_session_sub_type) {
        if (!newSessionSubTypeOptions.find((item) => item.value === fields.default_session_sub_type)) {
          clientForm.current.setFieldsValue({
            default_session_sub_type: undefined,
          });
        }
      }
      setSessionSubTypeOptions(newSessionSubTypeOptions);
    }
  };

  if (loading) {
    return (
      <div className="loading-wrapper">
        <div className="content-title">
          <div className="loader" aria-live="polite" aria-busy={loading}>
            {loading && <JellyTriangle color="#4b4848" />}
          </div>
        </div>
      </div>
    );
  } else {
    return (
      <div className="client">
        <div className="content-title">
          <Title className="big-title">
            <span>Client</span>
          </Title>
          <div>
            <Button className="go-back-btn" type="link" onClick={() => props.history.goBack()}>
              <ArrowLeftOutlined /> Back
            </Button>
            {id && (
              <Switch
                className="switch-client"
                checkedChildren="Active"
                unCheckedChildren="Inactive"
                checked={active}
                onChange={toggleActivation}
              />
            )}
          </div>
        </div>

        <div className="content-body">
          <Form
            {...layout}
            ref={clientForm}
            layout="vertical"
            name="basic"
            initialValues={{ remember: true }}
            onFinish={onFinish}
            onFinishFailed={onFinishFailed}
          >
            <Row className="columns-wrapper" gutter={[24, 24]}>
              <Col xs={{ span: 24 }} lg={{ span: 12 }} className="gutter-row">
                <Card title="General Info" className="two-col" bordered={false}>
                  <Form.Item name="is_company">
                    <Checkbox
                      disabled={submitting || !active}
                      checked={isCompany}
                      onChange={() => setIsCompany(!isCompany)}
                    >
                      This client is a company
                    </Checkbox>
                  </Form.Item>
                  <Form.Item
                    label="Name"
                    name="name"
                    rules={[
                      { required: true, message: "Insert Client's name" },
                      {
                        type: "string",
                        message: "Invalid name, please use only letters.",
                        pattern:
                          "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$",
                      },
                    ]}
                  >
                    <Input disabled={submitting || !active} maxLength={25} />
                  </Form.Item>
                  <Form.Item
                    label="E-mail"
                    name="email"
                    rules={[
                      { required: true, message: "Insert the e-mail." },
                      { type: "email", message: "Email not valid." },
                    ]}
                  >
                    <Input disabled={submitting || !active} maxLength={250} />
                  </Form.Item>
                  <Form.Item label="Phone" name="phone_number">
                    <Input disabled={submitting || !active} maxLength={250} />
                  </Form.Item>
                  <Space wrap>
                    <Text className="info">This client is associated with:</Text>
                    <Form.Item label="" name="client_association_id">
                      <Select
                        disabled={submitting || !active}
                        placeholder="Client"
                        allowClear
                        style={{ minWidth: 150 }}
                      >
                        {clients && clients.map((client) => <Option value={client.id}>{client.name}</Option>)}
                      </Select>
                    </Form.Item>
                  </Space>
                </Card>
              </Col>
              <Col xs={{ span: 24 }} lg={{ span: 12 }} className="gutter-row">
                {!isCompany ? (
                  <Card title="Bio Data" className="two-col" bordered={false}>
                    <Form.Item name="gender" label="Gender">
                      <Select disabled={submitting || !active} placeholder="Select a option" allowClear>
                        <Option value="male">male</Option>
                        <Option value="female">female</Option>
                        <Option value="other">other</Option>
                      </Select>
                    </Form.Item>

                    <Space wrap>
                      <Form.Item label="Date of Birth" name="date_of_birth" rules={[{ type: "date" }]}>
                        <DatePicker disabled={submitting || !active} />
                      </Form.Item>
                      <Form.Item label="Weight" name="weight" rules={[{ type: "number" }]}>
                        <InputNumber disabled={submitting || !active} maxLength={250} />
                      </Form.Item>
                      <Form.Item label="Height" name="height" rules={[{ type: "number" }]}>
                        <InputNumber disabled={submitting || !active} maxLength={250} />
                      </Form.Item>
                    </Space>
                  </Card>
                ) : (
                  <Card title="Company Info" className="two-col" bordered={false}>
                    <Form.Item label="Legal Name" name="legal_name">
                      <Input />
                    </Form.Item>
                    <Form.Item
                      label="Website"
                      name="website"
                      rules={[
                        { type: "url", warningOnly: true },
                        { type: "string", min: 6 },
                      ]}
                    >
                      <Input />
                    </Form.Item>
                  </Card>
                )}
              </Col>

              <Col xs={{ span: 24 }} lg={{ span: 24 }}>
                <Card title="Default Session Info" bordered={false}>
                  <Space size={24} wrap>
                    <Form.Item label="Session Type" name="default_session_type">
                      <Select
                        disabled={submitting || !active}
                        placeholder="Select a option"
                        allowClear
                        options={sessionType}
                        onChange={handleTypeChange}
                      />
                    </Form.Item>
                    <Form.Item label="Session Sub Type" name="default_session_sub_type">
                      <Select
                        disabled={submitting || !active}
                        placeholder="Select a option"
                        allowClear
                        options={sessionSubTypeOptions}
                      />
                    </Form.Item>
                    <Form.Item label="Session Duration" name="session_duration" rules={[{ type: "number" }]}>
                      <InputNumber disabled={submitting || !active} maxLength={10} addonAfter="min" />
                    </Form.Item>
                    <Form.Item label="Price" name="default_price" rules={[{ type: "number" }]}>
                      <InputNumber disabled={submitting || !active} maxLength={10} addonAfter="€" />
                    </Form.Item>
                    <Form.Item label="No. Session/Month" name="sessions_per_month" rules={[{ type: "number" }]}>
                      <InputNumber disabled={submitting || !active} style={{ width: 120 }} />
                    </Form.Item>
                    <Form.Item label="Start Date" name="start_date" rules={[{ type: "date" }]}>
                      <DatePicker disabled={submitting || !active} />
                    </Form.Item>
                  </Space>
                  <Text>
                    {" "}
                    <blockquote>
                      Default information - The data entered in these fields will be used for automatic filling. The
                      same customer may have sessions with varying information which can be changed manually.
                    </blockquote>
                  </Text>
                </Card>
              </Col>
              <Col xs={{ span: 24 }} lg={{ span: 24 }}>
                <Card className="client-card-big" title="Preferences" bordered={false}>
                  <Form.Item label="Goals" name="goals">
                    <TextArea disabled={submitting || !active} rows={4} />
                  </Form.Item>
                  <Form.Item label="Likes" name="likes">
                    <TextArea disabled={submitting || !active} rows={4} />
                  </Form.Item>
                  <Form.Item label="Dislikes" name="dislikes">
                    <TextArea disabled={submitting || !active} rows={4} />
                  </Form.Item>
                  <Form.Item label="Conditions" name="injuries_conditions">
                    <TextArea disabled={submitting || !active} rows={4} />
                  </Form.Item>
                </Card>
              </Col>
              <Col xs={{ span: 24 }} lg={{ span: 24 }}>
                <Card className="client-card-big" title="Legal Information - For Invoicing" bordered={false}>
                  <Row>
                    <Col xs={{ span: 24 }} lg={{ span: 24 }}>
                      <Form.Item
                        label="Address"
                        name="address"
                        rules={[
                          { required: true, message: "Insert the address" },
                          { type: "string", message: "Insert a valid address" },
                        ]}
                      >
                        <Input.TextArea rows={2} style={{ width: "100%" }} disabled={submitting} />
                      </Form.Item>
                    </Col>
                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                      <Form.Item label="VAT Number" name="vat">
                        <InputNumber style={{ width: "100%" }} disabled={submitting} />
                      </Form.Item>
                    </Col>
                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                      <Form.Item
                        label="City"
                        name="city"
                        rules={[
                          { required: true, message: "Insert the city" },
                          { type: "string", message: "Insert a valid city" },
                        ]}
                      >
                        <Input style={{ width: "100%" }} disabled={submitting} />
                      </Form.Item>
                    </Col>
                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                      <Form.Item
                        label="Postal Code"
                        name="postal_code"
                        rules={[
                          { required: true, message: "Insert the postal code" },
                          { type: "string", message: "Insert a valid postal code" },
                        ]}
                      >
                        <Input style={{ width: "100%" }} disabled={submitting} />
                      </Form.Item>
                    </Col>
                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                      <Form.Item
                        label="Country"
                        name="country"
                        rules={[
                          { required: true, message: "Insert the country" },
                          { type: "string", message: "Insert a valid country" },
                        ]}
                      >
                        <Select
                          disabled={submitting}
                          placeholder="Select a country"
                          options={contries}
                          style={{ width: "100%" }}
                        ></Select>
                      </Form.Item>
                    </Col>
                  </Row>
                </Card>
              </Col>
            </Row>

            <Form.Item>
              <Space>
                <Button type="primary" htmlType="submit" loading={submitting} disabled={!active}>
                  Save
                </Button>
                <Popconfirm
                  title="Are you sure you want to delete this CLIENT, all SESSIONS and INVOICES associated?"
                  onConfirm={() => handleDeleteRecord()}
                >
                  <Button danger>Delete</Button>
                </Popconfirm>
              </Space>
            </Form.Item>
          </Form>
        </div>
      </div>
    );
  }
}
