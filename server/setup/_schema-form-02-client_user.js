/**
  *
  *  CODE GENERATED AUTOMATICALLY
  *
  *  THIS FILE SHOULD NOT BE EDITED BY HAND
  *
  */

_form.createIfNotExists(
	_val.init()
	.set("big", false)
	.set("control_active", true)
	.set("control_group", false)
	.set("control_user", false)
	.set("description", "")
	.set("displayname", "Client User")
	.set("export_id", false)
	.set("export_json", true)
	.set("export_lastchange", false)
	.set("export_uid", true)
	.set("export_xls", true)
	.set("export_xml", true)
	.set("firebase", "")
	.set("name", "client_user")
	.set("reorder", 0)
	.set("report", false)
	.set("show_id", true)
	.set("uid", "f24a6931-3259-4036-9535-d911a94bdca8")
)
_form.createComponentIfNotExists(
	"f24a6931-3259-4036-9535-d911a94bdca8",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Client User")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "client_user_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"ALLOW_USER_LOGGED\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"GROUPS\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"},\"GROUPS_MODE\":{\"default\":\"all|exclude|only\",\"type\":\"CHOICE\",\"value\":\"all\"},\"USERS_MODE\":{\"default\":\"all|exclude|only\",\"type\":\"CHOICE\",\"value\":\"all\"},\"USERS\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "user")
	.set("uid", "110001e1-7975-414b-be05-c42b7d2a0a5f")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 6)
)
_form.createComponentIfNotExists(
	"f24a6931-3259-4036-9535-d911a94bdca8",
	_val.init()
	.set("colspan", 0)
	.set("displayname", "Chave de Recupera\u00E7\u00E3o")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "recovery_key")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "text")
	.set("uid", "0a63d01a-8485-407e-9d0e-3565b1096127")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", false)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 4)
)
_form.createComponentIfNotExists(
	"f24a6931-3259-4036-9535-d911a94bdca8",
	_val.init()
	.set("colspan", 0)
	.set("displayname", "Limite de Recupera\u00E7\u00E3o")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "recovery_limit")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "datetime")
	.set("uid", "32599868-8d6a-416b-aba5-d0158a30e381")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", false)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 5)
)
