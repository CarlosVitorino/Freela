const moment = require('moment');
const startOfMonth = moment().startOf('month').format('YYYY-MM-DD');
const endOfMonth   = moment().endOf('month').format('YYYY-MM-DD');
const startOfYear = moment().startOf('year').format('YYYY-MM-DD');
const endOfYear   = moment().endOf('year').format('YYYY-MM-DD');
const startOfLastMonth = moment().subtract(1,'months').startOf('month').format('YYYY-MM-DD');
const endOfLastMonth   = moment().subtract(1,'months').endOf('month').format('YYYY-MM-DD');
const daysUntilEndOfMonth = moment().endOf('month').diff(moment(), 'days');
const daysInMonth = moment().daysInMonth();
const daysPassFromStartOfYear = moment().diff(moment().startOf('year'), 'days');

const data = _val.map();

const totalNewDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration FROM session WHERE date BETWEEN '${startOfMonth}' AND '${endOfMonth}' and client_user_id = ${_user.id};`)
const totalLastDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration FROM session WHERE date BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}' and client_user_id = ${_user.id};`)

const totalNewMoney = totalNewDb ? totalNewDb.getFloat("money") : 0;
const totalNewDuration = totalNewDb ? totalNewDb.getFloat("duration") : 0;
const totalLast = totalLastDb ? totalLastDb.getFloat("money") : 0;

// Estimate Month Money
const estimatedMonthMoneyDb = _db.queryFirst(`SELECT SUM(sessions_per_month * default_price) as estimated FROM client WHERE active = true AND client_user_id = ${_user.id};`)

//Atendance Calcule - To consider in Estimate Month Money value
const sessionsDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration, SUM(1) as sessions FROM session WHERE date BETWEEN '${startOfYear}' AND '${endOfYear}' AND client_user_id = ${_user.id}`)
const sessions = sessionsDb ? sessionsDb.getFloat("sessions") : 0;
const sessionsPerMonthDb = _db.queryFirst(`SELECT SUM(sessions_per_month) as sessions_per_month FROM client WHERE client_user_id = ${_user.id};`)
const sessionsPerMonth = sessionsPerMonthDb.getInt('sessions_per_month')
const sessionsPerDay = daysPassFromStartOfYear ? sessions / daysPassFromStartOfYear : 0;
const expectedSessionsPerDay = sessionsPerMonth / (365/12)
const atendance = expectedSessionsPerDay ? (sessionsPerDay / expectedSessionsPerDay) : 0;

const estimatedMonthMoney = estimatedMonthMoneyDb ? estimatedMonthMoneyDb.getFloat("estimated") : 0;
const estimatedMoneyLeft = ((estimatedMonthMoney * atendance) / daysInMonth) * daysUntilEndOfMonth;
const particalEstimatedMonthMoney = totalNewMoney + estimatedMoneyLeft;

// Received/Spended
const receivedDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount > 0 and paid_at BETWEEN '${startOfMonth}' AND '${endOfMonth}' and client_user_id = ${_user.id};`)
const paidDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount < 0 AND created_at BETWEEN '${startOfMonth}' AND '${endOfMonth}' and client_user_id = ${_user.id};`)
const receivedLastDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE paid_at BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}' and client_user_id = ${_user.id};`)
const paidLastDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount < 0 AND created_at BETWEEN '${startOfLastMonth}' AND '${endOfLastMonth}' and client_user_id = ${_user.id};`)
const invoicesPaidDb = _db.queryFirst(`SELECT SUM(1) as money 
                                        FROM finance 
                                        INNER JOIN payment_status ON finance.status_id = payment_status.id
                                        WHERE paid_at IS NOT NULL AND payment_status.code = 'paid' 
                                        AND finance.client_user_id = ${_user.id};`)
const invoicesDb = _db.queryFirst(`SELECT SUM(1) as money FROM finance WHERE client_user_id = ${_user.id};`)


const received = receivedDb && receivedDb > 0? receivedDb.getFloat("money") : 0;
const paid = paidDb ? paidDb.getFloat("money") : 0;
const receivedLast = receivedLastDb  && receivedLastDb > 0 ? receivedLastDb.getFloat("money") : 0;
const paidLast = paidLastDb  ? paidLastDb.getFloat("money") : 0;
const invoicesPaid = invoicesPaidDb  ? invoicesPaidDb.getFloat("money") : 0;
const invoices = invoicesDb  && invoicesDb > 0 ? invoicesDb.getFloat("money") : 0;


const diffInvoice = (received + paid) - (receivedLast + paidLast);


data.set("totalMoney", totalNewMoney);
data.set("totalTime", totalNewDuration);
data.set("diffMoney", totalNewMoney - totalLast) ;
data.set("estimatedMoney", particalEstimatedMonthMoney) ;

//debug data
data.set("atendance", atendance) ;
data.set("estimatedMonthMoney", estimatedMonthMoney) ;
data.set("daysInMonth", daysInMonth) ;
data.set("daysUntilEndOfMonth", daysUntilEndOfMonth) ;
// end of debug data

data.set("received", received) ;
data.set("paid", paid) ;
data.set("invoicesPaid", invoicesPaid) ;
data.set("invoices", invoices) ;
data.set("receivedLast", receivedLast) ;
data.set("paidLast", paidLast) ;
data.set("diffInvoice", diffInvoice) ;
data.set("estimatedMoneyLeft", estimatedMoneyLeft) ;

_out.json(_val.map().set("result", true).set("data", data));