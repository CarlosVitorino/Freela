import React, { useState, useEffect, useRef } from 'react';
import { Modal, Button, Form, Input, notification } from 'antd';

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';


export default function RecoverModal(props) {

    const [submitting, setSubmitting] = useState(false);
    const [visible, setVisible] = useState(true);
    const recoverForm = useRef(null);

    useEffect(() => {
        if (_auth.isLogged()) {
            window.scrollTo(0, 0)
        }
        window.scrollTo(0, 0)
    });

    function onFinish(values) {
        setSubmitting(true);
        const { mail } = values;
        _service({
            method: 'PUT',
            url: 'recovery',
            data: {
                mail,
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Password Change ',
                        description: 'We sent you an email with a link to recover your password',
                    });
                    setSubmitting(false);
                    setVisible(false);
                }
            },
            fail: () => {
                setSubmitting(false);
                notification["error"]({
                    message: 'Password change error!',
                    description: 'We were unable to change the password, please contact us via support chat.',
                });
            }
        });
    }

    function onFinishFailed(errorInfo) {
        console.log('Failed:', errorInfo);
    }

    function onSubmit() {
        recoverForm.current.validateFields()
            .then(values => {
                recoverForm.current.resetFields();
                onFinish(values);
            })
            .catch(info => {
                console.log('Validate Failed:', info);
            });
    }

    function onCancel() {
        setVisible(false);
        if (props.onClose) {
            props.onClose();
        }
    }

    return (
        <Modal
            className={'modal-recover'}
            title="Recuperar o Acesso"
            visible={visible}
            onCancel={onCancel}
            footer={[
                <Button key="back" onClick={onCancel}>
                    Cancelar
                </Button>,
                <Button key="send" type="primary" htmlType="submit" loading={submitting} onClick={onSubmit} >
                    Enviar
                </Button>
            ]}
        >
            <Form
                ref={recoverForm}
                name="basic"
                onFinishFailed={onFinishFailed}
            >
                <Form.Item
                    label="Email"
                    name="mail"
                    rules={[
                        { type: 'email', message: 'The e-mail entered is not valid.' },
                        { required: true, message: 'Insert email.' }
                    ]}
                >
                    <Input disabled={submitting} maxLength={250} />
                </Form.Item>
            </Form>

        </Modal>
    );

}