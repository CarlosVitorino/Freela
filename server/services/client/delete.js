const id = _req.getString("id") 


const resultFinance = _db.delete(
    "finance", 
    _val.map().set(
        "where", _val.map().set("client_id", id)
    )
);

const resultSession = _db.delete(
    "session", 
    _val.map().set(
        "where", _val.map().set("client_id", id)
    )
);

const resultClient = _db.delete("client", id);

const data = _val.map().set("resultFinance", resultSession).set("resultFinance", resultFinance).set("resultClient", resultClient)

_out.json(_val.map().set("result", true).set("data", data));
