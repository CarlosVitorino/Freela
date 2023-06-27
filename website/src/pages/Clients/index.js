import React, { useState, useEffect } from "react";
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";
import { Typography, Space, Button, Input, Table, notification, Spin, Card } from "antd";
import { JellyTriangle } from "@uiball/loaders";
import { CheckOutlined, CloseOutlined } from "@ant-design/icons";
import _auth from "@netuno/auth-client";
import _service from "@netuno/service-client";
import classNames from "classnames";

import "./index.less";

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
      title: "Name",
      dataIndex: "name",
      key: "name",
      ellipsis: true,
    },
    {
      title: "Email",
      dataIndex: "email",
      key: "email",
      ellipsis: true,
    },
    {
      title: "Phone Number",
      dataIndex: "phone_number",
      key: "phone_number",
      responsive: ["xl"],
      ellipsis: true,
    },
    /*     {
      title: "Started at",
      dataIndex: "start_date",
      key: "start_date",
    }, */
    {
      title: "Duration",
      dataIndex: "session_duration",
      key: "session_duration",
      responsive: ["lg"],
      width: 75,
    },
    {
      title: "Sessions",
      dataIndex: "sessions_per_month",
      key: "sessions_per_month",
      render: (_, record) => record.sessions_per_month + " x",
      responsive: ["lg"],
      width: 75,
    },
    {
      title: "Price",
      dataIndex: "default_price",
      key: "default_price",
      render: (_, record) => record.default_price + "€",
      responsive: ["xl"],
      width: 60,
    },
    {
      title: "Price/Hour",
      dataIndex: "price_hour",
      key: "price_hour",
      render: (_, record) => {
        let priceHour = 0;
        if ("default_price" in record && "session_duration" in record && record.session_duration > 0) {
          priceHour = (60 * record.default_price) / record.session_duration;
        }
        return Math.round(priceHour * 100) / 100 + "€/h";
      },
      width: 100,
    },
    {
      title: "Type",
      dataIndex: "default_session_type",
      key: "default_session_type",
      ellipsis: true,
    },
    {
      title: "Sub Type",
      dataIndex: "default_session_sub_type",
      key: "default_session_sub_type",
      responsive: ["md"],
      ellipsis: true,
    },
    {
      title: "Active",
      dataIndex: "active",
      key: "active",
      render: (_, record) => (record.active ? <CheckOutlined /> : <CloseOutlined />),
      width: 55,
    },
  ];

  useEffect(() => {
    onFetchClients();
  }, [location]);

  function onFetchClients() {
    setLoading(true);
    _service({
      method: "GET",
      url: "client",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setClientsData(response.json.data);
          setClientsDataFiltered(response.json.data);
        } else {
          notification["warning"]({
            message: "Ocorreu um erro a carregar os dados",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Ocorreu um erro a carregar os dados",
          description: "Ocorreu um erro a carregar os dados, por favor tente novamente.",
        });

        _auth.logout();
        history.push("/login");
      },
    });
  }

  function filter(e) {
    const value = e.target.value;
    if (!value) {
      setClientsDataFiltered(clientsData);
    } else {
      let filteredData = clientsData.filter((client) => {
        let exist = false;
        for (var prop in client) {
          if (Object.prototype.hasOwnProperty.call(client, prop)) {
            if (client[prop].toString().indexOf(value) !== -1) exist = true;
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
            <div aria-live="polite" aria-busy={loading}>
              {loading && <JellyTriangle color="papayawhip" />}
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div className="clients">
          <div className="content-title">
            <Title className="big-title">
              <span>Clients</span>
            </Title>
          </div>
          <div className={classNames("content-body", "content-table")}>
            <Card>
              <div className="actions-n-filters">
                <Space style={{ marginBottom: 16 }}>
                  <Button type="primary">
                    <Link to="detail">Add Client</Link>
                  </Button>
                  <Input placeholder="Search..." onChange={filter} />
                </Space>
              </div>
              <Table
                dataSource={clientsDataFiltered}
                columns={columns}
                size="small"
                scroll={{ x: "" }}
                onRow={(record, rowIndex) => {
                  return {
                    onClick: (event) => {
                      history.push(`/detail/${record.id}`);
                    },
                  };
                }}
              />
            </Card>
          </div>
        </div>
      );
    }
  } else {
    return <Redirect to="/login" />;
  }
}
