const invoiceId = _req.getInt("invoiceId");
const status = _req.getString("status");

const dbPaymentStratus = _db.queryFirst(`
    SELECT id FROM payment_status WHERE code = ?
`, _val.list().add(status));

_db.update(
    "finance",
    invoiceId,
    _val.init()
        .set("status_id", dbPaymentStratus.getInt('id'))
);

_out.json(_val.map().set("result", true));