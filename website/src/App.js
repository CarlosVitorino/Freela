import React, { useEffect, useState } from "react";
import { Switch, Route, useLocation, Link, Redirect } from "react-router-dom";

import { ConfigProvider, Layout, Menu, Button } from 'antd';
import { PieChartOutlined, UserOutlined, LogoutOutlined, MenuOutlined, EditOutlined, TeamOutlined, SkinOutlined, WalletOutlined } from '@ant-design/icons';
import { ReactSVG } from 'react-svg'

import antLocale_ptPT from 'antd/lib/locale/pt_PT';
import classNames from 'classnames';

import _auth from '@netuno/auth-client';
import './common/Config';

import LoginPage from './pages/Login';
import RegisterPage from './pages/Register';
import Dashboard from './pages/Dashboard';
import Clients from './pages/Clients';
import Sessions from './pages/Sessions';
import Invoice from './pages/Finance/Invoice';
import Expense from './pages/Finance/Expense';
import Finance from './pages/Finance';
import Detail from './pages/Clients/Detail';
import RecoveryPage from './pages/Recovery';
import Profile from './pages/Profile';
import NotFoundPage from './pages/NotFound';
import ReservedArea from './pages/ReservedArea';

import './styles/App.less';

const { Header, Content, Sider, Footer } = Layout;
const { SubMenu } = Menu;

export default function App(props) {

  const location = useLocation();

  const [headerButtonMode, setHeaderButtonMode] = useState('login');
  const [collapsed, setCollapsed] = useState(false);
  const [menu, setMenu] = useState('dashboard');
  const [logo, setLogo] = useState(false);
  const [sideMenuMobileMode, setSideMenuMobileMode] = useState(false);

  useEffect(() => {
    setHeaderButtonMode(location.pathname);
    setMenu(location.pathname);
    !logo &&  setLogo(<ReactSVG  className="logo" alt="logo"  src="images/mytime-logo-3.svg" />)
  }, [location]);

  function onLogout() {
    _auth.logout();
  }

  function onCollapse() {
    if(!collapsed) {
      setLogo(<ReactSVG  className="logo logo-small" alt="logo"  src="images/mytime-logo-mini-3.svg" />)
    } else {
      setLogo(<ReactSVG  className="logo" alt="logo"  src="images/mytime-logo-3.svg" />)
    }
    setCollapsed(!collapsed)
  }

  return (
    <ConfigProvider locale={antLocale_ptPT}>
      <Layout className={'page ' + classNames({ 'auth ': _auth.isLogged()}) + classNames({ 'collapsed ': collapsed }, !_auth.isLogged() && ' page-login') }>
        {_auth.isLogged() &&
          <Sider
            onBreakpoint={mobile => {
              setSideMenuMobileMode(mobile)
            }}
            collapsedWidth={sideMenuMobileMode ? '0' : '80'}
            breakpoint={"md"}
            collapsible
            collapsed={collapsed}
            onCollapse={onCollapse}
            onBreakpoint={broken => {
              console.log(broken);
            }}
            trigger={<MenuOutlined />}
            theme="light"
          >
            <div className="logo-container">
              {logo}
            </div>
            <Menu selectedKeys={[menu]} mode="inline">
              <Menu.Item key="/dashboard" icon={<PieChartOutlined />}>
                <Link to="/dashboard">Dashboard</Link>
              </Menu.Item>
              <Menu.Item key="/clients" icon={<TeamOutlined />}>
                <Link to="/clients">Clients</Link>
              </Menu.Item>
              <Menu.Item key="/sessions" icon={<SkinOutlined />}>
                <Link to="/sessions">Sessions</Link>
              </Menu.Item>              
              <Menu.Item key="/finance" icon={<WalletOutlined />}>
                <Link to="/finance">Finance</Link>
              </Menu.Item>
            </Menu>
          </Sider>
        }
        <Layout>
          <Header className={classNames({ 'auth ': _auth.isLogged() }, { 'collapsed ': collapsed }, !_auth.isLogged() ? 'login-page': '')}>
            { !_auth.isLogged() &&
              <div className="logo-container">
                {logo}
              </div>
            }
            <Menu mode="horizontal">
              {headerButtonMode === '/login' ?
                ""
                : headerButtonMode === '/register' ?
                  <Link to="/login">
                    <Button type="primary">Iniciar sessão</Button>
                  </Link>
                  : _auth.isLogged() &&
                  <SubMenu key={"profile"} className="profile-menu" icon={<UserOutlined />}>
                    <Menu.Item key="1">
                      <Link to="/profile">
                        <EditOutlined />&nbsp;&nbsp;&nbsp;Editar Perfil
                      </Link>
                    </Menu.Item>
                    <Menu.Item key="2">
                      <Link to="/login">
                        <Button type="link" onClick={onLogout} danger>
                          <LogoutOutlined /> Terminar Sessão
                        </Button>
                      </Link>
                    </Menu.Item>
                  </SubMenu>
              }
            </Menu>
          </Header>
          <Content className={classNames({ 'auth ': _auth.isLogged() })}>
            <Switch>
              <Route exact path="/">
                {_auth.isLogged() ?
                  <Redirect to="/dashboard" />
                  :
                  <Redirect to="/login" />
                }
              </Route>
              <Route path="/dashboard" component={Dashboard} />
              <Route path="/clients" component={Clients} />
              <Route path="/sessions" component={Sessions} />
              <Route path="/detail/:id" component={Detail} />
              <Route path="/detail" component={Detail} />
              <Route path="/finance/invoice" component={Invoice} />
              <Route path="/finance/expense" component={Expense} />
              <Route path="/finance" component={Finance} />
              <Route path="/profile" component={Profile} />
              <Route path="/login" component={LoginPage} />
              <Route path="/register" component={RegisterPage} />
              <Route path="/recovery" component={RecoveryPage} />
              <Route component={NotFoundPage} />
            </Switch>
          </Content>
          {!_auth.isLogged() &&
            <Footer>© sitana.pt 2021</Footer>
          }
        </Layout>
      </Layout>
    </ConfigProvider>
  );
}