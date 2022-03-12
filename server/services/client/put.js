const is_company =  _req.getString("is_company");
const name = _req.getString("name");
const email = _req.getString("email");
const phone_number = _req.getString("phone_number");
const default_price = _req.hasKey("default_price") ? _req.getFloat("default_price") : null;
const session_duration = _req.hasKey("session_duration") ? _req.getInt("session_duration") : null;
const start_date = _req.hasKey("start_date") ? _req.getString("start_date") : null;
const sessions_per_month = _req.hasKey("sessions_per_month") ? _req.getInt("sessions_per_month") : null;
const default_session_type = _req.hasKey("default_session_type") ? _req.getString("default_session_type") : null;
const default_session_sub_type = _req.hasKey("default_session_sub_type") ? _req.getString("default_session_sub_type") : null;

//Company Data
const legal_name = _req.hasKey("legal_name") ? _req.getString("legal_name") : null;
const vat = _req.hasKey("vat") ? _req.getString("vat") : null;
const website = _req.hasKey("website") ? _req.getString("website") : null;

//Fitness Data
const age = _req.hasKey("age") ? _req.getInt("age") : null;
const dislikes = _req.hasKey("dislikes") ?  _req.getString("dislikes") : null;
const gender = _req.hasKey("gender") ? _req.getString("gender") : null;
const goals = _req.hasKey("goals") ? _req.getString("goals") : null;
const height = _req.hasKey("height") ? _req.getInt("height") : null;
const injuries_conditions = _req.hasKey("injuries_conditions") ? _req.getString("injuries_conditions") : null;
const likes = _req.hasKey("likes") ? _req.getString("likes") : null;
const weight = _req.hasKey("weight") ? _req.getInt("weight") : null;

const dbClient = _db.queryFirst(`
    SELECT * FROM client WHERE email = ? and client_user_id = ?::int
`, _val.list().add(email).add(_user.id));

let dbSessionType = null;
if(default_session_type) {
    dbSessionType = _db.queryFirst(`
    SELECT * FROM session_type WHERE value = ? and client_user_id = ?::int
`, _val.list().add(default_session_type).add(_user.id));  
}

let dbSessionSubType = null;
if(default_session_sub_type) {
    dbSessionSubType = _db.queryFirst(`
    SELECT * FROM session_sub_type WHERE value = ? and client_user_id = ?::int
`, _val.list().add(default_session_sub_type).add(_user.id));  
}


if (dbClient) {
    _db.update(
        "client",
        dbClient.getInt("id"),
        _val.init()
            .set("name", name)
            .set("is_company", is_company)
            .set("email", email)
            .set("phone_number", phone_number)
            .set("session_duration", session_duration)
            .set("default_price", default_price)
            .set("sessions_per_month", sessions_per_month)
            .set("start_date", start_date)
            .set("legal_name", legal_name)
            .set("vat", vat)
            .set("website", website)
            .set("default_session_type_id", default_session_type ? dbSessionType.getInt("id") : null)
            .set("default_session_sub_type_id", default_session_sub_type ? dbSessionSubType.getInt("id") : null)
    );

    const dbFitnessData = _db.queryFirst(`
    SELECT id FROM fitness_data WHERE client_id = ?::Int
    `, _val.list().add(dbClient.getInt("id"),));

    _db.update(
        "fitness_data",
        dbFitnessData.getInt("id"),
        _val.init()
            .set("client_id", dbClient.getInt("id"))
            .set("age", age)
            .set("dislikes", dislikes)
            .set("gender", gender)
            .set("goals", goals)
            .set("height", height)
            .set("injuries_conditions", injuries_conditions)
            .set("likes", likes)
            .set("weight", weight)
    );

} else {

    const client_id = _db.insert(
        "client",
        _val.init()
            .set("name", name)
            .set("is_company", is_company)
            .set("email", email)
            .set("phone_number", phone_number)
            .set("session_duration", session_duration)
            .set("default_price", default_price)
            .set("sessions_per_month", sessions_per_month)
            .set("start_date", start_date)
            .set("legal_name", legal_name)
            .set("vat", vat)
            .set("website", website)
            .set("default_session_type_id", default_session_type ? dbSessionType.getInt("id") : null)
            .set("default_session_sub_type_id", default_session_sub_type ? dbSessionSubType.getInt("id") : null)
            .set("client_user_id", _user.id)

    );

    _db.insert(
        "fitness_data",
        _val.init()
            .set("client_id", client_id)
            .set("age", age)
            .set("dislikes", dislikes)
            .set("gender", gender)
            .set("goals", goals)
            .set("height", height)
            .set("injuries_conditions", injuries_conditions)
            .set("likes", likes)
            .set("weight", weight)
            .set("client_user_id", _user.id)
    );

}

_out.json(_val.map().set("result", true));