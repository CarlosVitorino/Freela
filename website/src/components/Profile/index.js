import React, { useState, useEffect, useRef } from 'react';
import { useLocation } from "react-router-dom";
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Typography, Form, Input, Button, notification, Spin, Row, Col } from 'antd';
import { PasswordInput } from "antd-password-input-strength";
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const layout = {
    wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } },
    style: { marginBotton: 10, marginTop: 10 }
};
export default function Profile(props) {

    const [loading, setLoading] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [passwordRequired, setPasswordRequired] = useState(false);
    const profileForm = useRef(null);

    const location = useLocation();

    const layout = {
        wrapperCol: { xs: { span: 24 }, sm: { span: 24 }, md: { span: 24 }, lg: { span: 12 } }
    };

    useEffect(() => {
        if (profileForm.current)
            onFetchProfile();
    }, [location]);

    function onFetchProfile() {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'user',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    profileForm.current.setFieldsValue({
                        name: response.json.data[0].name,
                        username: response.json.data[0].username,
                        mail: response.json.data[0].email
                    });
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

    function onFinish(values) {
        setSubmitting(true);
        const { name, username, password, mail, old_password } = values;
        _service({
            method: 'PUT',
            url: 'user',
            data: {
                name,
                username,
                password,
                mail,
                old_password
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Profile',
                        description: 'Os dados do seu perfil foram alterados com sucesso.',
                    });
                    setSubmitting(false);
                    profileForm.current.setFieldsValue({
                        password: "",
                        password_confirm: "",
                        old_password: "",
                    });
                } else {
                    if(response.json.error == "wrong_password") {
                        notification["warning"]({
                            message: 'Wrong password',
                            description: "Your current password is wrong",
                        });
                    } else {
                        notification["warning"]({
                            message: 'User not found',
                            description: response.json.error,
                        });
                    }

                    setSubmitting(false);
                    profileForm.current.setFieldsValue({
                        password: "",
                        password_confirm: "",
                        old_password: "",
                    });
                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Erro na Edição do Perfil',
                    description: 'Ocorreu um erro na edição do seu perfil, por favor contacte-nos através do chat de suporte.',
                });
            }
        });
    }

    function onValuesChange(changedValues, allValues) {
        if (allValues.password && allValues.password.length > 0) {
            setPasswordRequired(true);
        } else {
            setPasswordRequired(false);
        }
    };

    function onFinishFailed(errorInfo) {
        console.log('Failed:', errorInfo);
    }

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
                    <Title level={4}>Profile</Title>
                </div>
                <div className="content-body">
                    <Form
                        {...layout}
                        onValuesChange={onValuesChange}
                        ref={profileForm}
                        layout="vertical"
                        name="basic"
                        initialValues={{ remember: true }}
                        onFinish={onFinish}
                        onFinishFailed={onFinishFailed}
                    >
                        <Row {...layout}>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                <Form.Item
                                    label="Name"
                                    name="name"
                                    rules={[
                                        { required: true, message: 'Insert the name' },
                                        { type: 'string', message: 'Invalid name, only lowercase and uppercase letters.', pattern: "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" }
                                    ]}
                                >
                                    <Input disabled={submitting} />
                                </Form.Item>
                                <Form.Item
                                    label="Username"
                                    name="username"
                                    rules={[
                                        { required: true, message: 'Insert the username' },
                                        { type: 'string', message: 'Invalid name, only lowercase and uppercase letters.', pattern: "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" }
                                    ]}
                                >
                                    <Input disabled={submitting} />
                                </Form.Item>
                                <Form.Item
                                    label="E-mail"
                                    name="mail"
                                    rules={[
                                        { type: 'email', message: 'O e-mail inserido não é válido.' },
                                        { required: true, message: 'Insira o e-mail.' }
                                    ]}
                                >
                                    <Input disabled={submitting} />
                                </Form.Item>
                            </Col>
                            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
                                <Form.Item
                                    label="Old Password"
                                    name="old_password"
                                    rules={[
                                        { type: 'string'},
                                    ]}
                                >
                                    <Input.Password />
                                </Form.Item>
                                <Form.Item
                                    label="New Password"
                                    name="password"
                                    rules={[
                                        { type: 'string', message: 'Password should be between 8 to 25 characters.', min: 8, max: 25 },
                                    ]}
                                >
                                    <PasswordInput />
                                </Form.Item>
                                <Form.Item
                                    label="Confirm new Password"
                                    name="password_confirm"
                                    rules={[
                                        { required: passwordRequired, message: 'Enter the new password again.' },
                                        { type: 'string', message: 'Password should be between 8 to 25 characters.', min: 8, max: 25 },
                                        ({ getFieldValue }) => ({
                                            validator(_, value) {
                                                if (!value || getFieldValue('password') === value) {
                                                    return Promise.resolve();
                                                }
                                                return Promise.reject('The passwords are not the same.');
                                            },
                                        })
                                    ]}
                                >
                                    <Input.Password />
                                </Form.Item>
                            </Col>
                        </Row>


                        <Form.Item>
                            <Button type="primary" htmlType="submit" loading={submitting}>
                                Update Profile
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
            </div>
        );
    }


}