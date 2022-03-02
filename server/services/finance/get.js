const query = `
    SELECT finance.*, client.name as client_name, payment_status.name as status, payment_status.code as status_code, finance.id as key 
    FROM finance
    INNER JOIN client ON finance.client_id = client.id
    INNER JOIN payment_status ON finance.status_id = payment_status.id
    order by finance.created_at desc
`;

_out.json(_val.map().set("result", true).set("data", _db.query(query)));