
const name = _req.getString("name");
const username = _req.getString("username");
const email = _req.getString("mail");
const password = _req.getString("password");
const old_password = _req.getString("old_password");

if(password.length > 0 && !_auth.check(old_password)) {
    _out.json(_val.map().set("result", false).set("error","wrong_password"));
} else {

    const dbClient = _db.queryFirst(`
        SELECT * FROM client_user WHERE client_user_id = ?::int
    `, _val.list().add(_user.id()));

    const oldUser = _user.get(_user.id());
    oldUser
        .set("name", name)
        .set("user", username)
        .set("mail", email);

    if (password.length > 0) {

        oldUser.set("pass", password);
        _user.update(
            _user.id(),
            oldUser,
            true
        );
    } else {
        _user.update(
            _user.id(),
            oldUser
        );
    }

    _db.update(
        "client_user",
        dbClient.getInt("id"),
        _val.init()
            .set("name", name)
            .set("email", email)
    );

    _out.json(_val.map().set("result", true));

}