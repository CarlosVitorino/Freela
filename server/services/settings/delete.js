const id = _req.getString("id") 
const type = _req.getString("type");
let result = false;

switch(type) {
    case 'supplier':
        result = _db.delete("supplier", id);
        break;
    case 'type':
        result = _db.delete("session_type", id);
        break;
    case 'subType':
        result = _db.delete("session_sub_type", id);
        break;
}

_out.json(_val.map().set("result", result))