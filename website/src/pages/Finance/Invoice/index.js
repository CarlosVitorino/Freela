import React, { useState, useEffect, useRef } from 'react';
import { useLocation } from "react-router-dom";
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Typography, Form, Table, DatePicker, Button, notification, Spin, Select, Row, Col, Card, Space} from 'antd';
import moment from 'moment'
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const { Text } = Typography;
const { RangePicker } = DatePicker;

export default function Invoice(props) {

    const [loading, setLoading] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [sessionsData, setSessionsData] = useState(false);
    const [clientsData, setClientsData] = useState(false);
    const [totalValue, setTotalValue] = useState(false);

    const location = useLocation();
    const invoiceForm = useRef(null);

    const { Option } = Select;
    const columns = [
        {
            title: 'Client',
            dataIndex: 'client_name',
            key: 'client_name',
            width: 230,
        },
        {
            title: 'Price',
            dataIndex: 'price',
            key: 'price',
            render: text => <a>{text} €</a>,

        },
        {
            title: 'Date',
            dataIndex: 'date',
            key: 'date',
        },
        {
            title: 'Duration',
            dataIndex: 'duration',
            key: 'duration',
        },
        {
            title: 'Type',
            dataIndex: 'session_type',
            key: 'session_type',
            width: 130,
        },
    ];
    const layout = {
        wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } }
    };
    const colStyle = { padding: '8px 10px' }

    useEffect(() => {
        if (location.ids) onFetchSessions();
        onFetchClients();
    }, [location]);


    const onFetchSessions = () => {
        setLoading(true);
        _service({
            method: 'POST',
            url: 'session/list',
            data: { sessionIds: location.ids.join(", ") },
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setSessionsData(response.json.data);
                    let totalValue = 0;
                    response.json.data.forEach((session) => {
                        totalValue += session.price;
                    });
                    setTotalValue(Math.round(totalValue * 100) / 100 + "€");
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: () => {
                setLoading(false);
                notification["error"]({
                    message: 'There was an error fetching data',
                    description: 'There was an error fetching data, please contact your boyfriend.',
                });
            }
        });
    }

    const onFetchClients = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'client',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setClientsData(response.json.data);
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

    const onFinish = (values) => {
        setSubmitting(true);
        
        values['pay_day'] = values['pay_day'].format('YYYY-MM-DD');
        values['created_at'] = moment().format('YYYY-MM-DD');
        values['billing_period'] = values['billing_period'][0].format('YYYY-MM-DD') + " - " + values['billing_period'][1].format('YYYY-MM-DD');
        values['sessions'] = JSON.stringify(location.ids);
        values['total_amount'] = Number(totalValue.replace(/\€/g, ''));
        _service({
            method: 'PUT',
            url: 'invoice',
            data: values,
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Invoice Created',
                        description: 'New invoice created successfully.',
                    });
                    setSubmitting(false);
                    props.history.goBack();

                    
                } else {
                    notification["warning"]({
                        message: 'Invoice not created',
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
                    <Title level={2}>Invoice</Title>
                </div>
                <div className="content-body">
                    <Form
                        {...layout}
                        ref={invoiceForm}
                        layout="vertical"
                        name="basic"
                        onFinish={onFinish}
                        onFinishFailed={onFinishFailed}
                    >
                        <div className="extra--invoice-fields">
                            <Row>
                                <Col span={12}>
                                    <Card className="invoice-card-left" title="Billing Information" bordered={false}>
                                        <Row>
                                            <Col span={12} style={colStyle}>
                                                <Form.Item label="Billing Period" name="billing_period" rules={[{ type: 'array', required: true, message: 'Please select time!' }]}>
                                                    <RangePicker />
                                                </Form.Item>
                                            </Col>
                                            <Col span={12} style={colStyle}>
                                                <Form.Item label="Invoice Pay Day" name="pay_day" rules={[{ type: 'date', required: true }]}>
                                                    <DatePicker />
                                                </Form.Item>
                                            </Col>
                                        </Row>
                                    </Card>
                                </Col>
                                <Col span={12}>
                                    <Card className="invoice-card-right" title="Invoice" bordered={false} >
                                        <Row>
                                            <Col span={12} style={colStyle}>
                                                <Form.Item label="Client" name="client" rules={[{ required: true }]}>
                                                    <Select
                                                        placeholder="Select client"
                                                        allowClear
                                                    >
                                                        {clientsData ? clientsData.map(clientData => (
                                                            <Option key={clientData.id}>{clientData.name}</Option>
                                                        )) : ''}
                                                    </Select>
                                                </Form.Item>
                                            </Col>
                                            <Col span={12} style={colStyle}>
                                                <Form.Item label="Total Amount" name="total_amount" >
                                                    <Title level={3} className="total-value" strong>{totalValue ? totalValue : " - "}</Title>
                                                </Form.Item>
                                            </Col>
                                        </Row>
                                    </Card>
                                </Col>
                            </Row>
                        </div>
                        <Card className="invoice-card-big" title="Selected Sessions" bordered={false}>

                            <Table
                                dataSource={sessionsData}
                                columns={columns}
                                summary={pageData => {
                                    let totalValue = 0;

                                    pageData.forEach(({ price }) => {
                                        totalValue += price;
                                    });

                                    return (
                                        <>
                                            <Table.Summary.Row>
                                                <Table.Summary.Cell><Text strong>Total</Text></Table.Summary.Cell>
                                                <Table.Summary.Cell>
                                                    <Text strong type="danger">{Math.round(totalValue * 100) / 100 + "€"}</Text>
                                                </Table.Summary.Cell>
                                            </Table.Summary.Row>

                                        </>
                                    );
                                }}
                            />
                        </Card>
                        <div>
                            <Form.Item>
                                <Space style={{ marginTop: 16 }}>
                                    <Button type="primary" htmlType="submit" loading={submitting} >
                                        Save
                                    </Button>
                                    <Button onClick={() => props.history.goBack()}>Cancel</Button>
                                </Space>
                            </Form.Item>
                        </div>
                    </Form>
                </div>
            </div>
        );
    }


}