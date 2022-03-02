
const billing_period = _req.getString("billing_period");
const client = _req.getInt("client");
const pay_day = _req.getString("pay_day");
const created_at = _req.getString("created_at");
const sessions = _req.getString("sessions");
const total_amount = _req.getFloat("total_amount");

const dbPaymentStratus = _db.queryFirst(`
    SELECT id FROM payment_status WHERE code = ?
`, _val.list().add('waiting_payment'));

const invoice_id = _db.insert(
    "finance",
    _val.init()
        .set("client_id", client)
        .set("pay_day", pay_day)
        .set("billing_period", billing_period)
        .set("sessions", sessions)
        .set("total_amount", total_amount)
        .set("created_at", created_at)
        .set("status_id", dbPaymentStratus.getInt('id'))
);


_out.json(_val.map().set("result", true));