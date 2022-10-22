// _core : pdf

const moment = require('moment');

const created_at = _req.getString("created_at");
const total_amount = _req.getFloat("total_amount");
const billing_period = _req.hasKey("billing_period") ? _req.getString("billing_period") : null;
const client = _req.hasKey("client") ? _req.getString("client") : null;
const supplier = _req.hasKey("supplier") ? _req.getString("supplier") : null;
const pay_day = _req.hasKey("pay_day") ? _req.getString("pay_day") : null;
const sessions = _req.hasKey("sessions") ? _req.getString("sessions") : null;
const description = _req.hasKey("description") ? _req.getString("description") : null;
const provider = _req.hasKey("provider") ? _req.getString("provider") : null;
const date = _req.hasKey("date") ? _req.getString("date") : moment().format('YYYY-MM-DD');

const dbPaymentStatus = _db.queryFirst(`
    SELECT id FROM payment_status WHERE code = ?
`, _val.list().add(total_amount > 0 ? 'waiting_payment' : "paid"));

let provider_id = null;
if(_req.hasKey("provider")){
    provider_id = _db.queryFirst(`
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
        .set("supplier_id", supplier)
        .set("pay_day", pay_day)
        .set("sessions", sessions)
        .set("description", description)
        .set("provider_id", provider_id)
        .set("paid_at", date)
        .set("status_id", dbPaymentStatus.getInt('id'))
        .set("client_user_id", _user.id)
);

//Generate PDF
const sessionsDataDB = _db.query(`
    SELECT * FROM sessions WHERE id IN (?)
`, _val.list().add(sessions));

const company = _db.findFirst(
    "company",
    _val.init()
        .set("client_user_id", _user.id)
);

const clientDB = _db.get("client", client);
const invoce = _db.get("invoice", invoice_id);

generatePDF(invoce, company, clientDB, sessionsDataDB);


_out.json(_val.map().set("result", true).set("invoice_id", invoice_id));