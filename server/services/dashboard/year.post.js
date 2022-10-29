// _core : utils

const moment = require('moment');
const now = moment().format('YYYY-MM-DD');
const startOfYear = moment().startOf('year').format('YYYY-MM-DD');
const endOfYear   = moment().endOf('year').format('YYYY-MM-DD');
const monthsUntilEndOfYear = moment().endOf('year').diff(moment(), 'months');
const daysPassFromStartOfYear = moment().diff(moment().startOf('year'), 'days');
const daysUntilEndOfMonth = moment().endOf('month').diff(moment(), 'days');
const daysInMonth = moment().daysInMonth();


const data = _val.map();

/** 
 * Column and Pie Chart
 * */

const dataByMonth = _db.query(`
    SELECT TO_CHAR(date_trunc('month', date), 'Month') AS month, date_trunc('month', date) AS month_no, session_type.label AS type, sum(price) as revenue
    FROM session
    INNER JOIN session_type on session.type_id = session_type.id
    WHERE session.client_user_id = ${_user.id()} 
    GROUP BY month, month_no, type
	ORDER BY month_no;`);


const top5Clients = _db.query(`
    SELECT client.name AS client, SUM(price) AS amount 
    FROM session
    INNER JOIN client on session.client_id = client.id
    WHERE session.client_user_id = ${_user.id()} 
    GROUP BY client
    ORDER BY amount desc;`);

const sessionsDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration, SUM(1) as sessions FROM session WHERE date BETWEEN '${startOfYear}' AND '${endOfYear}' AND client_user_id = ${_user.id()}`)
const paidDb = _db.queryFirst(`SELECT SUM(total_amount) as money FROM finance WHERE total_amount < 0 AND paid_at BETWEEN '${startOfYear}' AND '${endOfYear}'  AND client_user_id = ${_user.id()};`)
const billed = sessionsDb ? sessionsDb.getFloat("money") : 0;
const totalMinutes = sessionsDb ? sessionsDb.getFloat("duration") : 0;
const sessions = sessionsDb ? sessionsDb.getFloat("sessions") : 0;
const spent = paidDb ? paidDb.getFloat("money") : 0;    
const profit = billed + spent;

/**
 * Estimated revenue 
 */
const estimatedMonthMoneyDb = _db.queryFirst(`SELECT SUM(sessions_per_month * default_price) as estimated FROM client where active = true AND client_user_id = ${_user.id()};`)
const estimatedMonthMoney = estimatedMonthMoneyDb ? estimatedMonthMoneyDb.getFloat("estimated") : 0;
const estimatedMoneyLeft = daysInMonth ? (estimatedMonthMoney / daysInMonth) * daysUntilEndOfMonth : 0;
const partialEstimatedMonthMoney = spent + estimatedMoneyLeft;
const estimationReceivedYear = partialEstimatedMonthMoney + (estimatedMonthMoney * monthsUntilEndOfYear);

/**
 * Estimated spend
 */
const spentByMonth = _db.query(`
    SELECT date_trunc('month', paid_at) AS month , sum(total_amount) as spent
    FROM finance
    WHERE paid_at IS NOT NULL AND total_amount < 0 AND client_user_id = ${_user.id()}
    GROUP BY month
    ORDER BY month desc;`);

let arrWeights = [];
let arrValues = [];
let estimatedSpendYear = 0;
if(spentByMonth){
    const numberOfMonths = spentByMonth.length;
    const monthWeight = numberOfMonths ? 1 / numberOfMonths: 0;
    let iteration = 0;
    for (const monthSpent of spentByMonth){
        arrWeights.push(1 - (iteration++ * monthWeight ));
        arrValues.push(monthSpent.getDouble('spent'));
        if(moment(monthSpent.getString('month')).isSame(moment(), 'year')) {
            estimatedSpendYear += monthSpent.getDouble('spent');
        }
    }
}
const monthSpendWeightedMean = weightedMean(arrValues, arrWeights)
estimatedSpendYear += (monthSpendWeightedMean * monthsUntilEndOfYear)
const estimatedProfitYear = estimationReceivedYear + estimatedSpendYear;

/** 
 * Medium Values
 * */

 const mediumPriceHour = totalMinutes ? ( billed / totalMinutes ) * 60 : 0;
 const mediumSessionDuration = sessions ? totalMinutes / sessions : 0;

 /**
  * Atendance
  */
const sessionsPerMonthDb = _db.queryFirst(`SELECT SUM(sessions_per_month) as sessions_per_month FROM client WHERE client_user_id = ${_user.id()};`)
const sessionsPerMonth = sessionsPerMonthDb.getInt('sessions_per_month')
const sessionsPerDay = daysPassFromStartOfYear ? sessions / daysPassFromStartOfYear : 0;
const expectedSessionsPerDay = sessionsPerMonth / (365/12)
const atendance = expectedSessionsPerDay ? Math.round((sessionsPerDay / expectedSessionsPerDay) * 100) : 0;

/**
 * Revenue vs Type - sunburst chart
 */

 const dataByType = _db.query(`
    SELECT session_type.label AS name, session_type.id AS id, sum(price) as value
    FROM session
    INNER JOIN session_type on session.type_id = session_type.id
    WHERE session.client_user_id = ${_user.id()}
    GROUP BY name, session_type.id;`);

 const dataBySubType = _db.query(`
    SELECT session_sub_type.label AS name, session_sub_type.type_id as type_id, sum(price) as value
    FROM session
    INNER JOIN session_type on session.type_id = session_type.id
    INNER JOIN session_sub_type on session.sub_type_id = session_sub_type.id
    WHERE session.client_user_id = ${_user.id()}
    GROUP BY name, session_sub_type.type_id;`);

 const sunburst = _val.map();
 for (type of dataByType) {
    const children = _val.list();
    for(subType of dataBySubType) {
        if(subType.getInt('type_id') === type.getInt('id')) {
            children.add(subType);
        }
    } 
    type.set("children", children);
 }
 sunburst.set("children", dataByType);  
 sunburst.set("name", "All");




data.set("dataByMonth", dataByMonth) ;
data.set("top5Clients", top5Clients) ;
data.set("billed", isFinite(billed) ? billed : 0) ;
data.set("totalMinutes", isFinite(totalMinutes) ? totalMinutes: 0 ) ;
data.set("atendance", isFinite(atendance) ? atendance : 0 ) ;
data.set("daysPassFromStartOfYear", isFinite(daysPassFromStartOfYear) ? daysPassFromStartOfYear : 0 ) ;
data.set("mediumPriceHour", isFinite(mediumPriceHour) ? mediumPriceHour : 0 ) ;
data.set("mediumSessionDuration", isFinite(mediumSessionDuration) ? mediumSessionDuration : 0 ) ;
data.set("spent", isFinite(spent) ? spent : 0 ) ;
data.set("profit", isFinite(profit) ? profit : 0 ) ;
data.set("estimatedProfitYear", isFinite(estimatedProfitYear) ? estimatedProfitYear : 0 ) ;
data.set("sunburst", sunburst) ;
//_log.info(data.toJSON());

_out.json(_val.map().set("result", true).set("data", data));