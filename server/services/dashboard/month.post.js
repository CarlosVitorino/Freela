const moment = require('moment');
const startOfMonth = moment().startOf('month').format('YYYY-MM-DD');
const endOfMonth   = moment().endOf('month').format('YYYY-MM-DD');
const startOfLastMonth = moment().subtract(1,'months').startOf('month').format('YYYY-MM-DD');
const endOfLastMonth   = moment().subtract(1,'months').endOf('month').format('YYYY-MM-DD');
const daysUntilEndOfMonth = moment().endOf('month').diff(moment(), 'days');
const daysInMonth = moment().daysInMonth();

const data = _val.map();

const totalNewDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration FROM session WHERE date BETWEEN '${startOfMonth}' AND '${endOfMonth}';`)
const totalLastDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration FROM session WHERE date BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}';`)

const totalNewMoney = totalNewDb ? totalNewDb.getFloat("money") : 0;
const totalNewDuration = totalNewDb ? totalNewDb.getFloat("duration") : 0;
const totalLast = totalLastDb ? totalLastDb.getFloat("money") : 0;

// Estimate Month Money
const estimatedMonthMoneyDb = _db.queryFirst(`SELECT SUM(sessions_per_month * default_price) as estimated FROM client where active = true;`)
const estimatedMonthMoney = estimatedMonthMoneyDb ? estimatedMonthMoneyDb.getFloat("estimated") : 0;
const estimatedMoneyLeft = (estimatedMonthMoney / daysInMonth) * daysUntilEndOfMonth;
const particalEstimatedMonthMoney = totalNewMoney + estimatedMoneyLeft;

// Received/Spended
const receivedDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount > 0 and paid_at BETWEEN '${startOfMonth}' AND '${endOfMonth}';`)
const paidDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount < 0 AND created_at BETWEEN '${startOfMonth}' AND '${endOfMonth}';`)
const receivedLastDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE paid_at BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}';`)
const paidLastDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount < 0 AND created_at BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}';`)
const invoicesPaidDb = _db.queryFirst(`SELECT SUM(1) as money 
        FROM finance 
        INNER JOIN payment_status ON finance.status_id = payment_status.id
        WHERE paid_at IS NOT NULL and payment_status.code = 'paid';`)
const invoicesDb = _db.queryFirst(`SELECT SUM(1) as money FROM finance ;`)


const received = receivedDb ? receivedDb.getFloat("money") : 0;
const paid = paidDb ? paidDb.getFloat("money") : 0;
const receivedLast = receivedLastDb ? receivedLastDb.getFloat("money") : 0;
const paidLast = paidLastDb ? paidLastDb.getFloat("money") : 0;
const invoicesPaid = invoicesPaidDb ? invoicesPaidDb.getFloat("money") : 0;
const invoices = invoicesDb ? invoicesDb.getFloat("money") : 0;


const diffInvoice = (received + paid) - (receivedLast + paidLast);


data.set("totalMoney", totalNewMoney);
data.set("totalTime", totalNewDuration);
data.set("diffMoney", totalNewMoney - totalLast) ;
data.set("estimatedMoney", particalEstimatedMonthMoney) ;

data.set("received", received) ;
data.set("paid", paid) ;
data.set("invoicesPaid", invoicesPaid) ;
data.set("invoices", invoices) ;
data.set("receivedLast", receivedLast) ;
data.set("paidLast", paidLast) ;
data.set("diffInvoice", diffInvoice) ;
data.set("estimatedMoneyLeft", estimatedMoneyLeft) ;

_out.json(_val.map().set("result", true).set("data", data));