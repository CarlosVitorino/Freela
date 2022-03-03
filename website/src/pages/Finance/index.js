import React, { useState, useEffect } from 'react';
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";

import { Typography, Space, Button, Input, Table, notification, Spin, Popconfirm } from 'antd';

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const { Search } = Input;

export default function Finance(props) {

    const [loading, setLoading] = useState(false);
    const [financeData, setFinanceData] = useState(false);
    const [financeDataFiltered, setFinanceDataFiltered] = useState(false);

    const history = useHistory();   
    const location = useLocation();

    const columns = [
        {
            title: 'Intervener',
            dataIndex: 'name',
            key: 'name',
        },
        {
            title: 'Billing Info',
            dataIndex: 'description',
            key: 'description',
        },
        {
            title: 'Created At',
            dataIndex: 'created_at',
            key: 'created_at',
        },
        {
            title: 'Pay Day',
            dataIndex: 'pay_day',
            key: 'pay_day',
        },
        {
            title: 'Amount',
            dataIndex: 'total_amount',
            key: 'total_amount',
        },
        {
            title: 'Status',
            dataIndex: 'status',
            key: 'status',
        },
        {
            title: 'operation',
            dataIndex: 'operation',
            render: (_, record) =>
                financeData.length >= 1 ? (
                    <Popconfirm title="Are you sure, you want to change the status?" onConfirm={() => handleStatusChange(record)}>
                        {record.status_code === 'waiting_payment' ? <a>Set as Paid</a> : <a>Cancel Payment</a>}
                    </Popconfirm>
                ) : null,
        },
      ];

    useEffect(() => {
        onFetchFinance();
    }, [location]);

    const onFetchFinance = () => {
        setLoading(true);
        _service({
            method: 'GET',
            url: 'finance',
            success: (response) => {
                setLoading(false);
                if (response.json.result) {
                    setFinanceData(response.json.data);
                    setFinanceDataFiltered(response.json.data);
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

    const handleStatusChange = (record) => {
        setLoading(true);
        _service({
            method: 'PUT',
            url: 'finance/toggle',
            data: {
                "status":  record.status_code === 'waiting_payment' ? 'paid' : 'waiting_payment',
                "invoiceId": record.id
            },
            success: (response) => {
                if (response.json.result) {
                    notification["success"]({
                        message: 'Status updated!',
                        description: 'Status updated successfully.',
                    });
                    onFetchFinance();
                    setLoading(false);
                } else {
                    notification["warning"]({
                        message: 'Status toggle error!',
                        description: response.json.error,
                    });
                    setLoading(false);

                }
            },
            fail: () => {
                setLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }


    const filter = (e) => {
        const value = e.target.value;
        if(!value) {
            setFinanceDataFiltered(financeData);
        } else {
            let filteredData = financeData.filter( (finance) => {
                let exist = false;
                for (var prop in finance) {
                    if (Object.prototype.hasOwnProperty.call(finance, prop)) {
                        if(finance[prop].toString().indexOf(value) !== -1) exist = true;
                    }
                }
                return exist;
            });
            setFinanceDataFiltered(filteredData);
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
                <div className="finance-layout-content">
                    <div className="actions-n-filters">
                        <Space style={{ marginBottom: 16 }}>
                            <Button  type="primary" > 
                                <Link to="/finance/expense">Add Expense</Link> 
                            </Button>
                            <Input placeholder="Search..." onChange={ filter }/>
                        </Space>
                    </div>
                    <div className="content-table">
                        <Table 
                            dataSource={financeDataFiltered} 
                            columns={columns} 
                        />
                    </div>
                </div>
            );
        }
    } else {
        return <Redirect to="/login" />;
    }
}