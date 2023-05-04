import React, { useState, useEffect } from "react";
import { Redirect } from "react-router-dom";
import {
  Typography,
  Statistic,
  Row,
  Col,
  Card,
  notification,
  Divider,
} from "antd";
import { ArrowUpOutlined, ArrowDownOutlined } from "@ant-design/icons";
import { Column, Pie, Sunburst } from "@ant-design/plots";
import { isMobile } from "react-device-detect";

import moment from "moment";
import classNames from "classnames";

import _auth from "@netuno/auth-client";
import _service from "@netuno/service-client";

import "./index.less";

const { Title, Paragraph, Link } = Typography;
const layout = {
  // wrapperCol: {
  //   xs: { span: 12 },
  //   sm: { span: 12 },
  //   md: { span: 24 },
  //   lg: { span: 24 },
  // },
  style: { marginBotton: 10, marginTop: 10 },
};
const colStyle = { padding: "8px 0px" };

const colors = [
  "#F94144",
  "#F3722C",
  "#F8961E",
  "#F9844A",
  "#F9C74F",
  "#90BE6D",
  "#43AA8B",
  "#4D908E",
  "#577590",
  "#277DA1",
  "#C200FB",
  "#D704B2",
  "#E2068D",
  "#EC0868",
  "#F41C34",
  "#FC2F00",
  "#F45608",
  "#EC7D10",
  "#F69D0D",
  "#FFBC0A",
  "#2d00f7",
  "#6a00f4",
  "#8900f2",
  "#a100f2",
  "#b100e8",
  "#bc00dd",
  "#d100d1",
  "#db00b6",
  "#e500a4",
  "#f20089",
];
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
      method: "POST",
      url: "dashboard/month",
      success: (response) => {
        setMonthLoading(false);
        if (response.json.result) {
          setMonthData(response.json.data);
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
          setMonthLoading(false);
        }
      },
      fail: (error) => {
        setMonthLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const onFetchYearData = () => {
    setAnualLoading(true);

    _service({
      method: "POST",
      url: "dashboard/year",
      success: (response) => {
        setAnualLoading(false);
        if (response.json.result) {
          setYearData(response.json.data);
          setPieData(response.json.data.top5Clients);
          setColumnsData(response.json.data.dataByMonth);
          setSunburstData(response.json.data.sunburst);
        } else {
          notification["warning"]({
            message: "There was an error loading data",
            description: response.json.error,
          });
          setAnualLoading(false);
        }
      },
      fail: (error) => {
        setAnualLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact your boyfriend.",
        });
      },
    });
  };

  const configColumn = {
    data: columnsData,
    isStack: true,
    xField: "month",
    yField: "revenue",
    seriesField: "type",
    label: {
      position: "middle",
      layout: [
        {
          type: "interval-adjust-position",
        },
        {
          type: "interval-hide-overlap",
        },
        {
          type: "adjust-color",
        },
      ],
    },
    color: ["#30b2bc", "#ffbe0b", "#ff006e", "#3a86ff", "#8338ec", "#fb5607"],
    xAxis: {
      label: {
        autoRotate: false,
      },
    },
    yAxis: {
      title: {
        text: "Revenue",
        autoRotate: true,
      },
    },
    slider: {
      start: !isMobile ? 0 : 0.5,
      end: 1,
    },
    tooltip: {
      customItems: (originalItems) => {
        // process originalItems,
        console.log(originalItems);
        originalItems.forEach((item) => {
          //item.data.revenue = item.data.revenue.toString().includes("€") ? item.data.revenue : item.data.revenue + " €";
        });
        return originalItems;
      },
    },
  };

  const configPie = {
    appendPadding: 10,
    data: pieData,
    angleField: "amount",
    colorField: "client",
    radius: 0.9,
    label: {
      type: "inner",
      offset: "-30%",
      content: ({ percent }) => `${(percent * 100).toFixed(0)}%`,
      style: {
        fontSize: 14,
        textAlign: "center",
      },
    },
    color: colors,
    interactions: [
      {
        type: "element-active",
      },
    ],
  };

  const configSunburst = {
    data: sunburstData,
    innerRadius: 0.3,
    color: colors,
    interactions: [
      {
        type: "element-active",
      },
    ],
  };

  if (_auth.isLogged()) {
    if (yearData && yearData.billed === -1) {
      return (
        <div className="dashboard">
          <div className="content-title">
            <Title className="big-title">
              <span>Dashboard</span>
            </Title>
          </div>
          <div className={classNames("content-body", "empty-dashboard")}>
            <div className="empty-text">
              <article>
                <Title level={2} style={{ paddingTop: 20, paddingBottom: 20 }}>
                  There is not enough information yet to show your Dashboard
                </Title>
                <Paragraph>
                  To start using freela.biz to streamlines your billing process,
                  it only takes 3 simple steps:
                </Paragraph>
                <Paragraph>
                  <ul>
                    <li>
                      <p>
                        Register your clients in
                        <Link href="/clients"> Clients</Link>.
                      </p>
                    </li>
                    <li>
                      <p>
                        For each session you give, track the session in
                        <Link href="/sessions"> Sessions</Link>.
                      </p>
                    </li>
                    <li>
                      <p>
                        Create and manage your invoices for each one of your
                        clients. Check
                        <Link href="/finance"> Invoices</Link>.
                      </p>
                    </li>
                  </ul>
                </Paragraph>
                <Paragraph>
                  After you have logged your first session you will be able use
                  your dashboard to gain insight into your financial performance
                  and grow your business
                </Paragraph>
                <Divider />
                <Title level={4}>Settings:</Title>
                <p>
                  Don't forget to give a look at the{" "}
                  <Link href="/settings"> Settings</Link> menu for additional
                  parameterization. There, you will find Session types,
                  subtypes, suppliers and more.
                </p>
              </article>
            </div>
            <div className="empty-data">
              <img alt="empty-data" src={"/images/empty-server-1.png"} />
            </div>
          </div>
        </div>
      );
    }
    const mMinutes = moment.duration(monthData.totalTime, "minutes").minutes();
    const mHours = moment
      .duration(monthData.totalTime, "minutes")
      .subtract(moment.duration(mMinutes, "minutes"))
      .asHours();
    const monthTime = `${mHours}h ${mMinutes}m`;

    const yMinutes = moment
      .duration(yearData.totalMinutes, "minutes")
      .minutes();
    const yHours = moment
      .duration(yearData.totalMinutes, "minutes")
      .subtract(moment.duration(yMinutes, "minutes"))
      .asHours();
    const yearTime = `${yHours}h ${yMinutes}m`;

    return (
      <div className="dashboard">
        <div className="content-title">
          <Title className="big-title">
            <span>Dashboard</span>
          </Title>
        </div>
        <div className="content-body">
          <Row {...layout}>
            <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
              <Card className="card-left">
                <Title level={4}>Made in {moment().format("MMMM")}</Title>
                <Row {...layout}>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Revenue"
                      value={monthData.totalMoney}
                      precision={2}
                      suffix="€"
                      loading={monthLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Time Worked "
                      value={monthTime}
                      loading={monthLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="You Made"
                      value={monthData.diffMoney}
                      precision={2}
                      valueStyle={
                        monthData.diffMoney > 0
                          ? { color: "#3f8600" }
                          : { color: "#cf1322" }
                      }
                      prefix={
                        monthData.diffMoney > 0 ? (
                          <ArrowUpOutlined />
                        ) : (
                          <ArrowDownOutlined />
                        )
                      }
                      suffix="€"
                      loading={monthLoading}
                    />
                    <p className="statistic-suffix">than last month</p>
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title={`Total ${moment().format("MMMM")} Estimated`}
                      value={monthData.estimatedMoney}
                      precision={2}
                      suffix="€"
                      loading={monthLoading}
                    />
                  </Col>
                </Row>
              </Card>
            </Col>

            <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
              <Card className="card-right">
                <Title level={4}>Received in {moment().format("MMMM")}</Title>
                <Row {...layout}>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Received"
                      value={monthData.received}
                      precision={2}
                      suffix="€"
                      loading={monthLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Spent"
                      value={monthData.paid * -1}
                      precision={2}
                      suffix="€"
                      loading={monthLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Total Invoice Progress"
                      value={`${monthData.invoicesPaid}/${monthData.invoices}`}
                      suffix="invoices"
                      loading={monthLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="You Profit"
                      value={monthData.diffInvoice}
                      precision={2}
                      valueStyle={
                        monthData.diffInvoice > 0
                          ? { color: "#3f8600" }
                          : { color: "#cf1322" }
                      }
                      prefix={
                        monthData.diffInvoice > 0 ? (
                          <ArrowUpOutlined />
                        ) : (
                          <ArrowDownOutlined />
                        )
                      }
                      suffix="€"
                      loading={monthLoading}
                    />
                    <p className="statistic-suffix">than last month</p>
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
                <Title level={4}>Finance {moment().format("YYYY")}</Title>
                <Row {...layout}>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Billed "
                      value={yearData.billed}
                      precision={2}
                      suffix="€"
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Spent"
                      value={yearData.spent * -1}
                      precision={2}
                      suffix="€"
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Profit"
                      value={yearData.profit}
                      precision={2}
                      suffix="€"
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title={`Estimated Profit ${moment().format("YYYY")}`}
                      value={yearData.estimatedProfitYear}
                      precision={2}
                      suffix="€"
                      loading={anualLoading}
                    />
                  </Col>
                </Row>
              </Card>
            </Col>
            <Col xs={{ span: 24 }} lg={{ span: 12 }} style={colStyle}>
              <Card className="card-right">
                <Title level={4}>Sessions {moment().format("YYYY")}</Title>
                <Row {...layout}>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Total hours"
                      value={yearTime}
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Atendance"
                      value={yearData.atendance}
                      suffix="%"
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Average Price/Hour"
                      value={yearData.mediumPriceHour}
                      precision={2}
                      suffix="€"
                      loading={anualLoading}
                    />
                  </Col>
                  <Col span={12} style={colStyle}>
                    <Statistic
                      title="Average Session Duration"
                      value={moment
                        .duration(yearData.mediumSessionDuration, "minutes")
                        .minutes()}
                      suffix="min"
                      loading={anualLoading}
                    />
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
