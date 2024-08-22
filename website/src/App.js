import React, { useEffect, useState } from "react";
import { useMediaQuery } from "react-responsive";
import { Routes, Route, useLocation, Link, Navigate } from "react-router-dom";
import { ConfigProvider, Layout, Menu, Typography } from "antd";
import { MenuOutlined } from "@ant-design/icons";
import { ReactSVG } from "react-svg";
import antLocale_en from "antd/lib/locale/en_GB";
import classNames from "classnames";

import _service from "@netuno/service-client";
import _auth from "@netuno/auth-client";
import "./common/Config";
import themeConfig from "./theme"; 

import LoginPage from "./pages/Login";
import RegisterPage from "./pages/Register";
import Dashboard from "./pages/Dashboard";
import Clients from "./pages/Clients";
import Sessions from "./pages/Sessions";
import Invoice from "./pages/Finance/Invoice";
import Expense from "./pages/Finance/Expense";
import Finance from "./pages/Finance";
import Detail from "./pages/Clients/Detail";
import Settings from "./pages/Settings";
import RecoveryPage from "./pages/Recovery";
import NotFoundPage from "./pages/NotFound";
import {
  CardIcon,
  PieChartIcon,
  OptionsIcon,
  TimeIcon,
  UserIcon,
  ExitIcon,
  MenuIcon,
} from "./components/Icons";

import "./styles/App.less";

const { Content, Sider } = Layout;
const { Text } = Typography;

const App = () => {
  const location = useLocation();
  const [headerButtonMode, setHeaderButtonMode] = useState("login");
  const [collapsed, setCollapsed] = useState(true);
  const [menu, setMenu] = useState("dashboard");
  const [logo, setLogo] = useState(false);
  const [sideMenuMobileMode, setSideMenuMobileMode] = useState(false);
  const isMobile = useMediaQuery({ query: `(max-width: 760px)` });

  useEffect(() => {
    setHeaderButtonMode(location.pathname);
    setMenu(location.pathname);
  }, [location]);

  useEffect(() => {
    setLogo(
      !collapsed ? (
        <ReactSVG
          className={classNames(!_auth.isLogged() ? "login-logo" : "logo")}
          alt="logo"
          src="images/logo.svg"
        />
      ) : (
        <ReactSVG
          className={classNames(isMobile ? "logo logo-mobile" : "logo logo-small")}
          alt="logo"
          src="images/logo-small.svg"
        />
      )
    );
  }, [collapsed, isMobile]);

  const onLogout = () => {
    _auth.logout();
  };

  const onCollapse = () => {
    if (!collapsed) {
      setLogo(
        <ReactSVG
          className={classNames(isMobile ? "logo logo-mobile" : "logo logo-small")}
          alt="logo"
          src="images/logo-small.svg"
        />
      );
    } else {
      setLogo(
        <ReactSVG
          className={classNames(!_auth.isLogged() ? "login-logo" : "logo")}
          alt="logo"
          src="images/logo.svg"
        />
      );
    }
    setCollapsed(!collapsed);
  };

  return (
    <ConfigProvider locale={antLocale_en} theme={themeConfig}>
      <Layout
        className={
          "page " +
          classNames(
            { "auth": _auth.isLogged(), "collapsed": collapsed },
            !_auth.isLogged() && "page-login"
          )
        }
      >
        {_auth.isLogged() && (
          <Sider
            className="menu-side"
            onBreakpoint={(breakpoint) => {
              console.log(breakpoint);
              setSideMenuMobileMode(breakpoint);
            }}
            collapsedWidth={isMobile ? "60" : "100"}
            breakpoint="sm"
            collapsible
            collapsed={collapsed}
            onCollapse={setCollapsed}
            trigger={isMobile ? <MenuOutlined /> : null}
            theme="light"
          >
            <div className="logo-container">{logo}</div>
            <Menu selectedKeys={[menu]} mode="inline" className="inner-menu">
              <Menu.Item
                key="collapse"
                onClick={onCollapse}
                icon={<MenuIcon />}
              >
                <span className="menu-trigger">MENU</span>
              </Menu.Item>
              <div
                className={
                  collapsed
                    ? "menu-group-wrapper-collapsed"
                    : "menu-group-wrapper"
                }
              >
                <Text className="menu-group">ANALYZE</Text>
              </div>
              <Menu.Item key="/dashboard" icon={<PieChartIcon />}>
                <Link to="/dashboard">Dashboard</Link>
              </Menu.Item>
              <div
                className={
                  collapsed
                    ? "menu-group-wrapper-collapsed"
                    : "menu-group-wrapper"
                }
              >
                <Text className="menu-group">TRACK</Text>
              </div>
              <Menu.Item key="/sessions" icon={<TimeIcon />}>
                <Link to="/sessions">Sessions</Link>
              </Menu.Item>
              <div
                className={
                  collapsed
                    ? "menu-group-wrapper-collapsed"
                    : "menu-group-wrapper"
                }
              >
                <Text className="menu-group">MANAGE</Text>
              </div>
              <Menu.Item key="/clients" icon={<UserIcon />}>
                <Link to="/clients">Clients</Link>
              </Menu.Item>
              <Menu.Item key="/finance" icon={<CardIcon />}>
                <Link to="/finance">Finance</Link>
              </Menu.Item>
              <Menu.Item key="/settings" icon={<OptionsIcon />}>
                <Link to="/settings">Settings</Link>
              </Menu.Item>
              <Menu.Item
                className="logout"
                key="/login"
                onClick={onLogout}
                icon={<ExitIcon />}
              >
                {!collapsed && (
                  <Link to="/login" onClick={onLogout} className="logout-link">
                    Logout
                  </Link>
                )}
              </Menu.Item>
            </Menu>
          </Sider>
        )}
        <Layout>
          <Content className={classNames({ "auth": _auth.isLogged() })}>
            <Routes>
              <Route path="/" element={
                _auth.isLogged() ? (
                  <Navigate to="/dashboard" />
                ) : (
                  <Navigate to="/login" />
                )
              } />
              <Route path="/dashboard" element={<Dashboard />} />
              <Route path="/clients" element={<Clients />} />
              <Route path="/sessions" element={<Sessions />} />
              <Route path="/clients/detail/:id" element={<Detail />} />
              <Route path="/clients/detail" element={<Detail />} />
              <Route path="/finance/invoice" element={<Invoice />} />
              <Route path="/finance/expense" element={<Expense />} />
              <Route path="/finance" element={<Finance />} />
              <Route path="/settings" element={<Settings />} />
              <Route path="/login" element={<LoginPage />} />
              <Route path="/register" element={<RegisterPage />} />
              <Route path="/recovery" element={<RecoveryPage />} />
              <Route path="*" element={<NotFoundPage />} />
            </Routes>
          </Content>
          {/*!_auth.isLogged() && <Footer>© sitana.pt 2021</Footer>*/}
        </Layout>
      </Layout>
    </ConfigProvider>
  );
};

export default App;
