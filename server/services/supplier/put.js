
const name = _req.getString("name");
const legal_name = _req.hasKey("legal_name") ? _req.getString("legal_name") : null;
const vat = _req.hasKey("vat") ? _req.getString("vat") : null;
const website = _req.hasKey("website") ? _req.getString("website") : null;
const phone = _req.hasKey("phone") ? _req.getString("phone") : null;

const invoice_id = _db.insert(
    "supplier",
    _val.init()
        .set("name", name)
        .set("legal_name", legal_name)
        .set("vat", vat)
        .set("website", website)
        .set("phone", phone)
        .set("client_user_id", _user.id)
);


_out.json(_val.map().set("result", true));