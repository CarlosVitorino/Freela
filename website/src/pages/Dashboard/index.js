import React, { useState, useEffect } from 'react';
import { Redirect } from "react-router-dom";
import { Typography, Statistic, Row, Col, Space, Card, notification, Divider } from 'antd';
import { ArrowUpOutlined, ArrowDownOutlined } from '@ant-design/icons';
import { Column, Pie, Sunburst } from '@ant-design/plots';

import moment from 'moment';
import classNames from 'classnames';

import _auth from '@netuno/auth-client';
import _service from '@netuno/service-client';

import './index.less';

const { Title, Paragraph, Text, Link } = Typography;
const layout = {
    wrapperCol: { xs: { span: 12 }, sm: { span: 12 }, md: { span: 24 }, lg: { span: 24 } },
    style: { marginBotton: 10, marginTop: 10 }
};
const colStyle = { padding: '8px 0px' };


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
        if (monthData && monthData.totalMoney == -1) {
            const settings = "Don't forget to have a look at the settings menu for additional parameterization."
            return (
                <div className="dashboard">
                    <div className="content-title">
                        <Title className="big-title"><span>Dashboard</span></Title>
                    </div>
                    <div className={classNames("content-body", "empty-dashboard")}>
                        <Row {...layout}>
                            <Col className="empty-text" xs={{ span: 24 }} lg={{ span: 14 }}>
                                <article>
                                    <Title level={2} style={{paddingTop: 20, paddingBottom: 20}}>Yes, it's empty...</Title>
                                    <Paragraph >To have data in your's dashboard you need to create:</Paragraph>
                                    <Paragraph>
                                        <ul>
                                            <li>
                                                <Link href="/clients">Clients</Link>
                                            </li>
                                            <li>
                                                <Link href="/sessions">Sessions</Link>
                                            </li>
                                            <li>
                                                <Link href="/finance">Invoices</Link>
                                            </li>
                                        </ul>
                                    </Paragraph>
                                    <Divider />
                                    <Title level={4}>Settings:</Title>
                                    <p>
                                        {`Don't forget to give a look at the settings menu for additional parameterization.\n
                                            There, you will find Session types, subtypes, suppliers and more.`}
                                    </p>
                                </article>
                            </Col>
                            <Col className="empty-data" xs={{ span: 24 }} lg={{ span: 10 }}>
                                <img alt="empty-data" src={"/images/empty-dashboard-3.svg"} />
                            </Col>
                        </Row>
                    </div>
                </div>
            )
        }
        const mDays = moment.duration(monthData.totalTime, "minutes").days();
        const mHours = moment.duration(monthData.totalTime, "minutes").hours();
        const mMinutes = moment.duration(monthData.totalTime, "minutes").minutes();
        const monthTime =  ` ${mDays > 0 ? mDays + " days, ": ''} ${mHours} h ${mMinutes} min`;

        const yDays = moment.duration(yearData.totalMinutes, "minutes").days();
        const yHours = moment.duration(yearData.totalMinutes, "minutes").hours();
        const yMinutes = moment.duration(yearData.totalMinutes, "minutes").minutes();
        const yearTime =  ` ${yDays > 0 ? (yDays == 1 ? "day, " : " days, ") : ''} ${yHours} h ${yMinutes} min`;

        return (
            <div className="dashboard">
                <div className="content-title">
                    <Title className="big-title"><span>Dashboard</span></Title>
                </div>
                <div className="content-body">
                    <Row {...layout}>
                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-left">
                                <Title level={4}>Made in {moment().format('MMMM')}</Title>
                                <Row {...layout}>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Revenue" value={monthData.totalMoney} precision={2} suffix="€" loading={monthLoading} />
                                    </Col>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Time Worked " value={monthTime} loading={monthLoading} />
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

                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-right">
                                <Title level={4}>Received in {moment().format('MMMM')}</Title>
                                <Row {...layout}>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Received" value={monthData.received} precision={2} suffix="€" loading={monthLoading} />
                                    </Col>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Spend" value={monthData.paid * -1} precision={2} suffix="€" loading={monthLoading} />
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
                        <Col xs={{ span: 24 }} lg={{ span: 24 }} style={colStyle}>
                            <Card>
                                <Title level={4}>Revenue by Month</Title>
                                <Column {...configColumn} />
                            </Card>
                        </Col>
                    </Row>
                    <Row {...layout}>
                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-left">
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
                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-right">
                                <Title level={4}>Sessions {moment().format('YYYY')}</Title>
                                <Row {...layout}>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Total hours" value={yearTime} loading={anualLoading} />
                                    </Col>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Atendance" value={yearData.atendance} suffix="%" loading={anualLoading} />
                                    </Col>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Average Price/Hour" value={yearData.mediumPriceHour} precision={2} suffix="€" loading={anualLoading} />
                                    </Col>
                                    <Col span={12} style={colStyle}>
                                        <Statistic title="Average Session Duration" value={moment.duration(yearData.mediumSessionDuration, "minutes").minutes()} suffix="min" loading={anualLoading} />
                                    </Col>

                                </Row>
                            </Card>
                        </Col>
                    </Row>
                    <Row {...layout}>
                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-left">
                                <Title level={4}>Revenue / Type</Title>
                                <Sunburst {...configSunburst} />
                            </Card>
                        </Col>
                        <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
                            <Card className="card-right">
                                <Title level={4}>Clients/ Revenue</Title>
                                <Pie {...configPie} />
                            </Card>
                        </Col>
                    </Row>
                </div>
            </div>
        );
    } else {
        return <Redirect to="/login" />;
    }
}