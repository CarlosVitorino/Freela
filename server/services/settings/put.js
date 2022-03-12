
const name = _req.getString("name");
const type = _req.getString("type");
const legal_name = _req.hasKey("legal_name") ? _req.getString("legal_name") : null;
const vat = _req.hasKey("vat") ? _req.getString("vat") : null;
const website = _req.hasKey("website") ? _req.getString("website") : null;
const phone = _req.hasKey("phone") ? _req.getString("phone") : null;
const description = _req.hasKey("description") ? _req.getString("description") : null;
const type_value = _req.hasKey("type_value") ? _req.getString("type_value") : null;
let result = false;
let value = null;
switch(type) {
    case 'supplier':
        result = _db.insert(
            "supplier",
            _val.init()
                .set("name", name)
                .set("legal_name", legal_name)
                .set("vat", vat)
                .set("website", website)
                .set("phone", phone)
                .set("client_user_id", _user.id)
        );
        break;
    case 'type':
        value = name.replace(/\s+/g, '-').toLowerCase();
        result = _db.insert(
            "session_type",
            _val.init()
                .set("label", name)
                .set("value", value)
                .set("description", description)
                .set("client_user_id", _user.id)
        );
        break;
    case 'subType':
        dbSessionType = _db.queryFirst(`
        SELECT * FROM session_type WHERE value = ? and client_user_id = ?::int
    `, _val.list().add(type_value).add(_user.id));  

        value = name.replace(/\s+/g, '-').toLowerCase();
        result = _db.insert(
            "session_sub_type",
            _val.init()
                .set("label", name)
                .set("value", value)
                .set("type_id", dbSessionType ? dbSessionType.getInt("id"): null)
                .set("description", description)
                .set("client_user_id", _user.id)
        );
        break;
}

_out.json(_val.map().set("result", result));