const sessionIds = _req.hasKey("sessionIds") ? _req.getString("sessionIds") : null;
const sanitezedIds = _db.sanitize(sessionIds)
const query = `
    SELECT session.*, client.name as client_name, session_type.label as session_type, session_sub_type.label as session_sub_type, session.id as key 
    FROM session
    INNER JOIN client ON session.client_id = client.id
    LEFT JOIN session_type ON session.type_id = session_type.id
    LEFT JOIN session_sub_type ON session.sub_type_id = session_sub_type.id
    WHERE session.id IN (${sanitezedIds}) AND client.client_user_id = ${_user.id()}
    order by session.date desc`;


_out.json(_val.map().set("result", true).set("data", _db.query(query)));