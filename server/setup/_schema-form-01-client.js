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
	.set("displayname", "Client")
	.set("export_id", false)
	.set("export_json", true)
	.set("export_lastchange", false)
	.set("export_uid", true)
	.set("export_xls", true)
	.set("export_xml", true)
	.set("firebase", "")
	.set("name", "client")
	.set("reorder", 0)
	.set("report", false)
	.set("show_id", true)
	.set("uid", "0028953a-b610-4e37-9f25-87bdad2e37dd")
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Default Price")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "default_price")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"true\",\"type\":\"BOOLEAN\",\"value\":\"true\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"#.##0,00\",\"type\":\"STRING\",\"value\":\"#.##0,00\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textfloat")
	.set("uid", "46d1dce2-0d50-40fb-ab00-51ad786f563c")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 8)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Default Session Sub Type")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "default_session_sub_type_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"session_sub_type:label\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "70e21c31-c1ff-4fca-99c9-cc26a1077c0a")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 14)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Default Session Type")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "default_session_type_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"session_type:code,name\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "da670ff2-dd9e-45b5-bb3a-28f5286d4f65")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 13)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Email")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "email")
	.set("notnull", false)
	.set("primarykey", true)
	.set("properties", "{}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "email")
	.set("uid", "4d47e2f4-86e9-4a63-a650-7670acdb6e6b")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 3)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Name")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "name")
	.set("notnull", true)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "text")
	.set("uid", "5d3dcdfe-cba8-4094-9571-eb43aaa731f3")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 1)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Phone Number")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "phone_number")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "text")
	.set("uid", "448e7e57-a8bd-4e3d-b610-6d9856b7c39e")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 10)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Photo")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "photo")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "image")
	.set("uid", "4741d18e-9f7a-480b-a176-b547f783af9b")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 7)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
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
	.set("uid", "5d5d0751-c200-4e19-816d-2aa7d6b56952")
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
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
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
	.set("uid", "fa1239f7-7565-41f7-a5ad-ef6790f67d6e")
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
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Session Duration")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "session_duration")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textnum")
	.set("uid", "4c0bdcbc-3b27-496d-92e6-4afad2520dfe")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 9)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Sessions Per Month")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "sessions_per_month")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textnum")
	.set("uid", "70107171-287c-4a7a-a8c0-ac917c7ab8a3")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 12)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Start Date")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "start_date")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "date")
	.set("uid", "de63d8e7-ddd9-4189-885f-6a4c4ccffaf0")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 11)
)
_form.createComponentIfNotExists(
	"0028953a-b610-4e37-9f25-87bdad2e37dd",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "User")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "user")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"ALLOW_USER_LOGGED\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"GROUPS\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"},\"GROUPS_MODE\":{\"default\":\"all|exclude|only\",\"type\":\"CHOICE\",\"value\":\"all\"},\"USERS_MODE\":{\"default\":\"all|exclude|only\",\"type\":\"CHOICE\",\"value\":\"all\"},\"USERS\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "user")
	.set("uid", "a12ea087-4080-4efc-97db-bca79995311d")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 2)
)
