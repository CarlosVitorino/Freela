import React from 'react';
import { Redirect } from "react-router-dom";
import { Typography } from 'antd';

import _auth from '@netuno/auth-client';
import moment from 'moment';

import './index.less';

const { Title } = Typography;

export default function Dashboard(props) {

    if (_auth.isLogged()) {
        return (
            <div className="dashboard-layout-content">
                <Title level={3}>Month {moment.format('M')}</Title>
                <Title level={3} style={{ marginTop: 0 }}>Bem-vindo(a) à sua Área Reservada!</Title>
            </div>
        );
    } else {
        return <Redirect to="/login" />;
    }
}