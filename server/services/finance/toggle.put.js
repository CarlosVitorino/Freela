const moment = require('moment');

const invoiceId = _req.getInt("invoiceId");
const status = _req.getString("status");
const paid_at = _req.getString("paidAt");
//const paid_at = _req.getString("status") === "paid" ? moment().format('YYYY-MM-DD') : null;

const dbPaymentStratus = _db.queryFirst(`
    SELECT id FROM payment_status WHERE code = ?
`, _val.list().add(status));

_db.update(
    "finance",
    invoiceId,
    _val.init()
        .set("status_id", dbPaymentStratus.getInt('id'))
        .set("paid_at", paid_at )
);

_out.json(_val.map().set("result", true));