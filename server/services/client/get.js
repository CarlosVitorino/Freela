const clients = _db.query(`
    SELECT client.*, session_type.text as default_session_type FROM client
    LEFT JOIN session_type ON client.default_session_type_id = session_type.id
    WHERE client.user != ?::int
`, _val.list().add(_user.id));
    
_log.debug(`user id ${_user.id}`);
_out.json(_val.map().set("result", true).set("data", clients));