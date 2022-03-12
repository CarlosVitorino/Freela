const data = _val.map();
data.set("suppliers", _db.query(`SELECT * FROM supplier where client_user_id = ${_user.id};`));
data.set("types", _db.query(`SELECT * FROM session_type WHERE client_user_id = ${_user.id};`));
data.set("subTypes", _db.query(`SELECT * FROM session_sub_type WHERE client_user_id = ${_user.id};`));

_out.json(_val.map().set("result", true).set("data", data));
