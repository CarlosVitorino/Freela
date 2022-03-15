const clients = _db.query(`
    SELECT client.id, client.name
    FROM client
    WHERE client.client_user_id = ?::int
    ORDER BY client.name;
`, _val.list().add(_user.id));
    
_log.debug(`user id ${_user.id}`);
_out.json(_val.map().set("result", true).set("data", clients));