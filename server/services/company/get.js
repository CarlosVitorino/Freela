const company = _db.findFirst(
    "company",
    _val.init()
        .set("client_user_id", _user.id)
);

_out.json(_val.map().set("result", true).set("data", company));