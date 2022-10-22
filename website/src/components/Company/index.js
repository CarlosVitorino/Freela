import React, { useState, useEffect, useRef } from 'react';
import { useLocation } from "react-router-dom";
import { LoadingOutlined, PlusOutlined } from '@ant-design/icons';
import { Typography, Form, Input, Button, notification, Spin, Row, Col, Select, Upload } from 'antd';
import _service from '@netuno/service-client';

import './index.less';
import FormItem from 'antd/lib/form/FormItem';

const { Title } = Typography;

export default function Company(props) {

    const [loading, setLoading] = useState(false);
    const [uploadLoading, setUploadLoading] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [contries, setContries] = useState([]);
    const [companyId, setCompanyId] = useState([]);
    const [image, setImage] = useState(false);
    const companyForm = useRef(null);

    const location = useLocation();

    const layout = {
        wrapperCol: { xs: { span: 24 }, sm: { span: 24 }, md: { span: 24 }, lg: { span: 12 } }
    };

    useEffect(() => {
        if (companyForm.current) {
            onFetchCompany();
        }
        onFetchCountries();

    }, [location]);


    const onFetchCompany = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'company',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    const data = response.json.data;
                    setImage("data/" + data.logo);
                    setCompanyId(data.id);
                    companyForm.current.setFieldsValue(data);
                } else {
                    notification["warning"]({
                        message: 'An error has occurred while loading the data',
                        description: response.json.error,
                    });
                    setLoading(false);
                }
            },
            fail: () => {
                setLoading(false);
                notification["error"]({
                    message: 'An error has occurred while loading the data',
                    description: 'An error has occurred while loading the data, please try again after some smart moves.',
                });
            }
        });
    }

    const onFetchCountries = () => {
        fetch('https://restcountries.com/v2/all?fields=name')
            .then(response => response.json())
            .then(data => {
                const countries = data.map(country => ({
                    value: country.name,
                    label: country.name
                }));
                setContries(countries);
                if(companyForm.current.country === undefined) {
                    companyForm.current.setFieldsValue({
                        country: countries.find(country => country.value === 'Portugal').value
                    });
                }
            });
    }

    const onSubmit = values => {
        setSubmitting(true);
        delete values['logo'];
        values.companyId = companyId;
        _service({
            method: 'PUT',
            url: 'company',
            data: values,
            success: (response) => {
                setSubmitting(false);
                if (response.json.result) {
                    notification["success"]({
                        message: 'Company saved successfully',
                        description: 'Company saved successfully',
                    });
                } else {
                    notification["warning"]({
                        message: 'An error has occurred while saving your company data',
                        description: response.json.error,
                    });
                    setSubmitting(false);
                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'An error has occurred while saving your company data',
                    description: 'An error has occurred while saving your company data, please try again after some yoga.',
                });
            }
        });

    }

    const onFinishFailed = errorInfo => {
        console.log(errorInfo);
    }

    const getBase64 = (img, callback) => {
        const reader = new FileReader();
        reader.addEventListener('load', () => callback(reader.result));
        reader.readAsDataURL(img);
    }

    const beforeUpload = (file) => {
        const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
        if (!isJpgOrPng) {
            notification["error"]({
                message: 'File format not valid',
                description: 'You can only upload JPG/PNG file!',
            });

        }
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isLt2M) {
            notification["error"]({
                message: 'File size too large',
                description: 'Image must smaller than 2MB!',
            });
        }
        return isJpgOrPng && isLt2M;
    }

    const handleChange = info => {
        console.log(info.file.status);
        if (info.file.status === 'uploading') {
            getBase64(info.file.originFileObj, imageUrl => {

                setImage(imageUrl);
                setUploadLoading(false);
            });
        }
        if (info.file.status === 'done') {
            console.log(info.file.status);
            notification["success"]({
                message: 'File uploaded successfully',
                description: 'The file has been uploaded successfully',
            });
        }
    };



    const propsPhoto = {
        name: "avatar",
        listType: "picture-card",
        className: "avatar-uploader",
        accept: "image/png, image/jpeg",
        showUploadList: false,
        beforeUpload: beforeUpload,
        onChange: handleChange,
        customRequest: ({ file, onSuccess, onError }) => {
            console.log(file);
            const formData = new FormData();
            formData.append('file', file);
            formData.append('companyId', companyId);

            _service({
                method: 'POST',
                url: 'company/photo',
                data: formData,
                success: (response) => {
                    if (response.json.result) {
                        onSuccess(response.json.data);
                        setCompanyId(response.json.data);
                    } else {
                        notification["warning"]({
                            message: 'An error has occurred while loading the data',
                            description: response.json.error,
                        });
                        onError(response.json.error);
                    }
                },
                fail: () => {
                    notification["error"]({
                        message: 'An error has occurred while loading the data',
                        description: 'An error has occurred while loading the data, please try again after some tribal dance.',
                    });
                    onError('An error has occurred while loading the data, please try again after some tribal dance.');
                }
            });
        },
    };

    const uploadButton = (
        <div>
            {uploadLoading ? <LoadingOutlined /> : <PlusOutlined />}
            <div style={{ marginTop: 8 }}>Upload</div>
        </div>
    );

    if (loading) {
        return (
            <div className="loading-wrapper">
                <div className="content-title">
                    <Title level={2}><Spin /> a carregar...</Title>
                </div>
            </div>
        );
    } else {
        return (
            <div>
                <div className="content-title">
                    <Title level={4}>Your Company Data</Title>
                </div>
                <div className="content-body">
                    <Form
                        {...layout}
                        ref={companyForm}
                        layout="vertical"
                        name="basic"
                        initialValues={{ remember: true }}
                        onFinish={onSubmit}
                        onFinishFailed={onFinishFailed}
                    >
                        <Row {...layout}>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                <FormItem
                                    label="Brand Logo"
                                    name="logo"
                                    valuePropName="image"
                                    rules={[
                                        { required: true, message: 'Insert the logo' }
                                    ]}
                                >
                                    <Upload {...propsPhoto}>
                                        {image ? <img src={image} alt="avatar" style={{ width: '100%' }} /> : uploadButton}
                                    </Upload>
                                </FormItem>
                                <Form.Item
                                    label="Company Name"
                                    name="company"
                                    rules={[
                                        { required: true, message: 'Insert the name' },
                                        { type: 'string', message: 'Insert a valid name' }
                                    ]}
                                >
                                    <Input style={{ maxWidth: 257 }} disabled={submitting} />
                                </Form.Item>
                                <FormItem
                                    label="VAT"
                                    name="vat"
                                    rules={[
                                        { required: true, message: 'Insert the VAT' },
                                        { type: 'string', message: 'Insert a valid VAT' }
                                    ]}
                                >
                                    <Input style={{ maxWidth: 257 }} disabled={submitting} />
                                </FormItem>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>

                                <Form.Item
                                    label="Address"
                                    name="address"
                                    rules={[
                                        { required: true, message: 'Insert the address' },
                                        { type: 'string', message: 'Insert a valid address' }
                                    ]}
                                >
                                    <Input.TextArea rows={5} style={{ maxWidth: 257 }} disabled={submitting} />
                                </Form.Item>
                                <Form.Item
                                    label="Postal Code"
                                    name="postal_code"
                                    rules={[
                                        { required: true, message: 'Insert the postal code' },
                                        { type: 'string', message: 'Insert a valid postal code' }
                                    ]}
                                >
                                    <Input style={{ maxWidth: 257 }} disabled={submitting} />
                                </Form.Item>
                                <Form.Item
                                    label="Country"
                                    name="country"
                                    rules={[
                                        { required: true, message: 'Insert the country' },
                                        { type: 'string', message: 'Insert a valid country' }
                                    ]}
                                >
                                    <Select
                                        disabled={submitting}
                                        placeholder="Select a country"
                                        options={contries}
                                        style={{ maxWidth: 257 }}
                                    >
                                    </Select>
                                </Form.Item>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 24 }}>
                                <FormItem
                                    label="Terms of Service"
                                    name="terms"
                                    rules={[
                                        { required: true, message: 'Insert the terms of your service' },
                                        { type: 'string', message: 'Insert a valid terms of service' }
                                    ]}
                                >
                                    <Input.TextArea rows={3} style={{ maxWidth: 'calc(50% + 257px)' }} disabled={submitting} />
                                </FormItem>
                            </Col>
                        </Row>


                        <Form.Item>
                            <Button type="primary" htmlType="submit" loading={submitting}>
                                Save
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
            </div>
        );
    }


}