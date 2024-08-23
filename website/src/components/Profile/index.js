import React, { useState, useEffect } from 'react';
import { Typography, Form, Input, Button, notification, Row, Col } from 'antd';
import { PasswordInput } from 'antd-password-input-strength';

import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;

export default function Profile() {
  const [loading, setLoading] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [passwordRequired, setPasswordRequired] = useState(false);
  const [form] = Form.useForm();

  const layout = {
    wrapperCol: {
      xs: { span: 24 },
      sm: { span: 24 },
      md: { span: 24 },
      lg: { span: 12 },
    },
  };

  useEffect(() => {
    if (form.current) onFetchProfile();
  }, []);

  function onFetchProfile() {
    setLoading(true);
    _service({
      method: 'GET',
      url: 'user',
      success: (response) => {
        setLoading(false);
        if (response.json.data && response.json.data.length > 0) {
          const data = response.json.data[0];
          form.current.setFieldsValue(data);
        } else {
          notification.warning({
            message: 'An error has occurred while parsing the user data',
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification.error({
          message: 'An error has occurred while loading the user data',
          description: 'An error has occurred while loading the data, please try again.',
        });
      },
    });
  }

  function onFinish(values) {
    setSubmitting(true);
    const { name, username, password, email, old_password } = values;
    _service({
      method: 'PUT',
      url: 'user',
      data: {
        name,
        username,
        password,
        email,
        old_password,
      },
      success: (response) => {
        if (response.json.result) {
          notification.success({
            message: 'Profile',
            description: 'Os dados do seu perfil foram alterados com sucesso.',
          });
          setSubmitting(false);
          form.current.setFieldsValue({
            password: '',
            password_confirm: '',
            old_password: '',
          });
        } else {
          if (response.json.error == 'wrong_password') {
            notification.warning({
              message: 'Wrong password',
              description: 'Your current password is wrong',
            });
          } else {
            notification.warning({
              message: 'User not found',
              description: response.json.error,
            });
          }

          setSubmitting(false);
          form.current.setFieldsValue({
            password: '',
            password_confirm: '',
            old_password: '',
          });
        }
      },
      fail: () => {
        setSubmitting(false);
        notification.error({
          message: 'Erro na Edição do Perfil',
          description:
            'Ocorreu um erro na edição do seu perfil, por favor contacte-nos através do chat de suporte.',
        });
      },
    });
  }

  function onValuesChange(changedValues, allValues) {
    if (allValues.password && allValues.password.length > 0) {
      setPasswordRequired(true);
    } else {
      setPasswordRequired(false);
    }
  }

  function onFinishFailed(errorInfo) {
    console.log('Failed:', errorInfo);
  }

  return (
    <div>
      <div className="content-title">
        <Title level={4}>Profile</Title>
      </div>
      <div className="content-body">
        <Form
          {...layout}
          onValuesChange={onValuesChange}
          ref={form}
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
                  {
                    type: 'string',
                    message: 'Invalid name, only lowercase and uppercase letters.',
                    pattern:
                      "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$",
                  },
                ]}
              >
                <Input disabled={submitting} />
              </Form.Item>
              <Form.Item
                label="Username"
                name="username"
                rules={[
                  { required: true, message: 'Insert the username' },
                  {
                    type: 'string',
                    message: 'Invalid name, only lowercase and uppercase letters.',
                    pattern:
                      "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$",
                  },
                ]}
              >
                <Input disabled={submitting} />
              </Form.Item>
              <Form.Item
                label="E-mail"
                name="email"
                rules={[
                  { type: 'email', message: 'O e-mail inserido não é válido.' },
                  { required: true, message: 'Insira o e-mail.' },
                ]}
              >
                <Input disabled={submitting} />
              </Form.Item>
            </Col>
            <Col xs={{ span: 24 }} lg={{ span: 12 }}>
              <Form.Item label="Old Password" name="old_password" rules={[{ type: 'string' }]}>
                <Input.Password />
              </Form.Item>
              <Form.Item
                label="New Password"
                name="password"
                rules={[
                  {
                    type: 'string',
                    message: 'Password should be between 8 to 25 characters.',
                    min: 8,
                    max: 25,
                  },
                ]}
              >
                <PasswordInput />
              </Form.Item>
              <Form.Item
                label="Confirm new Password"
                name="password_confirm"
                rules={[
                  {
                    required: passwordRequired,
                    message: 'Enter the new password again.',
                  },
                  {
                    type: 'string',
                    message: 'Password should be between 8 to 25 characters.',
                    min: 8,
                    max: 25,
                  },
                  ({ getFieldValue }) => ({
                    validator(_, value) {
                      if (!value || getFieldValue('password') === value) {
                        return Promise.resolve();
                      }
                      return Promise.reject('The passwords are not the same.');
                    },
                  }),
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
