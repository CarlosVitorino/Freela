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
	.set("displayname", "Finance")
	.set("export_id", false)
	.set("export_json", true)
	.set("export_lastchange", false)
	.set("export_uid", true)
	.set("export_xls", true)
	.set("export_xml", true)
	.set("firebase", "")
	.set("name", "finance")
	.set("reorder", 0)
	.set("report", false)
	.set("show_id", true)
	.set("uid", "26699f0a-2e25-48ee-a092-8d208c4432fe")
)
_form.createComponentIfNotExists(
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Billing Period")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "billing_period")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "text")
	.set("uid", "71133276-5f78-4b23-b0c7-10b2b6b18235")
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
_form.createComponentIfNotExists(
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Client")
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
	.set("uid", "c27f4843-0552-4483-87ac-84e34b7da102")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
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
	.set("uid", "10262a3a-72ec-492d-ab84-c6d60e3a7399")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "company")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "company_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"company:name\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "caa49851-950e-4005-80c1-d916dd5a16e8")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Created At")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "created_at")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "date")
	.set("uid", "88bd4e4a-1072-47d9-9282-0f2e577f8cde")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Description")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "description")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"\",\"type\":\"STRING\",\"value\":\"\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "text")
	.set("uid", "846ed14c-a000-4299-b758-de0d7293713d")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Paid At")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "paid_at")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "date")
	.set("uid", "aee6a070-2117-4f32-a5ca-049c656527a8")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Pay Day")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "pay_day")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"DEFAULT_CURRENT\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "date")
	.set("uid", "e7b5209c-901f-4785-9096-0f7adef24096")
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
_form.createComponentIfNotExists(
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Provider")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "provider_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"provider:text\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "a50ff9cf-7f16-4a89-b022-582a5b83a5c4")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Sessions")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "sessions")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textarea")
	.set("uid", "8643858d-bfc3-497b-9ac2-339162d79c3a")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "status")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "status_id")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MAX_COLUMN_LENGTH\":{\"default\":\"0\",\"type\":\"INTEGER\",\"value\":\"0\"},\"COLUMN_SEPARATOR\":{\"default\":\" - \",\"type\":\"LINK_SEPARATOR\",\"value\":\" - \"},\"LINK\":{\"default\":\"\",\"type\":\"LINK\",\"value\":\"payment_status:name\"},\"SERVICE\":{\"default\":\"com/Select.netuno\",\"type\":\"STRING\",\"value\":\"com/Select.netuno\"},\"ONLY_ACTIVES\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"true\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "select")
	.set("uid", "05edb23a-bac9-4606-bd16-27785731444c")
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
	"26699f0a-2e25-48ee-a092-8d208c4432fe",
	_val.init()
	.set("colspan", 0)
	.set("description", "")
	.set("displayname", "Total Amount")
	.set("firebase", "")
	.set("group_id", 0)
	.set("height", 0)
	.set("max", 0)
	.set("min", 0)
	.set("name", "total_amount")
	.set("notnull", false)
	.set("primarykey", false)
	.set("properties", "{\"MASK_REVERSE\":{\"default\":\"true\",\"type\":\"BOOLEAN\",\"value\":\"true\"},\"MASK_SELECTONFOCUS\":{\"default\":\"false\",\"type\":\"BOOLEAN\",\"value\":\"false\"},\"MASK\":{\"default\":\"#.##0,00\",\"type\":\"STRING\",\"value\":\"#-##0,00\"}}")
	.set("rowspan", 0)
	.set("tdheight", 0)
	.set("tdwidth", 0)
	.set("type", "textfloat")
	.set("uid", "66b853d6-f147-4af4-9d30-721e852742e4")
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
