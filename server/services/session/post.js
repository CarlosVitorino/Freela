const sessionsToCreate = _req.hasKey("toCreate") ? _req.getList("toCreate") : null;
const sessionsToDelete = _req.hasKey("toDelete") ? _req.getList("toDelete") : null;

if (sessionsToCreate) {
   const sessionIds =  _db.insertMany(
        "session",
        sessionsToCreate
    )
}

if (sessionsToDelete) {
    const sessionIds =  _db.deleteMany(
        "session",
        sessionsToDelete
    )
}

_out.json(_val.map().set("result", true));