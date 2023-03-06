import React, { useEffect, useState } from "react";
import { useMediaQuery } from "react-responsive";

import { Switch, Route, useLocation, Link, Redirect } from "react-router-dom";

import { ConfigProvider, Layout, Menu, Typography } from "antd";
import { MenuOutlined } from "@ant-design/icons";
import { ReactSVG } from "react-svg";

import antLocale_ptPT from "antd/lib/locale/pt_PT";
import classNames from "classnames";

import _auth from "@netuno/auth-client";
import "./common/Config";

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

export default function App(props) {
  const location = useLocation();

  const [headerButtonMode, setHeaderButtonMode] = useState("login");
  const [collapsed, setCollapsed] = useState(false);
  const [menu, setMenu] = useState("dashboard");
  const [logo, setLogo] = useState(false);
  const [sideMenuMobileMode, setSideMenuMobileMode] = useState(false);
  const isMobile = useMediaQuery({ query: `(max-width: 760px)` });

  useEffect(() => {
    setHeaderButtonMode(location.pathname);
    setMenu(location.pathname);
    setLogo(
      !collapsed ? (
        <ReactSVG
          className={classNames(!_auth.isLogged() ? "login-logo" : "logo")}
          alt="logo"
          src="images/logo.svg"
        />
      ) : (
        <ReactSVG
          className="logo logo-small"
          alt="logo"
          src="images/logo-small.svg"
        />
      )
    );
  }, [location]);

  function onLogout() {
    _auth.logout();
  }

  function onCollapse() {
    if (!collapsed) {
      setLogo(
        <ReactSVG
          className="logo logo-small"
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
  }

  return (
    <ConfigProvider locale={antLocale_ptPT}>
      <Layout
        className={
          "page " +
          classNames(
            { "auth ": _auth.isLogged(), "collapsed ": collapsed },
            !_auth.isLogged() && " page-login"
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
            collapsedWidth={isMobile ? "100" : "100"}
            breakpoint={("sm", "lg")}
            collapsible
            collapsed={collapsed}
            onCollapse={onCollapse}
            trigger={isMobile ? <MenuOutlined /> : null}
            theme="light"
          >
            <div className="logo-container">{logo}</div>
            <Menu selectedKeys={[menu]} mode="inline" className="inner-menu">
              <Menu.Item
                key="collapse"
                onClick={() => onCollapse()}
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
                <Text className="menu-group">ANALIZE</Text>
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
                  <Link to="/login" onClick={onLogout} className="lougout-link">
                    Logout
                  </Link>
                )}
              </Menu.Item>
            </Menu>
          </Sider>
        )}
        <Layout>
          <Content className={classNames({ "auth ": _auth.isLogged() })}>
            <Switch>
              <Route exact path="/">
                {_auth.isLogged() ? (
                  <Redirect to="/dashboard" />
                ) : (
                  <Redirect to="/login" />
                )}
              </Route>
              <Route path="/dashboard" component={Dashboard} />
              <Route path="/clients" component={Clients} />
              <Route path="/sessions" component={Sessions} />
              <Route path="/detail/:id" component={Detail} />
              <Route path="/detail" component={Detail} />
              <Route path="/finance/invoice" component={Invoice} />
              <Route path="/finance/expense" component={Expense} />
              <Route path="/finance" component={Finance} />
              <Route path="/settings" component={Settings} />
              <Route path="/login" component={LoginPage} />
              <Route path="/register" component={RegisterPage} />
              <Route path="/recovery" component={RecoveryPage} />
              <Route component={NotFoundPage} />
            </Switch>
          </Content>
          {/*!_auth.isLogged() && <Footer>© sitana.pt 2021</Footer>*/}
        </Layout>
      </Layout>
    </ConfigProvider>
  );
}
