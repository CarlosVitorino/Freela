import React, { useState, useEffect } from "react";
import { Redirect, useLocation, useHistory, Link } from "react-router-dom";
import {
  Typography,
  Space,
  Button,
  Input,
  Table,
  notification,
  Spin,
  Popconfirm,
  Card,
  Tooltip,
  DatePicker,
  Modal,
} from "antd";
import { DeleteOutlined, CheckSquareFilled, MinusSquareFilled, FilePdfOutlined } from "@ant-design/icons";
import { JellyTriangle } from "@uiball/loaders";

import config from "../../config/config.json";
import _auth from "@netuno/auth-client";
import _service from "@netuno/service-client";
import classNames from "classnames";
import moment from "moment";

import "./index.less";

const { Title, Text } = Typography;

export default function Finance(props) {
  const [loading, setLoading] = useState(false);
  const [financeData, setFinanceData] = useState(false);
  const [financeDataFiltered, setFinanceDataFiltered] = useState(false);
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [record, setRecord] = useState(false);
  const [paidAt, setPaidAt] = useState(moment());
  const location = useLocation();
  const history = useHistory();

  const columns = [
    {
      title: "Intervener",
      dataIndex: "name",
      key: "name",
    },
    {
      title: "Billing Info",
      dataIndex: "description",
      key: "description",
    },
    {
      title: "Pay Day",
      dataIndex: "pay_day",
      key: "pay_day",
    },
    {
      title: "Paid at",
      dataIndex: "date",
      key: "date",
    },
    {
      title: "Amount",
      dataIndex: "total_amount",
      key: "total_amount",
      render: (_, record) => {
        return record.total_amount + "€";
      },
    },
    {
      title: "Status",
      dataIndex: "status",
      key: "status",
      render: (_, record) =>
        financeData.length >= 1 ? (
          <>
            {record.status_code === "waiting_payment" ? (
              <Tooltip title="Waiting Payment - click to change">
                <Button
                  type="link"
                  className="action-icon"
                  onClick={() => showModal(record)}
                  icon={<MinusSquareFilled className="action-icon-yellow" />}
                />
              </Tooltip>
            ) : (
              <Tooltip title="Paid - click to change">
                <Button
                  type="link"
                  className="action-icon"
                  onClick={() => handleStatusChange(record)}
                  icon={<CheckSquareFilled className="action-icon-green" />}
                />
              </Tooltip>
            )}
            {record.status}{" "}
          </>
        ) : (
          record.status
        ),
    },
    {
      title: "Operation",
      dataIndex: "operation",
      render: (_, record) =>
        financeData.length >= 1 ? (
          <Space>
            <Popconfirm
              title="Are you sure, you want to DELETE this record?"
              onConfirm={() => handleDeleteRecord(record)}
            >
              <Tooltip title="Delete">
                <DeleteOutlined className="action-icon" />
              </Tooltip>
            </Popconfirm>
            <Tooltip title="View Invoice PDF">
              <FilePdfOutlined className="action-icon" onClick={() => fetchPdf(record.id)} />
            </Tooltip>
          </Space>
        ) : null,
    },
  ];

  useEffect(() => {
    onFetchFinance();
  }, [location]);

  const onFetchFinance = () => {
    setLoading(true);
    _service({
      method: "GET",
      url: "finance",
      success: (response) => {
        setLoading(false);
        if (response.json.result) {
          setFinanceData(response.json.data);
          setFinanceDataFiltered(response.json.data);
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
  };

  const handleStatusChange = (data) => {
    const paidAt = data.paidAt ? data.paidAt.format("YYYY-MM-DD") : null;
    setLoading(true);
    _service({
      method: "PUT",
      url: "finance/toggle",
      data: {
        status: data.status_code === "waiting_payment" ? "paid" : "waiting_payment",
        invoiceId: data.id,
        paidAt: paidAt,
      },
      success: (response) => {
        if (response.json.result) {
          notification["success"]({
            message: "Status updated!",
            description: "Status updated successfully.",
          });
          onFetchFinance();
          setLoading(false);
        } else {
          notification["warning"]({
            message: "Status toggle error!",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact the support.",
        });
      },
    });
  };

  const handleDeleteRecord = (record) => {
    setLoading(true);
    _service({
      method: "DELETE",
      url: "finance",
      data: {
        id: record.id,
      },
      success: (response) => {
        if (response.json.result) {
          notification["success"]({
            message: "Status updated!",
            description: "Status updated successfully.",
          });
          onFetchFinance();
          setLoading(false);
        } else {
          notification["warning"]({
            message: "Status toggle error!",
            description: response.json.error,
          });
          setLoading(false);
        }
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact the support.",
        });
      },
    });
  };

  const fetchPdf = (id) => {
    setLoading(true);
    _service({
      method: "GET",
      url: "invoice/pdf?id=" + id,
      blob: true,
      success: (response) => {
        const { blob } = response;
        if (blob) {
          const file = window.URL.createObjectURL(blob);
          window.open(file, "_blank");
        }
        setLoading(false);
      },
      fail: () => {
        setLoading(false);
        notification["error"]({
          message: "Error!",
          description: "There was an error, please contact the support.",
        });
      },
    });
  };

  const showModal = (record) => {
    setRecord(record);
    setIsModalVisible(true);
  };

  const handleOk = () => {
    const newRecord = record;
    newRecord.paidAt = paidAt;
    setPaidAt(moment());
    setIsModalVisible(false);
    handleStatusChange(record);
  };

  const handleCancel = () => {
    setIsModalVisible(false);
  };

  const filter = (e) => {
    const value = e.target.value;
    if (!value) {
      setFinanceDataFiltered(financeData);
    } else {
      let filteredData = financeData.filter((finance) => {
        let exist = false;
        for (var prop in finance) {
          if (Object.prototype.hasOwnProperty.call(finance, prop)) {
            if (finance[prop].toString().toLowerCase().indexOf(value.toLowerCase()) !== -1) exist = true;
          }
        }
        return exist;
      });
      setFinanceDataFiltered(filteredData);
    }
  };

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
        <div className="finance">
          <div className="content-title">
            <Title className="big-title">
              <span>Finance</span>
            </Title>
          </div>
          <div className={classNames("content-body", "content-table")}>
            <Card>
              <div className="actions-n-filters">
                <Space style={{ marginBottom: 16 }}>
                  <Button type="primary">
                    <Link to="/finance/expense">Add Expense</Link>
                  </Button>
                  <Input placeholder="Search..." onChange={filter} />
                </Space>
              </div>
              <div className="content-table">
                <Table dataSource={financeDataFiltered} columns={columns} scroll={{ x: "" }} size="small" />
              </div>
            </Card>
            <Modal
              title="Please enter the payment date"
              visible={isModalVisible}
              onOk={handleOk}
              onCancel={handleCancel}
            >
              <Space>
                <Text>Payment Date:</Text>
                <DatePicker value={paidAt} onChange={(date) => setPaidAt(date)} />
              </Space>
            </Modal>
          </div>
        </div>
      );
    }
  } else {
    return <Redirect to="/login" />;
  }
}
