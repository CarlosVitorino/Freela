import React, { useState, useEffect, useContext, useRef } from "react";
import { useNavigate, Navigate } from "react-router-dom"; // Use useNavigate instead of withRouter
import {
  Typography,
  Table,
  Space,
  Input,
  InputNumber,
  Button,
  Popconfirm,
  Form,
  notification,
  Spin,
  Select,
  DatePicker,
  Card,
  Tooltip,
} from "antd";
import {
  PlusOutlined,
  SaveOutlined,
  ReloadOutlined,
  FileTextOutlined,
  DeleteOutlined,
  EditOutlined,
} from "@ant-design/icons";
import moment from "moment";
import { JellyTriangle } from "@uiball/loaders";

import _auth from "@netuno/auth-client";
import _service from "@netuno/service-client";
import classNames from "classnames";

import "./index.less";

const EditableContext = React.createContext(null);
const { Option } = Select;
const { RangePicker } = DatePicker;

const EditableRow = ({ index, ...props }) => {
  const [form] = Form.useForm();
  return (
    <Form form={form} component={false}>
      <EditableContext.Provider value={form}>
        <tr {...props} />
      </EditableContext.Provider>
    </Form>
  );
};

const EditableCell = ({
  title,
  editable,
  children,
  dataIndex,
  record,
  handleSave,
  inputType,
  onChange,
  dataSource,
  ...restProps
}) => {
  const [editing, setEditing] = useState(false);
  const inputRef = useRef(null);
  const form = useContext(EditableContext);
  
  useEffect(() => {
    if (editing) {
      inputRef.current.focus();
    }
  }, [editing]);

  const toggleEdit = () => {
    setEditing(!editing);
    if (dataIndex === "date") {
      form.setFieldsValue({ [dataIndex]: moment(record[dataIndex]) });
    } else {
      form.setFieldsValue({ [dataIndex]: record[dataIndex] });
    }
  };

  const save = async () => {
    try {
      const values = await form.validateFields();
      toggleEdit();
      handleSave({ ...record, ...values, dataIndex });
    } catch (errInfo) {
      console.log("Save failed:", errInfo);
    }
  };

  const customSave = async (value) => {
    try {
      if (dataIndex === "date") {
        form.setFieldsValue({ [dataIndex]: moment(value) });
      } else {
        form.setFieldsValue({ [dataIndex]: value });
      }
      const values = await form.validateFields();
      toggleEdit();
      onChange ? onChange({ ...record, ...values, dataIndex }) : handleSave({ ...record, ...values, dataIndex });
    } catch (errInfo) {
      console.log("Save failed:", errInfo);
    }
  };

  let childNode = children;

  if (editable) {
    let input = <Input ref={inputRef} onPressEnter={save} onBlur={save} />;
    if (inputType === "number") {
      input = <InputNumber ref={inputRef} onPressEnter={save} onBlur={save} />;
    }
    if (inputType === "select") {
      input = (
        <div>
          <Select
            style={{ width: 220 }}
            ref={inputRef}
            onChange={customSave}
            showSearch
            filterOption={(input, option) => option.items.toLowerCase().indexOf(input.toLowerCase()) >= 0}
            filterSort={(optionA, optionB) =>
              optionA.items.toLowerCase().localeCompare(optionB.items.toLowerCase())
            }
          >
            {dataSource}
          </Select>
        </div>
      );
    }
    if (inputType === "date") {
      input = <DatePicker ref={inputRef} onPressEnter={save} onBlur={save} />;
    }

    childNode = editing ? (
      <Form.Item
        style={{ margin: 0 }}
        name={dataIndex}
        rules={[
          {
            required: true,
            message: `${title} is required.`,
          },
        ]}
      >
        {input}
      </Form.Item>
    ) : (
      <div
        className="editable-cell-value-wrap"
        style={{ paddingRight: 24 }}
        onClick={toggleEdit}
      >
        {children}
      </div>
    );
  }

  return <td {...restProps}>{childNode}</td>;
};

const Session = () => {
  const navigate = useNavigate(); // Use useNavigate hook
  const [state, setState] = useState({
    sessionsData: [],
    sessionsDataFiltered: [],
    originalSessionData: [],
    clientsData: [],
    sessionTypesData: [],
    sessionSubTypesData: [],
    sessionSubTypesOptions: [],
    selectedSessions: [],
    editKey: null,
    isChanged: false,
    loading: false,
    count: 0,
    datesFilter: [],
    typeFilter: false,
    queryFilter: false,
    clientFilter: false,
  });

  useEffect(() => {
    onFetchSessions();
    onFetchClients();
    onFetchSessionType();
    onFetchSessionSubType();
  }, []);

  const setLoading = (state) => {
    setState((prevState) => ({ ...prevState, loading: state }));
  };

  const onFetchSessions = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "session",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          const data = response.json.data;
          setState((prevState) => ({
            ...prevState,
            sessionsData: data,
            sessionsDataFiltered: data,
            originalSessionData: data,
            count: data.length > 0 ? data[data.length - 1].key : 0,
            isChanged: false,
            editKey: false,
          }));
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "There was an error fetching data",
          description: "There was an error fetching data, please contact support.",
        });
      },
    });
  };

  const onFetchClients = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "client",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setState((prevState) => ({ ...prevState, clientsData: response.json.data }));
        } else {
          notification["warning"]({
            message: "Ocorreu um erro a carregar os dados",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Ocorreu um erro a carregar os dados",
          description: "Ocorreu um erro a carregar os dados, por favor tente novamente.",
        });

        _auth.logout();
        navigate("/login");
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
          setState((prevState) => ({ ...prevState, sessionTypesData: response.json.data }));
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact the support.",
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
          setState((prevState) => ({ ...prevState, sessionSubTypesData: response.json.data }));
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact the support.",
        });
      },
    });
  };

  const onFilter = () => {
    // Filtering logic
  };

  const onSave = () => {
    // Save logic
  };

  const onAddNew = () => {
    // Add new logic
  };

  const onChangeData = (data) => {
    // Handle data change
  };

  const onDelete = (record) => {
    // Delete logic
  };

  const columns = [
    // Define your columns here
  ];

  return (
    <div className="session-container">
      {/* Your component JSX */}
      <Table
        components={{
          body: {
            row: EditableRow,
            cell: EditableCell,
          },
        }}
        bordered
        dataSource={state.sessionsDataFiltered}
        columns={columns}
        rowKey="key"
        pagination={false}
        loading={state.loading}
        onChange={onChangeData}
      />
      <Button onClick={onAddNew}>Add New</Button>
      <Button onClick={onSave} disabled={!state.isChanged}>Save</Button>
      <Popconfirm title="Are you sure to delete?" onConfirm={onDelete}>
        <Button>Delete</Button>
      </Popconfirm>
    </div>
  );
};

export default Session;
