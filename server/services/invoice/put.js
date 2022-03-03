
const created_at = _req.getString("created_at");
const total_amount = _req.getFloat("total_amount");
const billing_period = _req.hasKey("billing_period") ? _req.getString("billing_period") : null;
const client = _req.hasKey("client") ? _req.getString("client") : null;
const pay_day = _req.hasKey("pay_day") ? _req.getString("pay_day") : null;
const sessions = _req.hasKey("sessions") ? _req.getString("sessions") : null;
const description = _req.hasKey("description") ? _req.getString("description") : null;
const provider = _req.hasKey("provider") ? _req.getString("provider") : null;

const dbPaymentStratus = _db.queryFirst(`
    SELECT id FROM payment_status WHERE code = ?
`, _val.list().add(_req.hasKey("client") ? 'waiting_payment' : "paid"));

let provider_id = null;
if(_req.hasKey("provider")){
    provider_id= _db.queryFirst(`
    SELECT id FROM provider WHERE value = ?
`, _val.list().add(provider)).getInt('id');
}


const invoice_id = _db.insert(
    "finance",
    _val.init()
        .set("created_at", created_at)
        .set("total_amount", total_amount)
        .set("billing_period", billing_period)
        .set("client_id", client)
        .set("pay_day", pay_day)
        .set("sessions", sessions)
        .set("description", description)
        .set("provider_id", provider_id)
        .set("status_id", dbPaymentStratus.getInt('id'))
);


_out.json(_val.map().set("result", true));