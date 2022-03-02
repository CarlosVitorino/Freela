const clientId = _req.getInt("clientId");

const clients = _db.queryFirst(`
    SELECT client.*, fitness_data.*, client.active as active, session_type.value as default_session_type FROM client
    INNER JOIN fitness_data ON client.id = fitness_data.client_id
    LEFT JOIN session_type ON client.default_session_type_id = session_type.id
    WHERE client.id = ?::int
`, _val.list().add(clientId));

_out.json(_val.map().set("result", true).set("data", _val.list().add(clients)));