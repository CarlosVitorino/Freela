import React, { useState, useEffect } from 'react';
import { Redirect } from "react-router-dom";
import { Typography, Statistic, Row, Col, Space, Card, notification } from 'antd';
import { ArrowUpOutlined, ArrowDownOutlined } from '@ant-design/icons';
import { Column, Pie, Sunburst } from '@ant-design/plots';

import moment from 'moment';

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';

const { Title } = Typography;
const layout = {
    wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } },
    style: { margin: 20 }
};
const colStyle = { padding: '8px 10px' };


export default function Dashboard(props) {

    const [monthData, setMonthData] = useState([]);
    const [pieData, setPieData] = useState([]);
    const [sunburstData, setSunburstData] = useState([]);
    const [columnsData, setColumnsData] = useState([]);
    const [yearData, setYearData] = useState([]);
    const [monthLoading, setMonthLoading] = useState(true);
    const [anualLoading, setAnualLoading] = useState(true);

    useEffect(() => {
        onFetchMonthData();
        onFetchYearData();
    }, []);

    const onFetchMonthData = () => {
        setMonthLoading(true);

        _service({
            method: 'POST',
            url: 'dashboard/month',
            success: (response) => {
                setMonthLoading(false);
                if (response.json.result) {
                    setMonthData(response.json.data);
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    setMonthLoading(false);
                }
            },
            fail: (error) => {
                setMonthLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const onFetchYearData = () => {
        setAnualLoading(true);

        _service({
            method: 'POST',
            url: 'dashboard/year',
            success: (response) => {
                setAnualLoading(false);
                if (response.json.result) {
                    setYearData(response.json.data);
                    setPieData(response.json.data.top5Clients);
                    setColumnsData(response.json.data.dataByMonth);
                    setSunburstData(response.json.data.sunburst);
                } else {
                    notification["warning"]({
                        message: 'There was an error loading data',
                        description: response.json.error,
                    });
                    setAnualLoading(false);
                }
            },
            fail: (error) => {
                setAnualLoading(false);
                notification["error"]({
                    message: 'Error!',
                    description: 'There was an error, please contact your boyfriend.'
                });
            }
        });
    }

    const configColumn = {
        data: columnsData,
        isStack: true,
        xField: 'month',
        yField: 'revenue',
        seriesField: 'type',
        label: {
            position: 'middle',
            layout: [
                {
                    type: 'interval-adjust-position',
                },
                {
                    type: 'interval-hide-overlap',
                },
                {
                    type: 'adjust-color',
                },
            ],
        },
        xAxis: {
            label: {
                autoRotate: false,
            },
        },
        yAxis: {
            title: {
                text: "Revenue",
                autoRotate: true
            },
        },
        slider: {
            start: 0,
            end: 1,
        },
        tooltip: {
            customItems: (originalItems: TooltipItem[]) => {
                // process originalItems,
                console.log(originalItems); 
                originalItems.forEach(item => {
                    //item.data.revenue = item.data.revenue.toString().includes("€") ? item.data.revenue : item.data.revenue + " €";
                });
                return originalItems;
            }
        }
    };

    const configPie = {
        appendPadding: 10,
        data: pieData,
        angleField: 'amount',
        colorField: 'client',
        radius: 0.9,
        label: {
            type: 'inner',
            offset: '-30%',
            content: ({ percent }) => `${(percent * 100).toFixed(0)}%`,
            style: {
                fontSize: 14,
                textAlign: 'center',
            },
        },
        interactions: [
            {
                type: 'element-active',
            },
        ],
    };

    const configSunburst = {
        data: sunburstData,
        innerRadius: 0.3,
        interactions: [
          {
            type: 'element-active',
          },
        ],
      };

    if (_auth.isLogged()) {
        return (
            <div className="dashboard-layout-content">
                <Title level={3}>Dashboard View</Title>
                <Row {...layout}>
                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Made in {moment().format('MMMM')}</Title>
                            <Row {...layout}>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Revenue" value={monthData.totalMoney} precision={2} suffix="€" loading={monthLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Time Worked " value={`${moment.duration(monthData.totalTime, "minutes").hours()} h  ${moment.duration(monthData.totalTime, "minutes").minutes()} min`} loading={monthLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic
                                        title="You Made"
                                        value={monthData.diffMoney}
                                        precision={2}
                                        valueStyle={monthData.diffMoney > 0 ? { color: '#3f8600' } : { color: '#cf1322' }}
                                        prefix={monthData.diffMoney > 0 ? <ArrowUpOutlined /> : <ArrowDownOutlined />}
                                        suffix="€"
                                        loading={monthLoading}
                                    /><p className="statistic-suffix">than last month</p>
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title={`Total ${moment().format('MMMM')} Estimated`} value={monthData.estimatedMoney} precision={2} suffix="€" loading={monthLoading} />
                                </Col>
                            </Row>
                        </Card>
                    </Col>

                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Received in {moment().format('MMMM')}</Title>
                            <Row {...layout}>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Received" value={monthData.received} precision={2} suffix="€" loading={monthLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Spent" value={monthData.paid * -1} precision={2} suffix="€" loading={monthLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Total Invoice Progress" value={`${monthData.invoicesPaid}/${monthData.invoices}`} suffix="invoices" loading={monthLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic
                                        title="You Profit"
                                        value={monthData.diffInvoice}
                                        precision={2}
                                        valueStyle={monthData.diffInvoice > 0 ? { color: '#3f8600' } : { color: '#cf1322' }}
                                        prefix={monthData.diffInvoice > 0 ? <ArrowUpOutlined /> : <ArrowDownOutlined />}
                                        suffix="€"
                                        loading={monthLoading}
                                    /><p className="statistic-suffix">than last month</p>
                                </Col>
                            </Row>
                        </Card>
                    </Col>
                </Row>
                <Row {...layout}>
                    <Col xs={{ span: 24}} lg={{ span: 24}} style={colStyle}>
                        <Card>
                            <Title level={4}>Revenie by Month</Title>
                            <Column {...configColumn} />
                        </Card>
                    </Col>
                </Row>
                <Row {...layout}>
                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Finance {moment().format('YYYY')}</Title>
                            <Row {...layout}>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Billed " value={yearData.billed} precision={2} suffix="€" loading={anualLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Spend" value={yearData.spent * -1} precision={2} suffix="€" loading={anualLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Profit" value={yearData.profit} precision={2} suffix="€" loading={anualLoading} />

                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title={`Estimated Profit ${moment().format('YYYY')}`} value={yearData.estimatedProfitYear} precision={2} suffix="€" loading={anualLoading} />
                                </Col>
                            </Row>
                        </Card>
                    </Col>
                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Sessions {moment().format('YYYY')}</Title>
                            <Row {...layout}>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Total hours" value={`${moment.duration(yearData.totalMinutes, "minutes").hours()} h  ${moment.duration(yearData.totalMinutes, "minutes").minutes()} min`} loading={anualLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Atendance" value={yearData.atendance} suffix="%" loading={anualLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Medium Price/Hour" value={yearData.mediumPriceHour} precision={2} suffix="€" loading={anualLoading} />
                                </Col>
                                <Col span={12} style={colStyle}>
                                    <Statistic title="Medium Session Duration" value={moment.duration(yearData.mediumSessionDuration, "minutes").minutes()} suffix="min" loading={anualLoading} />
                                </Col>

                            </Row>
                        </Card>
                    </Col>
                </Row>
                <Row {...layout}>
                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Revenue / Type</Title>
                            <Sunburst {...configSunburst} />
                        </Card>
                    </Col>
                    <Col xs={{ span: 24}} lg={{ span: 12}} style={colStyle}>
                        <Card>
                            <Title level={4}>Top 5 Clients</Title>
                            <Pie {...configPie} />
                        </Card>
                    </Col>
                </Row>
            </div>
        );
    } else {
        return <Redirect to="/login" />;
    }
}