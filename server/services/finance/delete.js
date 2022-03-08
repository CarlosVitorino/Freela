const id = _req.getString("id") 

const result = _db.delete("finance", id);

_out.json(_val.map().set("result", result))