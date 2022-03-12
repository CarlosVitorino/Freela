import React from 'react';
import { Redirect } from "react-router-dom";

import { Typography } from 'antd';

import _auth from '@netuno/auth-client';

import './index.less';

const { Title } = Typography;

export default function ReservedArea(props) {

    if (_auth.isLogged()) {
        return (
            <div className="dashboard-layout-content">
                <Title level={2}>Hi there!</Title>
                <Title level={3} style={{ marginTop: 0 }}>Wellcome back!</Title>
                <img alt="reserved-area" src={"/images/reserved-area.png"} />
            </div>
        );
    } else {
        return <Redirect to="/login" />;
    }
}