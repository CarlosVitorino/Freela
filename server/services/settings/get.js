const data = _val.map();
data.set("suppliers", _db.query(`SELECT * FROM supplier where client_user_id = ${_user.id};`));
data.set("types", _db.query(`SELECT * FROM session_type WHERE client_user_id = ${_user.id};`));
data.set("subTypes", _db.query(`
    SELECT session_sub_type.*, session_type.value as type_value FROM session_sub_type 
    INNER JOIN session_type ON session_sub_type.type_id = session_type.id 
    WHERE session_sub_type.client_user_id = ${_user.id};`));

_out.json(_val.map().set("result", true).set("data", data));
