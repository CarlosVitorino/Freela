import React, { useState, useEffect, useRef } from 'react';
import { useLocation, useParams } from "react-router-dom";
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Typography, Form, Input, InputNumber, DatePicker, Button, notification, Spin, Select, Row, Col, Card, Space, Switch, Popconfirm } from 'antd';
import moment from 'moment'
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;

export default function Detail(props) {

    const [loading, setLoading] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [sessionType, setSessionType] = useState(false);
    const [sessionSubType, setSessionSubType] = useState(false);
    const [sessionSubTypeOptions, setSessionSubTypeOptions] = useState(false);
    const [active, setActive] = useState(true);
    const { id } = useParams();
    const location = useLocation();
    const clientForm = useRef(null);

    const { Option } = Select;
    const { TextArea } = Input;
    const layout = {
        wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } }
    };

    const colStyle = { padding: '8px 10px' };

    useEffect(() => {
        if (clientForm.current && id) onFetchDetail();
        onFetchSessionType();
        onFetchSessionSubType();
    }, [location]);

    const onFetchDetail = () => {

        setLoading(true);
        _service({
            method: 'GET',
            url: 'client/detail',
            data: { clientId: parseInt(id) },
            success: (response) => {
                setLoading(false);
                if (response.json.result && response.json.data.length == 1) {
                    let data = response.json.data[0];
                    if (data['start_date']) {
                        data['start_date'] = moment(data['start_date']);
                    }

                    setActive(data['active']);
                    clientForm.current.setFieldsValue(data);
                } else {
                    notification["warning"]({
                        message: 'Ocorreu um erro a carregar os dados',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: (error) => {
                setLoading(false);
                notification["error"]({
                    message: 'Ocorreu um erro a carregar os dados',
                    description: 'Ocorreu um erro a carregar os dados, por favor tente novamente.',
                });
            }
        });
    }

    const onFetchSessionType = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'sessionType',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setSessionType(response.json.data);
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: (error) => {
                setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const onFetchSessionSubType = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'sessionSubType',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setSessionSubType(response.json.data);
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: (error) => {
                setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const onFinish = (values) => {
        setSubmitting(true);
        if (values['start_date']) {
            values['start_date'] = values['start_date'].format('YYYY-MM-DD');
        }
        _service({
            method: 'PUT',
            url: 'client',
            data: values,
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Client Created',
                        description: 'New client created successfully.',
                    });
                    setSubmitting(false);
                } else {
                    notification["warning"]({
                        message: 'Client not created',
                        description: response.json.error,
                    });
                    setSubmitting(false);

                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const onFinishFailed = (errorInfo) => {
        console.log('Failed:', errorInfo);
    }

    const toggleActivation = () => {
        _service({
            method: 'PUT',
            url: 'client/toggle',
            data: {
                "active": !active,
                "clientId": id
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: !active ? 'Client Actived!' : 'Client Inactived!',
                        description: 'Client Activated successfully.',
                    });
                    setActive(!active);
                    setSubmitting(false);
                } else {
                    notification["warning"]({
                        message: 'Client activation toggle error!',
                        description: response.json.error,
                    });
                    setSubmitting(false);

                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const handleDeleteRecord = () => {
        setLoading(true);
        _service({
            method: 'DELETE',
            url: 'client',
            data: {
                "id": id
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Status updated!',
                        description: 'Status updated successfully.',
                    });
                    props.history.goBack();
                    setLoading(false);
                } else {
                    notification["warning"]({
                        message: 'Status toggle error!',
                        description: response.json.error,
                    });
                    setLoading(false);

                }
            },
            fail: () => {
                setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const handleTypeChange = (value) => {
        const sessionTypeObj = sessionType.find( (item) => item.value === value);
        if(sessionTypeObj) {
            setSessionSubTypeOptions(sessionSubType.filter((item) => {
                return sessionTypeObj.id == item.type_id;
            }));
        }
    }

    const deleteDisclamer = (
        <div>
          <p>Content</p>
          <p>Content</p>
        </div>
      );


    if (loading) {
        return (
            <div className="loading-wrapper">
                <div className="content-title">
                    <Title level={2}><Spin /> Loading...</Title>
                </div>
            </div>
        );
    } else {
        return (
            <div>
                <div className="content-title">
                    <Button className="go-back-btn" type="link" onClick={() => props.history.goBack()}><ArrowLeftOutlined /> Back</Button>
                </div>
                <div className="content-title">
                    {id && <Switch className="switch-client" checkedChildren="Active" unCheckedChildren="Inactive" checked={active} onChange={toggleActivation} />}
                    <Title level={2}>New Client</Title>
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
                        <Row>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                                <Card className="client-card-left" title="General Info" bordered={false}>
                                    <Row>
                                        <Col span={24}>
                                            <Form.Item
                                                label="Name"
                                                name="name"
                                                rules={[
                                                    { required: true, message: 'Insert Client\'s name' },
                                                    { type: 'string', message: 'Invalid name, please use only letters.', pattern: "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" }
                                                ]}
                                            >
                                                <Input disabled={submitting || !active} maxLength={25} />
                                            </Form.Item>
                                            <Form.Item
                                                label="E-mail"
                                                name="email"
                                                rules={[
                                                    { required: true, message: 'Insert the e-mail.' },
                                                    { type: 'email', message: 'Email not valid.' }
                                                ]}
                                            >
                                                <Input disabled={submitting || !active} maxLength={250} />
                                            </Form.Item>
                                            <Form.Item
                                                label="Phone"
                                                name="phone_number"
                                                rules={[
                                                    { required: true, message: 'Insert the phone number.' },
                                                ]}
                                            >
                                                <Input disabled={submitting || !active} maxLength={250} />
                                            </Form.Item>
                                        </Col>
                                        <Col span={12}>
                                            <Form.Item label="Price" name="default_price" rules={[{ type: 'number' }]}>
                                                <InputNumber disabled={submitting || !active} maxLength={10} addonAfter="€" />
                                            </Form.Item>
                                        </Col>
                                        <Col span={12}>
                                            <Form.Item label="Session Duration" name="session_duration" rules={[{ type: 'number' }]}>
                                                <InputNumber disabled={submitting || !active} maxLength={10} addonAfter="min" />
                                            </Form.Item>
                                        </Col>
                                        <Col span={24}>
                                            <Space>
                                                <Form.Item label="Start Date" name="start_date" rules={[{ type: 'date' }]}>
                                                    <DatePicker disabled={submitting || !active} />
                                                </Form.Item>
                                                <Form.Item label="Session/Month" name="sessions_per_month" rules={[{ type: 'number' }]}>
                                                    <InputNumber disabled={submitting || !active} maxLength={250} />
                                                </Form.Item>
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
                                            </Space>
                                        </Col>
                                    </Row>
                                </Card>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                                <Card className="client-card-right" title="Bio Data" bordered={false} >
                                    <Form.Item name="gender" label="Gender">
                                        <Select
                                            disabled={submitting || !active}
                                            placeholder="Select a option"
                                            allowClear
                                        >
                                            <Option value="male">male</Option>
                                            <Option value="female">female</Option>
                                            <Option value="other">other</Option>
                                        </Select>
                                    </Form.Item>
                                    <Form.Item label="Age" name="age" rules={[{ type: 'number' }]} >
                                        <InputNumber disabled={submitting || !active} maxLength={250} />
                                    </Form.Item>
                                    <Space>
                                        <Form.Item label="Weight" name="weight" rules={[{ type: 'number' }]}>
                                            <InputNumber disabled={submitting || !active} maxLength={250} />
                                        </Form.Item>
                                        <Form.Item label="Height" name="height" rules={[{ type: 'number' }]}>
                                            <InputNumber disabled={submitting || !active} maxLength={250} />
                                        </Form.Item>
                                    </Space>

                                </Card>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 24 }} style={colStyle}>
                                <Card className="client-card-big" title="Preferences" bordered={false} >
                                    <Form.Item label="Goals" name="goals" >
                                        <TextArea disabled={submitting || !active} rows={4} />
                                    </Form.Item>
                                    <Form.Item label="Likes" name="likes" >
                                        <TextArea disabled={submitting || !active} rows={4} />
                                    </Form.Item>
                                    <Form.Item label="Dislikes" name="dislikes" >
                                        <TextArea disabled={submitting || !active} rows={4} />
                                    </Form.Item>
                                    <Form.Item label="Injuries/ Conditions" name="injuries_conditions" >
                                        <TextArea disabled={submitting || !active} rows={4} />
                                    </Form.Item>
                                </Card>
                            </Col>
                        </Row>


                        <Form.Item>
                            <Space>
                                <Button type="primary" htmlType="submit" loading={submitting} disabled={!active}>
                                    Save
                                </Button>
                                <Popconfirm title="This action will permanently delete this CLIENT, all SESSIONS and INVOICES associated. Are you sure?"  onConfirm={() => handleDeleteRecord()}>
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