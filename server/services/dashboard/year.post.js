// _core : utils

const now = new Date();

const nowFormatted = formatDate(now);
const startOfYearDate = startOfYear(now);
const endOfYearDate = endOfYear(now);
const monthsUntilEndOfYear = monthsBetween(now, endOfYearDate);
const daysPassFromStartOfYear = daysBetween(startOfYearDate, now);
const daysUntilEndOfMonth = daysBetween(now, endOfMonth(now));
const daysUntilEndOfYear = daysBetween(now, endOfYearDate);
const daysInMonth = daysBetween(startOfMonth(now), endOfMonth(now)) + 1; // +1 to include the end day

const data = _val.map();

/** 
 * Column and Pie Chart
 * */

const dataByMonth = _db.query(`
    SELECT TO_CHAR(date, 'YYYY-MM') AS month, EXTRACT('Year' FROM date) AS year, date_trunc('month', date) AS month_no, session_type.label AS type, sum(price) as revenue
    FROM session
    INNER JOIN session_type on session.type_id = session_type.id
    WHERE session.client_user_id = ${_user.id()} 
    GROUP BY year, month, month_no, type
    ORDER BY month_no;`);

const top5Clients = _db.query(`
    SELECT client.name AS client, SUM(price) AS amount 
    FROM session
    INNER JOIN client on session.client_id = client.id
    WHERE session.client_user_id = ${_user.id()} 
    GROUP BY client
    ORDER BY amount desc;`);

const sessionsDb = _db.queryFirst(`SELECT SUM(price) as money, SUM(duration) as duration, SUM(1) as sessions 
    FROM session 
    WHERE date BETWEEN '${formatDate(startOfYearDate)}' AND '${formatDate(endOfYearDate)}' 
    AND client_user_id = ${_user.id()}`);

const paidDb = _db.queryFirst(`SELECT SUM(total_amount) as money 
    FROM finance 
    WHERE total_amount < 0 
    AND paid_at BETWEEN '${formatDate(startOfYearDate)}' AND '${formatDate(endOfYearDate)}'  
    AND client_user_id = ${_user.id()};`);

const billed = sessionsDb ? sessionsDb.getFloat("money") : 0;
const totalMinutes = sessionsDb ? sessionsDb.getFloat("duration") : 0;
const sessions = sessionsDb ? sessionsDb.getFloat("sessions") : 0;
const spent = paidDb ? paidDb.getFloat("money") : 0;    
const profit = billed + spent;

/** 
 * Medium Values
 * */

const mediumPriceHour = totalMinutes ? (billed / totalMinutes) * 60 : 0;
const mediumSessionDuration = sessions ? totalMinutes / sessions : 0;

/**
 * Attendance
 */
const sessionsPerMonthDb = _db.queryFirst(`SELECT SUM(sessions_per_month) as sessions_per_month 
    FROM client 
    WHERE client_user_id = ${_user.id()};`);

const sessionsPerMonth = sessionsPerMonthDb ? sessionsPerMonthDb.getInt('sessions_per_month') : 0;
const sessionsPerDay = daysPassFromStartOfYear ? sessions / daysPassFromStartOfYear : 0;
const expectedSessionsPerDay = sessionsPerMonth / (365 / 12);
const attendance = expectedSessionsPerDay ? Math.round((sessionsPerDay / expectedSessionsPerDay) * 100) : 0;

/**
 * Estimated revenue 
 */
const estimatedMonthMoneyDb = _db.queryFirst(`SELECT SUM(sessions_per_month * default_price) as estimated 
    FROM client 
    WHERE active = true 
    AND client_user_id = ${_user.id()};`);

const estimatedMonthMoney = estimatedMonthMoneyDb ? estimatedMonthMoneyDb.getFloat("estimated") : 0;

const estimatedMoneyUntilEndOfYear = daysInMonth ? ((estimatedMonthMoney / daysInMonth) * daysUntilEndOfYear) * (attendance / 100) : 0;
const averageSpentPerDay = spent / daysPassFromStartOfYear;
const estimatedSpentUntilEndOfYear = averageSpentPerDay ? averageSpentPerDay * daysUntilEndOfYear : 0;
const estimatedProfitYear = estimatedMoneyUntilEndOfYear + estimatedSpentUntilEndOfYear + profit;

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
    for (subType of dataBySubType) {
        if (subType.getInt('type_id') === type.getInt('id')) {
            children.add(subType);
        }
    } 
    type.set("children", children);
}
sunburst.set("children", dataByType);  
sunburst.set("name", "All");

data.set("dataByMonth", dataByMonth);
data.set("top5Clients", top5Clients);
data.set("billed", isFinite(billed) ? billed : 0);
data.set("totalMinutes", isFinite(totalMinutes) ? totalMinutes : 0);
data.set("attendance", isFinite(attendance) ? attendance : 0);
data.set("daysPassFromStartOfYear", isFinite(daysPassFromStartOfYear) ? daysPassFromStartOfYear : 0);
data.set("mediumPriceHour", isFinite(mediumPriceHour) ? mediumPriceHour : 0);
data.set("mediumSessionDuration", isFinite(mediumSessionDuration) ? mediumSessionDuration : 0);
data.set("spent", isFinite(spent) ? spent : 0);
data.set("profit", isFinite(profit) ? profit : 0);
data.set("estimatedProfitYear", isFinite(estimatedProfitYear) ? estimatedProfitYear : 0);
data.set("sunburst", sunburst);
// _log.info(data.toJSON());

_out.json(_val.map().set("result", true).set("data", data));
