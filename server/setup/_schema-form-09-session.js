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
	.set("displayname", "Session")
	.set("export_id", false)
	.set("export_json", true)
	.set("export_lastchange", false)
	.set("export_uid", true)
	.set("export_xls", true)
	.set("export_xml", true)
	.set("firebase", "")
	.set("name", "session")
	.set("reorder", 0)
	.set("report", false)
	.set("show_id", true)
	.set("uid", "209f8320-23be-4357-a428-1695ceb55912")
)
_form.createComponentIfNotExists(
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "client")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "client_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"client:name\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "3d8a7c42-cb4e-4a5f-b74d-fc9591625169")
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
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
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
	.set("uid", "5dbc428e-e59b-48a2-835b-7d88ee27837b")
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
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Date")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "date")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "date")
	.set("uid", "65be798d-a766-4fb6-a5d2-bcd083dd92a4")
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
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Duration")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "duration")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textnum")
	.set("uid", "948390b6-18c8-48cd-a353-46c9d8903927")
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
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Price")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "price")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"true\",\"type\":\"BOOLEAN\",\"value\":\"true\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"#.##0,00\",\"type\":\"STRING\",\"value\":\"#.##0,00\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textfloat")
	.set("uid", "27ea64dc-154a-4fad-aef3-df7c99ff4f79")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 4)
)
_form.createComponentIfNotExists(
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Sub Type")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "sub_type_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"session_sub_type:label\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "d6e7b689-5495-4013-b916-a6e2d352224b")
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
	"209f8320-23be-4357-a428-1695ceb55912",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Type")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "type_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"session_type:label\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "2cba1156-5b85-4332-9d44-175a5eb94d29")
	.set("user_id", 0)
	.set("whenedit", true)
	.set("whenexport", true)
	.set("whenfilter", true)
	.set("whennew", true)
	.set("whenresult", true)
	.set("whenview", true)
	.set("width", 0)
	.set("x", 1)
	.set("y", 5)
)
