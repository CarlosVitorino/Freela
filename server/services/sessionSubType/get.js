_out.json(_val.map().set("result", true).set("data", _db.query(`SELECT * FROM session_sub_type WHERE client_user_id = ${_user.id()} order by label;`)));