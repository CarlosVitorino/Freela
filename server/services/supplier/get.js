_out.json(_val.map().set("result", true).set("data", _db.query(`SELECT * FROM supplier where client_user_id = ?::int;`, _val.list().add( _user.id ))));