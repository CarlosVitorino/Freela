import React, { useContext, useState, useEffect, useRef } from 'react';
import { Redirect, withRouter } from "react-router-dom";

import { Typography, Table, Space, Input, InputNumber, Button, Popconfirm, Form, notification, Spin, Select, DatePicker, Card, Tooltip } from 'antd';
import { PlusOutlined, SaveOutlined, ReloadOutlined, FileTextOutlined, DeleteOutlined } from '@ant-design/icons';
import moment from 'moment'

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';
import classNames from 'classnames';

import './index.less';

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
        if (dataIndex === 'date') {
            form.setFieldsValue({
                [dataIndex]: moment(record[dataIndex]),
            });
        } else {
            form.setFieldsValue({
                [dataIndex]: record[dataIndex],
            });
        }

    };

    const save = async () => {
        try {
            const values = await form.validateFields();
            toggleEdit();
            handleSave({ ...record, ...values, dataIndex });
        } catch (errInfo) {
            console.log('Save failed:', errInfo);
        }
    };

    const customSave = async (value) => {
        try {
            if (dataIndex === 'date') {
                form.setFieldsValue({ [dataIndex]: moment(value) })

            } else {
                form.setFieldsValue({ [dataIndex]: value })

            }
            const values = await form.validateFields();
            toggleEdit();
            onChange ? onChange({ ...record, ...values, dataIndex }) : handleSave({ ...record, ...values, dataIndex });
        } catch (errInfo) {
            console.log('Save failed:', errInfo);
        }
    }

    let childNode = children;

    if (editable) {
        let input = <Input ref={inputRef} onPressEnter={save} onBlur={save} />;
        if (inputType === 'number') {
            input = <InputNumber ref={inputRef} onPressEnter={save} onBlur={save} />;
        }
        if (inputType === 'select') {
            input = (
                <div>
                    <Select
                        style={{ width: 220 }}
                        ref={inputRef}
                        onChange={customSave}
                    >
                        {dataSource}
                    </Select>
                </div>
            )
        }
        if (inputType === 'date') {
            input = <DatePicker ref={inputRef} onPressEnter={save} onBlur={save} />
        }

        childNode = editing ? (
            <Form.Item
                style={{
                    margin: 0,
                }}
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
                style={{
                    paddingRight: 24,
                }}
                onClick={toggleEdit}
            >
                {children}
            </div>
        );
    }

    return <td {...restProps}>{childNode}</td>;
};

