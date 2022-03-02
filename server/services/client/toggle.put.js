const active = _req.getBoolean("active");
const clientId = _req.getInt("clientId");
_log.info("client:" + clientId + " active: " + active)
_db.update(
    "client",
    clientId,
    _val.init()
        .set("active", active)
);

_out.json(_val.map().set("result", true));