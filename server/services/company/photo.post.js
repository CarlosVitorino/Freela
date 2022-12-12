const file = _req.getFile("file")
let companyId = _req.hasKey("companyId") ? _req.getInt("companyId") : null;

const os = _os.init()
const user = _user.id();


_log.info(`User: ${user} is uploading a photo`);

if (file !== null) {
	if(companyId === -1) {
		companyId = _db.insert(
			"company",
			_val.init()
				.set("client_user_id", file)
				.set("logo", file)
		);
	} else {
		_log.info(`User: ${user} is updating company ${companyId}`);
		
		_db.update(
			"company",
			companyId,
			_val.init()
				.set("client_user_id", file)
				.set("logo", file)
		);
	}


	const dbfile = _db.get(
		"company",
		companyId
	)
	const photo = _storage.database("company", "logo", dbfile.getString("logo"))
	const path = _app.settings.getString("path").trim()
	os.command(
		`cp ${photo.absolutePath()} ${path}`
	)
	_out.json(_val.map().set("result", true).set("data", companyId))

} else {
	_header.status(500)
}