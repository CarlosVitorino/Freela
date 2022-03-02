const sessionIds = _req.hasKey("sessionIds") ? _req.getString("sessionIds") : null;
const sanitezedIds = _db.sanitize(sessionIds)
const query = `
    SELECT session.*, client.name as client_name, session_type.text as session_type, session.id as key 
    FROM session
    INNER JOIN client ON session.client_id = client.id
    INNER JOIN session_type ON session.type_id = session_type.id
    WHERE session.id IN (${sanitezedIds})
    order by session.date desc`;


_out.json(_val.map().set("result", true).set("data", _db.query(query)));