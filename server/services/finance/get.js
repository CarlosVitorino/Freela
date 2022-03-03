const query = `
    SELECT finance.*, coalesce(client.name, provider.label) as name, concat(finance.billing_period, finance.description) as description, provider.id as provider_id, payment_status.name as status, payment_status.code as status_code, finance.id as key 
    FROM finance
    LEFT JOIN client ON finance.client_id = client.id
    LEFT JOIN provider ON finance.provider_id = provider.id
    INNER JOIN payment_status ON finance.status_id = payment_status.id
    order by finance.created_at desc
`;

_out.json(_val.map().set("result", true).set("data", _db.query(query)));