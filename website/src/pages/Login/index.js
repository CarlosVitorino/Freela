import React, { useState, useEffect } from "react";
import { Redirect, Link } from "react-router-dom";
import {
  Layout,
  Typography,
  Form,
  Input,
  Button,
  Checkbox,
  notification,
} from "antd";
import _auth from "@netuno/auth-client";
import RecoverModal from "./RecoverModal";
import { ReactSVG } from "react-svg";

import "./index.less";

const { Title } = Typography;
const { Content, Sider } = Layout;

export default function Login(props) {
  const [submitting, setSubmitting] = useState(false);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (_auth.isLogged()) {
      window.scrollTo(0, 0);
    }
    window.scrollTo(0, 0);
  });

  function onFinish(values) {
    setSubmitting(true);
    const { username, password, remember } = values;
    if (remember) {
      localStorage.setItem("login", JSON.stringify(values));
    } else {
      localStorage.removeItem("login");
    }
    _auth.login({
      username,
      password,
      success: () => {
        setSubmitting(false);
      },
      fail: () => {
        setSubmitting(false);
        notification["error"]({
          message: "Login Inválido",
          description: "Por favor verifique as credenciais inseridas.",
        });
      },
    });
  }

  function onFinishFailed(errorInfo) {
    console.log("Failed:", errorInfo);
  }

  let initialValues = { remember: true };
  if (localStorage.getItem("login") != null) {
    initialValues = JSON.parse(localStorage.getItem("login"));
  }

  if (_auth.isLogged()) {
    return <Redirect to="/dashboard" />;
  } else {
    return (
      <Layout className="layout login-layout">
        <Content className="login-container">
          <div className="form-wrapper">
            <div className="content-body">
              <Title>Login</Title>
              <Form
                layout="vertical"
                name="basic"
                initialValues={initialValues}
                onFinish={onFinish}
                onFinishFailed={onFinishFailed}
              >
                <Form.Item
                  label="Username"
                  name="username"
                  rules={[{ required: true, message: "Insert your username." }]}
                >
                  <Input loading={submitting} />
                </Form.Item>

                <Form.Item
                  label="Password"
                  name="password"
                  rules={[{ required: true, message: "Insert your password." }]}
                >
                  <Input.Password loading={submitting} />
                </Form.Item>

                <Form.Item name="remember" valuePropName="checked">
                  <Checkbox>Remember me</Checkbox>
                </Form.Item>

                <Form.Item>
                  <Button
                    loading={submitting}
                    type="primary"
                    className="login-btn"
                    htmlType="submit"
                  >
                    Login
                  </Button>
                </Form.Item>

                <Form.Item style={{ textAlign: "center" }}>
                  <Button type="link" onClick={() => setVisible(!visible)}>
                    Did you forget your password?
                  </Button>
                  {visible && (
                    <RecoverModal
                      onClose={() => {
                        setVisible(false);
                      }}
                    />
                  )}
                </Form.Item>

                <hr />
                <span>
                  <p>or</p>
                </span>
                <Link to="/register">
                  <Button
                    loading={submitting}
                    type="default"
                    className={"register-btn"}
                  >
                    Create Account
                  </Button>
                </Link>
              </Form>
            </div>
          </div>
        </Content>
        <Sider className="sider-wrapper" width={"50%"}>
          <img
            className="sider-login"
            alt="sider-login"
            src="/images/login.png"
          />
        </Sider>
      </Layout>
    );
  }
}
