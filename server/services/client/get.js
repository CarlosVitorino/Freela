const clients = _db.query(`
    SELECT client.*, session_type.label as default_session_type, session_sub_type.label as default_session_sub_type 
    FROM client
    LEFT JOIN session_type ON client.default_session_type_id = session_type.id
    LEFT JOIN session_sub_type ON client.default_session_sub_type_id = session_sub_type.id
    WHERE client.client_user_id = ?::int
    ORDER BY client.name;
`, _val.list().add(_user.id));
    
_log.debug(`user id ${_user.id}`);
_out.json(_val.map().set("result", true).set("data", clients));