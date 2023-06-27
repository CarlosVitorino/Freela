

const id = _req.getInt("companyId");
const company = _req.getString("company");
const address = _req.hasKey("address") ? _req.getString("address") : null;
const city = _req.hasKey("city") ? _req.getString("city") : null;
const postal_code = _req.hasKey("postal_code") ? _req.getString("postal_code") : null;
const vat = _req.hasKey("vat") ? _req.getString("vat") : null;
const country = _req.hasKey("country") ? _req.getString("country") : null;
const terms = _req.hasKey("terms") ? _req.getString("terms") : null;
_log.info(`User: ${_user.id()} is updating company ${id}`);
const invoice_id = _db.update(
    "company",
    id,
    _val.init()
        .set("company", company)
        .set("address", address)
        .set("city", city)
        .set("postal_code", postal_code)
        .set("vat", vat)
        .set("country", country)
        .set("terms", terms)
        .set("client_user_id", _user.id())
);


_out.json(_val.map().set("result", true));