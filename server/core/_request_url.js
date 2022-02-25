
// _log.info(_url.url())

/**
 *  ALLOW CORS
 */
/*
_header.response.set("Access-Control-Allow-Origin", "https://www.netuno.org")
_header.response.set("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS")
_header.response.set("Access-Control-Allow-Headers", "content-type,x-requested-with,authorization")
_header.response.set("Access-Control-Allow-Credentials", true)
*/
var httpHeaderOrigin = _header.getString("Origin", "null")

if (httpHeaderOrigin == 'http://172.24.190.78:3000'
    || httpHeaderOrigin == 'http://127.0.0.1:3000'
    || httpHeaderOrigin == 'http://localhost:3000') {
    _header.response.set("Access-Control-Allow-Origin", httpHeaderOrigin)
    _header.response.set("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS")
    _header.response.set("Access-Control-Allow-Headers", "content-type,x-requested-with,authorization")
    _header.response.set("Access-Control-Allow-Credentials", true)
}


_url.to(_url.request())
