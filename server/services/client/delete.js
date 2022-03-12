const id = _req.getInt("id") 

const resultFinance = _db.execute(`
delete from finance where client_id = ? and client_user_id = ?::int
`, _val.list().add(id).add(_user.id));

const resultSession = _db.execute(`
delete from session where client_id = ? and client_user_id = ?::int
`, _val.list().add(id).add(_user.id));

const resultClient = _db.execute(`
delete from client where id = ? and client_user_id = ?::int
`, _val.list().add(id).add(_user.id));

const data = _val.map().set("resultFinance", resultSession).set("resultFinance", resultFinance).set("resultClient", resultClient)

_out.json(_val.map().set("result", true).set("data", data));
