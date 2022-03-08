import React, { useState, useEffect } from 'react';
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";

import { Typography, Space, Button, Input, Table, notification, Spin } from 'antd';

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const { Search } = Input;

export default function Clients(props) {

    const [loading, setLoading] = useState(false);
    const [clientsData, setClientsData] = useState(false);
    const [clientsDataFiltered, setClientsDataFiltered] = useState(false);

    const history = useHistory();   
    const location = useLocation();

    const columns = [
        {
          title: 'Name',
          dataIndex: 'name',
          key: 'name',
        },
        {
          title: 'Email',
          dataIndex: 'email',
          key: 'email',
        },
        {
          title: 'Phone Number',
          dataIndex: 'phone_number',
          key: 'phone_number',
        },
        {
            title: 'Start Date',
            dataIndex: 'start_date',
            key: 'start_date',
        },
        {
            title: 'Price',
            dataIndex: 'default_price',
            key: 'default_price',
        },
        {
            title: 'Duration',
            dataIndex: 'session_duration',
            key: 'session_duration',
        },
        {
            title: 'Times/Month',
            dataIndex: 'sessions_per_month',
            key: 'sessions_per_month',
        },
        {
            title: 'Default Type',
            dataIndex: 'default_session_type',
            key: 'default_session_type',
        },
        {
            title: 'Default Sub Type',
            dataIndex: 'default_session_sub_type',
            key: 'default_session_sub_type',
        },
      ];

    useEffect(() => {
        onFetchClients();
    }, [location]);

    function onFetchClients() {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'client',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setClientsData(response.json.data);
                    setClientsDataFiltered(response.json.data);
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

    function filter(e) {
        const value = e.target.value;
        if(!value) {
            setClientsDataFiltered(clientsData);
        } else {
            let filteredData = clientsData.filter( (client) => {
                let exist = false;
                for (var prop in client) {
                    if (Object.prototype.hasOwnProperty.call(client, prop)) {
                        if(client[prop].toString().indexOf(value) !== -1) exist = true;
                    }
                }
                return exist;
            });
            setClientsDataFiltered(filteredData);
        }
    }

    if (_auth.isLogged()) {
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
                <div className="clients-layout-content">
                    <div className="actions-n-filters">
                        <Space style={{ marginBottom: 16 }}>
                            <Button type="primary" > 
                                <Link to="detail">Add Client</Link> 
                            </Button>
                            <Input placeholder="Search..." onChange={ filter }/>
                        </Space>
                    </div>
                    <div className="content-table">
                        <Table 
                            dataSource={clientsDataFiltered} 
                            columns={columns} 
                            onRow={(record, rowIndex) => {
                                return {
                                  onClick: event => {history.push(`/detail/${record.id}`);}
                                };
                              }}
                        />
                    </div>
                </div>
            );
        }
    } else {
        return <Redirect to="/login" />;
    }
}