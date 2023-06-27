import React, { useState, useEffect, useRef } from 'react';
import { Redirect } from "react-router-dom";
import { Layout, Typography, Form, Input, Button, notification, Divider } from 'antd';
import { PasswordInput } from "antd-password-input-strength";
import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const { Content, Sider } = Layout;

export default function Register(props) {

    const [ready, setReady] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const registerForm = useRef(null);

    useEffect(() => {
        if (_auth.isLogged()) {
            window.scrollTo(0, 0)
        }
        window.scrollTo(0, 0)
    });

    function onFinish(values) {
        setSubmitting(true);
        const { username, password, mail, name } = values;
        _service({
            method: 'POST',
            url: 'user',
            data: {
                name,
                username,
                password,
                mail
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Account Created',
                        description: 'The account has been successfully created, you can log in now.',
                    });
                    login(values);
                    setReady(true);
                } else {
                    notification["warning"]({
                        message: 'This user already exists',
                        description: response.json.error,
                    });
                    setSubmitting(false);
                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Account Creation Error',
                    description: 'Unable to create the account, please contact us to try again after doing the back flip.',
                });
            }
        });
    }

    function login(values) {
        const { username, password } = values;
        _auth.login({
            username,
            password,
            success: () => {
                setSubmitting(false);
                props.history.push("/dashboard");
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Login Inválido',
                    description:
                        'Por favor verifique as credenciais inseridas.',
                });
            }
        });
    }


    function onFinishFailed(errorInfo) {
        console.log('Failed:', errorInfo);
    }

    if (_auth.isLogged()) {
        return <Redirect to="/dashboard" />;
    }
    else if (ready) {
        return <Redirect to="/login" />;
    } else {
        return (
            <Layout className="layout register-layout">
                <Content className="register-container">
                    <div className="content-title">
                        <Title>Create Account.</Title>
                    </div>
                    <div className="content-body">
                        <p>Create an account to access your reserved area.</p>
                        <Form
                            ref={registerForm}
                            layout="vertical"
                            name="basic"
                            initialValues={{ remember: true }}
                            onFinish={onFinish}
                            onFinishFailed={onFinishFailed}
                        >
                            <Form.Item
                                label="Nome"
                                name="name"
                                rules={[
                                    { required: true, message: 'Enter your name.' },
                                    { type: 'string', message: 'Invalid name, only lower case and upper case letters supported.', pattern: "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" }
                                ]}
                            >
                                <Input disabled={submitting} maxLength={25} />
                            </Form.Item>
                            <Form.Item
                                label="Username"
                                name="username"
                                rules={[
                                    { required: true, message: 'Enter your username.' },
                                    { type: 'string', message: 'Invalid name, only lower case and upper case letters supported.', pattern: '^[a-z0-9]{1,25}$' }
                                ]}
                            >
                                <Input disabled={submitting} maxLength={25} />
                            </Form.Item>
                            <Form.Item
                                label="E-mail"
                                name="mail"
                                rules={[
                                    { type: 'email', message: 'The e-mail entered is not valid.' },
                                    { required: true, message: 'Insert email.' }
                                ]}
                            >
                                <Input disabled={submitting} maxLength={250} />
                            </Form.Item>
                            <Form.Item
                                label="Password"
                                name="password"
                                rules={[
                                    { required: true, message: 'Enter the password.' },
                                    { type: 'string', message: 'Password should be between 8 to 25 characters.', min: 8, max: 25 },
                                ]}
                            >
                                <PasswordInput disabled={submitting} maxLength={25} />
                            </Form.Item>
                            <Form.Item
                                label="Confirm Password"
                                name="password_confirm"
                                rules={[
                                    { required: true, message: 'Insira a confirmação da palavra-passe.' },
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
                                <Input.Password disabled={submitting} maxLength={25} />
                            </Form.Item>
                            <Form.Item>
                                <Button type="primary" htmlType="submit" loading={submitting}>
                                    Create Account
                                </Button>
                            </Form.Item> 
                            <Divider />  
                            <Form.Item>
                                <Button type="link"  onClick={() => props.history.push("/login")}>
                                    Already have an account? Login
                                </Button>
                            </Form.Item>
                        </Form>
                    </div>
                </Content>
                <Sider width={'50%'}>
                    <img className="sider-login" alt="sider-login" src="/images/login.png" />
                </Sider>
            </Layout>
        );
    }

}