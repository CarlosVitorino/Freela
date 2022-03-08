const query = `
    SELECT finance.*, coalesce(client.name, company.name) as name, coalesce(finance.paid_at, finance.pay_day) as date, concat(finance.billing_period, finance.description) as description, company.id as company_id, payment_status.name as status, payment_status.code as status_code, finance.id as key 
    FROM finance
    LEFT JOIN client ON finance.client_id = client.id
    LEFT JOIN company ON finance.company_id = company.id
    INNER JOIN payment_status ON finance.status_id = payment_status.id
    order by finance.created_at desc
`;

_out.json(_val.map().set("result", true).set("data", _db.query(query)));