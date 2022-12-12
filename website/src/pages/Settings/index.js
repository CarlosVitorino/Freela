import React, { useState, useEffect, useRef } from 'react';
import { useLocation, useParams } from "react-router-dom";
import { Redirect } from "react-router-dom";
import { Typography, Card, Tabs, Row, Col, List, notification, Popconfirm, Tooltip, Form, Button, Input, InputNumber, Space, Select, Table } from 'antd';
import { DeleteFilled, EditOutlined } from '@ant-design/icons';
import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';
import Profile from '../../components/Profile';
import Company from '../../components/Company';

import './index.less';
import classNames from 'classnames';

const { Title, Text } = Typography;
const { TabPane } = Tabs;

const layout = {
    wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } },
    style: { marginBotton: 10, marginTop: 10 }
};

export default function Settings(props) {

    const [loading, setLoading] = useState(false);
    const [suppliersData, setSuppliersData] = useState([]);
    const [typesData, setTypesData] = useState([]);
    const [subTypesData, setSubTypesData] = useState([]);
    const supplierForm = useRef(null);
    const typeForm = useRef(null);
    const subTypeForm = useRef(null);

    const location = useLocation();

    useEffect(() => {
        onFetchSettings();

    }, [location]);

    const onFetchSettings = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'settings',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    if (response.json.data.suppliers) setSuppliersData(response.json.data.suppliers);
                    if (response.json.data.types) setTypesData(response.json.data.types);
                    if (response.json.data.subTypes) setSubTypesData(response.json.data.subTypes);
                } else {
                    notification["warning"]({
                        message: 'Ocorreu um erro a carregar os dados',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: () => {
                setLoading(false);
                notification["error"]({
                    message: 'Ocorreu um erro a carregar os dados',
                    description: 'Ocorreu um erro a carregar os dados, por favor tente novamente.',
                });
            }
        });
    }


    const addRecord = (values, type) => {
        setLoading(true);
        _service({
            method: 'PUT',
            url: 'settings',
            data: { ...values, type: type },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Status updated!',
                        description: 'Status updated successfully.',
                    });

                    supplierForm.current && supplierForm.current.resetFields();
                    typeForm.current && typeForm.current.resetFields();
                    subTypeForm.current && subTypeForm.current.resetFields();
                    onFetchSettings();
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

    const handleDeleteRecord = (item, type) => {
        setLoading(true);
        _service({
            method: 'DELETE',
            url: 'settings',
            data: { ...item, type: type },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Status updated!',
                        description: 'Status updated successfully.',
                    });
                    onFetchSettings();
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

    const callback = (key) => {
        console.log(key);
    }

    if (_auth.isLogged()) {
        return (
            <div className="settings">
                <div className="content-title">
                    <Title className="big-title"><span>Settings</span></Title>
                </div>
                <div className={classNames("content-body", "content-table")}>
                    <Card >
                        <Tabs defaultActiveKey="1" onChange={callback}>
                            <TabPane tab="Profile" key = "1">
                                <Profile/>
                            </TabPane>
                            <TabPane tab="Company" key = "2">
                                <Company/>
                            </TabPane>
                            <TabPane tab="Suppliers" key="3">
                                <Row {...layout}>
                                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>Supplier</Title>
                                        <Form
                                            ref={supplierForm}
                                            name="basic"
                                            labelCol={{ span: 4 }}
                                            wrapperCol={{ span: 16 }}
                                            onFinish={(values) => { addRecord(values, 'supplier') }}
                                            autoComplete="off"
                                        >
                                            <Form.Item label="id" name="id" style={{ display: 'none' }}>
                                                <InputNumber/>
                                            </Form.Item>
                                            <Form.Item
                                                label="Name"
                                                name="name"
                                                rules={[{ required: true, message: 'Please input supplier name!' }]}
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item
                                                label="Legal Name"
                                                name="legal_name"
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item
                                                label="VAT Number"
                                                name="vat"
                                            >
                                                <InputNumber style={{ width: '100%' }} />
                                            </Form.Item>
                                            <Form.Item
                                                label="Website"
                                                name="website"
                                                rules={[{ type: 'url', warningOnly: true }, { type: 'string', min: 6 }]}
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item
                                                label="Phone"
                                                name="phone"
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item wrapperCol={{ offset: 4, span: 16 }}>
                                                <Space>
                                                    <Button type="primary" htmlType="submit">Save</Button>
                                                    <Button type="secondary" onClick={() => supplierForm.current.resetFields()} >Reset</Button>
                                                </Space>
                                            </Form.Item>
                                        </Form>
                                    </Col>
                                    <Col className="list" xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>List of Suppliers</Title>
                                        <List
                                            itemLayout="vertical"
                                            dataSource={suppliersData}
                                            renderItem={item => (
                                                <List.Item className="row-wrapper">
                                                    <List.Item.Meta
                                                        title={<Text strong>{item.name}</Text>}
                                                        description={
                                                            <Space size="middle">
                                                                {item.legal_name &&
                                                                    <Space direction="vertical">
                                                                        Legal Name:
                                                                            {item.legal_name}
                                                                    </Space>
                                                                }
                                                                {item.vat &&
                                                                    <Space direction="vertical">
                                                                        VAT Number:
                                                                            {item.vat}
                                                                    </Space>
                                                                }
                                                                {item.website &&
                                                                    <Space direction="vertical">
                                                                        Website:
                                                                            {item.website}
                                                                    </Space>
                                                                }
                                                                {item.email &&
                                                                    <Space direction="vertical">
                                                                        Email:
                                                                            {item.email}
                                                                    </Space>
                                                                }
                                                                {item.phone &&
                                                                    <Space direction="vertical">
                                                                        Phone:
                                                                            {item.phone}
                                                                    </Space>
                                                                }
                                                            </Space>
                                                        }
                                                    />
                                                    <Space className="float-button">
                                                        <Popconfirm title="Are you sure, you want to DELETE this record?" onConfirm={() => handleDeleteRecord(item, 'supplier')}>
                                                            <Tooltip title="Delete">
                                                                <DeleteFilled className="action-icon" />
                                                            </Tooltip>
                                                        </Popconfirm>
                                                    <Tooltip title="Edit">
                                                            <Button type="link" className="action-icon" onClick={() => supplierForm.current.setFieldsValue(item)} icon={<EditOutlined />} />
                                                    </Tooltip>
                                                    </Space>
                                                </List.Item>
                                            )}
                                        />
                                    </Col>
                                </Row>
                            </TabPane>
                            <TabPane tab="Session Types" key="4">
                                <Row {...layout}>
                                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>Type</Title>
                                        <Form
                                            ref={typeForm}
                                            name="basic"
                                            labelCol={{ span: 4 }}
                                            wrapperCol={{ span: 16 }}
                                            onFinish={(values) => { addRecord(values, 'type') }}
                                            autoComplete="off"
                                        >
                                            <Form.Item label="id" name="id" style={{ display: 'none' }}>
                                                <InputNumber/>
                                            </Form.Item>
                                            <Form.Item
                                                label="Name"
                                                name="label"
                                                rules={[{ required: true, message: 'Please input supplier name!' }]}
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item
                                                label="Description"
                                                name="description"
                                            >
                                                <Input.TextArea rows={4} />
                                            </Form.Item>
                                            <Form.Item wrapperCol={{ offset: 4, span: 16 }}>
                                                <Space>
                                                    <Button type="primary" htmlType="submit">Save</Button>
                                                    <Button type="secondary" onClick={() => typeForm.current.resetFields()} >Reset</Button>
                                                </Space>
                                            </Form.Item>
                                        </Form>
                                    </Col>
                                    <Col className="list" xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>List of Types</Title>
                                        <List
                                            itemLayout="vertical"
                                            dataSource={typesData}
                                            renderItem={item => (
                                                <List.Item className="row-wrapper">
                                                    <List.Item.Meta
                                                        title={<Text strong>{item.label}</Text>}
                                                        description={item.description}
                                                    />
                                                    <Space className="float-button">
                                                        <Popconfirm title="Are you sure, you want to DELETE this record?" onConfirm={() => handleDeleteRecord(item, 'type')}>
                                                            <Tooltip title="Delete">
                                                                <DeleteFilled className="action-icon" />
                                                            </Tooltip>
                                                        </Popconfirm>
                                                        <Tooltip title="Edit">
                                                                <Button type="link" className="action-icon" onClick={() => typeForm.current.setFieldsValue(item)} icon={<EditOutlined />} />
                                                        </Tooltip>
                                                    </Space>
                                                </List.Item>
                                            )}
                                        />
                                    </Col>
                                </Row>
                            </TabPane>
                            <TabPane tab="Session Sub Types" key="5">
                                <Row {...layout}>
                                    <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>Sub Type</Title>
                                        <Form
                                            ref={subTypeForm}
                                            name="basic"
                                            labelCol={{ span: 4 }}
                                            wrapperCol={{ span: 16 }}
                                            onFinish={(values) => { addRecord(values, 'subType') }}
                                            autoComplete="off"
                                        >
                                            <Form.Item label="id" name="id" style={{ display: 'none' }}>
                                                <InputNumber/>
                                            </Form.Item>
                                            <Form.Item
                                                label="Name"
                                                name="label"
                                                rules={[{ required: true, message: 'Please input subtype name!' }]}
                                            >
                                                <Input />
                                            </Form.Item>
                                            <Form.Item label="Session Type" name="type_value" rules={[{ required: true, message: 'Please select the type associated!' }]}
>
                                                <Select
                                                    placeholder="Select a option"
                                                    allowClear
                                                    options={typesData}
                                                    
                                                />
                                            </Form.Item>
                                            <Form.Item
                                                label="Description"
                                                name="description"
                                            >
                                                <Input.TextArea rows={4} />
                                            </Form.Item>
                                            <Form.Item wrapperCol={{ offset: 4, span: 16 }}>
                                                <Space>
                                                    <Button type="primary" htmlType="submit">Save</Button>
                                                    <Button type="secondary" onClick={() => subTypeForm.current.resetFields()} >Reset</Button>
                                                </Space>
                                            </Form.Item>
                                        </Form>
                                    </Col>
                                    <Col className="list" xs={{ span: 24 }} lg={{ span: 12 }}>
                                        <Title level={4} style={{ marginBottom: 20 }}>List of Sub Types</Title>
                                        <List
                                            itemLayout="vertical"
                                            dataSource={subTypesData}
                                            renderItem={item => {
                                                const typeName = typesData.find((type) => type.id === item.type_id);
                                                return (
                                                    <List.Item className="row-wrapper">
                                                        <List.Item.Meta
                                                            title={<><Text strong>{item.label}</Text><Text> {typeName && ` (${typeName.label})`}</Text></>}
                                                            description={item.description}
                                                        />
                                                        <Space className="float-button">
                                                            <Popconfirm title="Are you sure, you want to DELETE this record?" onConfirm={() => handleDeleteRecord(item, 'subType')}>
                                                                <Tooltip title="Delete">
                                                                    <DeleteFilled className="action-icon" />
                                                                </Tooltip>
                                                            </Popconfirm>
                                                            <Tooltip title="Edit">
                                                                    <Button type="link" className="action-icon" onClick={() => subTypeForm.current.setFieldsValue(item)} icon={<EditOutlined />} />
                                                            </Tooltip>
                                                        </Space>
                                                        
                                                    </List.Item>
                                                )
                                            }}
                                        />
                                    </Col>
                                </Row>
                            </TabPane>
                        </Tabs>
                    </Card>
                </div>
            </div>
        );
    } else {
        return <Redirect to="/login" />;
    }
}