const query = `
    SELECT finance.*, client.name as name, finance.pay_day, finance.paid_at as date, concat(finance.billing_period, finance.description) as description, payment_status.name as status, payment_status.code as status_code, finance.id as key 
    FROM finance
    LEFT JOIN client ON finance.client_id = client.id
    INNER JOIN payment_status ON finance.status_id = payment_status.id
    WHERE finance.client_user_id = ${_user.id}
    order by date desc
`;

_out.json(_val.map().set("result", true).set("data", _db.query(query)));