class Session extends React.Component {
    constructor(props) {
        super(props);
        this.columns = [
            {
                title: 'Client',
                dataIndex: 'client_name',
                key: 'client_name',
                width: 200,
                inputType: 'select',
                editable: true,
            },
            {
                title: 'Date',
                dataIndex: 'date',
                key: 'date',
                width: 150,
                editable: true,
                inputType: 'date'
            },
            {
                title: 'Duration',
                dataIndex: 'duration',
                key: 'duration',
                width: 120,
                editable: true,
                inputType: 'number'
            },
            {
                title: 'Price',
                dataIndex: 'price',
                key: 'price',
                width: 120,
                editable: true,
                inputType: 'number'
            },
            {
                title: 'Type',
                dataIndex: 'session_type',
                key: 'session_type',
                width: 150,
                editable: true,
                inputType: 'select'
            },
            {
                title: 'Sub Type',
                dataIndex: 'session_sub_type',
                key: 'session_sub_type',
                width: 150,
                editable: true,
                inputType: 'select'
            },
            {
                title: 'operation',
                dataIndex: 'operation',
                width: 150,
                render: (_, record) =>
                    this.state.sessionsDataFiltered.length >= 1 ? (
                        <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(record.key)}>
                            <Tooltip title="Delete">
                                <DeleteOutlined className="action-icon"/>
                            </Tooltip>
                        </Popconfirm>
                    ) : null,
            },
        ];
        this.state = {
            sessionsData: [],
            sessionsDataFiltered: [],
            originalSessionData: [],
            clientsData: [],
            sessionTypesData: [],
            sessionSubTypesData: [],
            sessionSubTypesOptions: [],
            selectedSessions: [],
            isChanged: false,
            loading: false,
            count: 0,
            datesFilter: [],
            typeFilter: false,
            queryFilter: false,
            clientFilter: false
        };
    }

    componentDidMount() {
        this.onFetchSessions();
        this.onFetchClients();
        this.onFetchSessionType();
        this.onFetchSessionSubType();
    }

    onFetchSessions = () => {
        this.setLoading(true);
        _service({
            method: 'GET',
            url: 'session',
            success: (response) => {
                this.setLoading(false);
                if (response.json.result) {
                    const data = response.json.data;
                    this.setState({ sessionsData: data, sessionsDataFiltered: data, originalSessionData: data, count: data.length > 0 ? data[data.length - 1].key : 0, isChanged: false });
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    this.setLoading(false);
                }
            },
            fail: () => {
                this.setLoading(false);
                notification["error"]({
                    message: 'There was an error fetching data',
                    description: 'There was an error fetching data, please contact your boyfriend.',
                });
            }
        });
    }

    onFetchClients = () => {
        this.setLoading(true);
        _service({
            method: 'GET',
            url: 'client',
            success: (response) => {
                this.setLoading(false);
                if (response.json.result) {
                    this.setState({ clientsData: response.json.data });
                } else {
                    notification["warning"]({
                        message: 'Ocorreu um erro a carregar os dados',
                        description: response.json.error,
                    });
                    this.setLoading(false);
                }
            },
            fail: () => {
                this.setLoading(false);
                notification["error"]({
                    message: 'Ocorreu um erro a carregar os dados',
                    description: 'Ocorreu um erro a carregar os dados, por favor tente novamente.',
                });
            }
        });
    }

    onFetchSessionType = () => {
        this.setLoading(true);
        _service({
            method: 'GET',
            url: 'sessionType',
            success: (response) => {
                this.setLoading(false);
                if (response.json.result) {
                    this.setState({ sessionTypesData: response.json.data });
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    this.setLoading(false);
                }
            },
            fail: (error) => {
                this.setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    onFetchSessionSubType = () => {
        this.setLoading(true);
        _service({
            method: 'GET',
            url: 'sessionSubType',
            success: (response) => {
                this.setLoading(false);
                if (response.json.result) {
                    this.setState({ sessionSubTypesData: response.json.data });
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    this.setLoading(false);
                }
            },
            fail: (error) => {
                this.setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    handlePersistData = () => {
        this.setLoading(true);
        const { originalSessionData, clientsData, sessionTypesData, sessionSubTypesData } = this.state;
        const sessionsData = [...this.state.sessionsData];

        const toCreate = this.onlyInLeft(sessionsData, originalSessionData, this.isSameKey);
        const toDelete = this.onlyInLeft(originalSessionData, sessionsData, this.isSameKey);

        for (let key in toCreate) {
            let session = toCreate[key];
            if (session) {
                const client = clientsData.filter(clientData => clientData.name === session['client_name'])[0];
                const sessionType = sessionTypesData.filter(sessionType => sessionType.label === session['session_type'])[0];
                const sessionSubType = sessionSubTypesData.filter(sessionSubType => sessionSubType.label === session['session_sub_type'])[0];
                if (client) {
                    session['client_id'] = client.id;
                }
                if (sessionType) {
                    session['type_id'] = sessionType.id;
                }
                if (sessionSubType) {
                    session['sub_type_id'] = sessionSubType.id;
                }
                session['date'] = moment(session['date']).format('YYYY-MM-DD HH:mm:ss')
                session['price'] = parseFloat(session['price']).toFixed(2);
            }
        }


        _service({
            method: 'POST',
            url: 'session',
            data: { toCreate, toDelete },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Sessions Saved!',
                        description: 'Sessions saved successfully.',
                    });
                    //this.setState({sessionsDataFiltered: sessionsData});
                    this.onFetchSessions();
                    this.setLoading(false);
                } else {
                    notification["warning"]({
                        message: 'Sessions not saved!',
                        description: response.json.error,
                    });
                    this.setLoading(false);
                }
            },
            fail: () => {
                this.setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    isSameKey = (leftValue, rightValue) => leftValue.key === rightValue.key;

    // Get items that only occur in the left array,
    // using the compareFunction to determine equality.
    onlyInLeft = (left, right, compareFunction) =>
        left.filter(leftValue =>
            !right.some(rightValue =>
                compareFunction(leftValue, rightValue)));


    setLoading = (state) => {
        this.setState({ loading: state });
    }

    handleDelete = (key) => {
        const sessionsDataFiltered = [...this.state.sessionsDataFiltered];
        const sessionsData = [...this.state.sessionsData];

        this.setState({
            sessionsDataFiltered: sessionsDataFiltered.filter((item) => item.key !== key),
            sessionsData: sessionsData.filter((item) => item.key !== key),
            isChanged: true
        });
    };

    handleAdd = () => {
        const { count, sessionsDataFiltered } = this.state;
        const newData = {
            key: "new_" + count
        };
        this.setState({
            sessionsDataFiltered: [newData, ...sessionsDataFiltered],
            count: count + 1,
            isChanged: true
        });
    };

    handleSave = (row) => {
        const newDataFiltered = [...this.state.sessionsDataFiltered];
        const newData = [...this.state.sessionsData];
        const { sessionTypesData, sessionSubTypesData, sessionSubTypesOptions } = this.state;
        const index = newDataFiltered.findIndex((item) => row.key === item.key);
        const item = newDataFiltered[index];
        let sessionSubTypeOptionsNew = [];

        if (row.dataIndex === 'date' && moment.isMoment(row.date)) {
            const tempRow = { ...row };
            const newDate = tempRow.date.format('YYYY-MM-DD');
            row['date'] = newDate;

        } else if (row.dataIndex === 'session_type') {
            const sessionType = sessionTypesData.find(sessionType => sessionType.value === row.session_type);
            sessionSubTypeOptionsNew = sessionSubTypesData.filter((item) => {
                return item.type_id == sessionType.id;
            });
            const tempRow = { ...row };
            row['session_type'] = sessionType.label;
        }
        else if (row.dataIndex === 'session_sub_type') {
            const sessionSubType = sessionSubTypesData.find(sessionSubType => sessionSubType.value === row.session_sub_type);
            row['session_sub_type'] = sessionSubType.label;
        }

        newDataFiltered.splice(index, 1, { ...item, ...row });
        newData.find((item) => row.key === item.key) ? newData.splice(index, 1, { ...item, ...row }) : newData.splice(index, 0, { ...item, ...row });
        this.setState({
            sessionsDataFiltered: newDataFiltered,
            sessionsData: newData,
            sessionSubTypesOptions: (sessionSubTypeOptionsNew ? sessionSubTypeOptionsNew : sessionSubTypesOptions)
        });
    };

    handleClientChange = (row) => {
        const newDataFiltered = [...this.state.sessionsDataFiltered];
        const newData = [...this.state.sessionsData];
        let { clientsData, sessionTypesData, sessionSubTypesData, sessionSubTypesOptions } = this.state;
        let sessionSubTypeOptionsNew = [];

        const index = newDataFiltered.findIndex((item) => row.key === item.key);
        let item = newDataFiltered[index];
        const client = clientsData.filter(clientData => clientData.id === Number(row.client_name))[0];
        const sessionType = sessionTypesData.filter(sessionType => sessionType.id === client.default_session_type_id)[0];
        const sessionSubType = sessionSubTypesData.filter(sessionSubType => sessionSubType.id === client.default_session_sub_type_id)[0];

        row = {
            key: item.key,
            client_name: client.name,
            date: moment().format('YYYY-MM-DD'),
            duration: client.session_duration,
            price: client.default_price,
            session_type: sessionType ? sessionType.label : client.default_session_type_id,
            session_sub_type: sessionSubType ? sessionSubType.label : client.default_session_sub_type_id
        }

        newDataFiltered.splice(index, 1, { ...item, ...row });
        newData.find((item) => row.key === item.key) ? newData.splice(index, 1, { ...item, ...row }) : newData.splice(index, 0, { ...item, ...row });

        sessionSubTypeOptionsNew = sessionSubTypesData.filter((item) => {
            return item.type_id === (sessionType ? sessionType.id : client.default_session_type_id);
        });

        this.setState({
            sessionsDataFiltered: newDataFiltered,
            sessionsData: newData,
            sessionSubTypesOptions: (sessionSubTypeOptionsNew ? sessionSubTypeOptionsNew : sessionSubTypesOptions)
        });
    }

    filter = (datesFilter, typeFilter, clientFilter, queryFilter) => {
        const { sessionsData, sessionTypesData, clientsData } = this.state;
        let newFilteredData = sessionsData;

        if (queryFilter) {
            newFilteredData = newFilteredData.filter((sessionData) => {
                let exist = false;
                for (var prop in sessionData) {
                    if (Object.prototype.hasOwnProperty.call(sessionData, prop)) {
                        console.log(sessionData[prop])
                        if (sessionData[prop].toString().indexOf(queryFilter) !== -1) exist = true;
                    }
                }
                return exist;
            });
        }
        if (typeFilter) {
            newFilteredData = newFilteredData.filter((sessionData) => {
                const sessionType = sessionTypesData.find(sessionTypeData => sessionTypeData.id == sessionData.type_id);
                return typeFilter === sessionType.value;
            });
        }
        if (clientFilter) {
            newFilteredData = newFilteredData.filter((sessionData) => {
                const client = clientsData.find(clientData => clientData.name === sessionData.client_name);
                return clientFilter === client.id.toString();
            });
        }
        if (datesFilter && datesFilter[0] && datesFilter[1]) {
            newFilteredData = newFilteredData.filter((sessionData) => {
                return moment(sessionData.date).isBetween(datesFilter[0], datesFilter[1]) || moment(sessionData.date).isSame(datesFilter[0]) || moment(sessionData.date).isSame(datesFilter[1]);

            });

        }

        this.setState({ sessionsDataFiltered: newFilteredData, datesFilter, typeFilter, clientFilter, queryFilter });

    }

    isEditable = (record) => {
        const { sessionsDataFiltered } = this.state;
        return record.key === sessionsDataFiltered[0].key && String(record.key).includes("new");
    }

    rowSelection = {
        onChange: (selectedRowKeys: React.Key[], selectedRows: DataType[]) => {
            console.log(`selectedRowKeys: ${selectedRowKeys}`, 'selectedRows: ', selectedRows);
            this.setState({ selectedSessions: selectedRowKeys })
        }
    };

    render() {
        const { Title } = Typography;
        const { sessionsDataFiltered, sessionSubTypesOptions, selectedSessions, originalSessionData, sessionTypesData, clientsData, datesFilter, typeFilter, clientFilter, queryFilter } = this.state;
        const components = {
            body: {
                row: EditableRow,
                cell: EditableCell,
            },
        };
        const columns = this.columns.map((col) => {
            if (!col.editable) {
                return col;
            }

            return {
                ...col,
                onCell: (record) => {
                    let dataSource = [];
                    let onChange = null;
                    if (col.key === 'client_name' && clientsData) {
                        dataSource = clientsData.map(clientData => (
                            <Option key={clientData.id}>{clientData.name}</Option>
                        ));
                        onChange = this.handleClientChange;
                    }
                    if (col.key === 'session_type' && sessionTypesData) {
                        dataSource = sessionTypesData.map(sessionType => (
                            <Option key={sessionType.value}>{sessionType.label}</Option>
                        ));
                    }
                    if (col.key === 'session_sub_type' && sessionSubTypesOptions) {
                        dataSource = sessionSubTypesOptions.map(sessionSubType => (
                            <Option key={sessionSubType.value}>{sessionSubType.label}</Option>
                        ));
                    }
                    return ({
                        record,
                        inputType: col.inputType,
                        editable: col.editable && this.isEditable(record),
                        dataIndex: col.dataIndex,
                        title: col.title,
                        onChange: onChange,
                        dataSource: dataSource,
                        handleSave: this.handleSave,
                    })
                },
            };
        });
        if (_auth.isLogged()) {
            if (this.state.loading) {
                return (
                    <div className="loading-wrapper">
                        <div className="content-title">
                            <Title level={2}><Spin /> Loading...</Title>
                        </div>
                    </div>
                );
            } else {
                return (
                    <div className="sessions">
                        <div className="content-title">
                                <Title className="big-title"><span>Sessions</span></Title>   
                        </div>
                        <div className={classNames("content-body", "content-table")}>
                            <Card >
                            <div className="actions-n-filters">
                                    <Space style={{ marginBottom: 16 }} wrap>
                                        <Button type="primary" icon={<PlusOutlined />} onClick={this.handleAdd}>Add Session</Button>
                                        <RangePicker onChange={(dates, dateStrings) => { this.filter(dateStrings, typeFilter, clientFilter, queryFilter); }} />
                                        <Select placeholder="Type filter" allowClear style={{ width: 120 }} onChange={(type) => { this.filter(datesFilter, type, clientFilter, queryFilter); }}>
                                            {sessionTypesData.map(sessionType => (
                                                <Option key={sessionType.value}>{sessionType.label}</Option>
                                            ))}
                                        </Select>
                                        <Select placeholder="Client filter" allowClear style={{ width: 120 }} onChange={(client) => { this.filter(datesFilter, typeFilter, client, queryFilter); }}>
                                            {clientsData.map(clientData => (
                                                <Option key={clientData.id}>{clientData.name}</Option>
                                            ))}
                                        </Select>
                                        <Input placeholder="Search..." onChange={(q) => { this.filter(datesFilter, typeFilter, clientFilter, q.target.value); }} />
                                    </Space>
                                    <div className="save-cancel" style={{display:  this.state.isChanged ? 'block' : 'none' }}>
                                        <Space wrap>
                                            <Button type="primary" icon={<SaveOutlined />} onClick={this.handlePersistData}>Save</Button>
                                            <Popconfirm title="Any change you made, will be lost, you want to continue?" onConfirm={() => { this.setState({ sessionsDataFiltered: originalSessionData }) }}>
                                                <Button icon={<ReloadOutlined />}>Reset</Button>
                                            </Popconfirm>
                                        </Space>
                                    </div>
                                </div>
                                <Table
                                    components={components}
                                    rowClassName={() => 'editable-row'}
                                    bordered
                                    dataSource={sessionsDataFiltered}
                                    columns={columns}
                                    pagination={{ pageSize: 10 }}
                                    rowSelection={this.rowSelection}
                                    scroll = {{x:''}}
                                />
                                <div className="save-n-reset">
                                    <Space style={{ marginTop: 16 }}>
                                        <Button type="primary" icon={<FileTextOutlined />} disabled={!selectedSessions.length} onClick={event => { this.props.history.push({ pathname: '/finance/invoice', ids: selectedSessions }); }}>Create Invoice</Button>
                                    </Space>
                                </div>
                            </Card>
                        </div>
                    </div>
                );
            }
        } else {
            return <Redirect to="/login" />;
        }
    }
}

export default withRouter(Session);
