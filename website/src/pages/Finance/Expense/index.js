import React, { useState, useEffect, useRef } from 'react';
import { useLocation, useParams } from "react-router-dom";
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Typography, Form, Input, InputNumber, DatePicker, Button, notification, Spin, Select, Row, Col, Card, Space } from 'antd';
import moment from 'moment';
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const { RangePicker } = DatePicker;
const { Option } = Select;

export default function Detail(props) {

    const [loading, setLoading] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [suppliersData, setSuppliersData] = useState(false);
    const { id } = useParams();

    const location = useLocation();
    const expenseForm = useRef(null);


    const layout = {
        wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } }
    };

    const colStyle = { padding: '8px 10px' }


    useEffect(() => {
        onFetchSuppliers();
    }, [location]);

    const onFetchSuppliers = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'supplier',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setSuppliersData(response.json.data);
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

        values['date'] = values['date'].format('YYYY-MM-DD');
        values['created_at'] = moment().format('YYYY-MM-DD');
        values['total_amount'] = Number(values['total_amount'] * -1);
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


    function onFinishFailed(errorInfo) {
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
            <div className="expense">
                <div className="content-title">
                    <Button className="go-back-btn" type="link" onClick={() => props.history.goBack()}><ArrowLeftOutlined /> Back</Button>
                    <Title className="big-title"><span>Expense</span></Title>
                </div>
                <div className="content-body">
                    <Form
                        {...layout}
                        ref={expenseForm}
                        layout="vertical"
                        name="basic"
                        initialValues={{ remember: true }}
                        onFinish={onFinish}
                        onFinishFailed={onFinishFailed}
                    >
                        <Row>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                <Card className="invoice-card-left" title="Billing Information" bordered={false}>
                                    <Row>
                                        <Col span={12} style={colStyle}>
                                            <Form.Item label="Description" name="description">
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                        <Col span={12} style={colStyle}>
                                            <Form.Item label="Date" name="date" rules={[{ type: 'date', required: true }]}>
                                                <DatePicker />
                                            </Form.Item>
                                        </Col>
                                    </Row>
                                </Card>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                <Card className="invoice-card-right" title="Invoice" bordered={false} >
                                    <Row>
                                        <Col span={12} style={colStyle}>
                                            <Form.Item label="Supplieres" name="supplier" rules={[{ required: true }]}>
                                                <Select
                                                    placeholder="Select supplier"
                                                    allowClear
                                                >
                                                    {suppliersData ? suppliersData.map(supplierData => (
                                                        <Option key={supplierData.id}>{supplierData.name}</Option>
                                                    )) : ''}
                                                </Select>
                                            </Form.Item>
                                        </Col>
                                        <Col span={12} style={colStyle}>
                                            <Form.Item label="Price" name="total_amount" rules={[{ required: true }]}>
                                                <InputNumber addonAfter="€" />
                                            </Form.Item>
                                        </Col>
                                    </Row>
                                </Card>
                            </Col>
                        </Row>
                        <div>
                            <Form.Item >
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