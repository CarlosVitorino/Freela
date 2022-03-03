import React, { useEffect, useState } from "react";
import { Switch, Route, useLocation, Link, Redirect } from "react-router-dom";

import { ConfigProvider, Layout, Menu, Button } from 'antd';
import { PieChartOutlined, UserOutlined, LogoutOutlined, MenuOutlined, EditOutlined, TeamOutlined, SkinOutlined, WalletOutlined } from '@ant-design/icons';
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
  const [sideMenuMobileMode, setSideMenuMobileMode] = useState(false);

  useEffect(() => {
    setHeaderButtonMode(location.pathname);
  }, [location]);

  function onLogout() {
    _auth.logout();
  }

  function onCollapse() {
    setCollapsed(!collapsed)
  }

  return (
    <ConfigProvider locale={antLocale_ptPT}>
      <Layout className={'page ' + classNames({ 'auth ': _auth.isLogged() }) + classNames({ 'collapsed ': collapsed })}>
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
            trigger={<MenuOutlined />}
            theme="light"
          >
            <div className="logo-container"><img alt="logo" src="/images/logo.png" /></div>
            <Menu defaultSelectedKeys={['1']} mode="inline">
              <Menu.Item key="1" icon={<PieChartOutlined />}>
                <Link to="/clients">Dashboard</Link>
              </Menu.Item>
              <Menu.Item key="2" icon={<TeamOutlined />}>
                <Link to="/clients">Clients</Link>
              </Menu.Item>
              <Menu.Item key="3" icon={<SkinOutlined />}>
                <Link to="/sessions">Sessions</Link>
              </Menu.Item>              
              <Menu.Item key="4" icon={<WalletOutlined />}>
                <Link to="/Finance">Finance</Link>
              </Menu.Item>
            </Menu>
          </Sider>
        }
        <Layout>
          <Header className={classNames({ 'auth ': _auth.isLogged() }) + classNames({ 'collapsed ': collapsed })}>
            {!_auth.isLogged() &&
              <Link to="/" className="logo-container"><img alt="logo" src="/images/logo.png" /></Link>
            }
            <Menu mode="horizontal">
              {headerButtonMode === '/login' ?
                <Link to="/register">
                  <Button type="primary">Criar conta</Button>
                </Link>
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