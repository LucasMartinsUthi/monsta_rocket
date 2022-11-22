use diesel_demo::{api::*, PgConnection};

#[rocket::launch]
fn rocket() -> _ {
    rocket::build()
        .attach(PgConnection::fairing())
        .mount("/", token_api::routes())
        .register("/", token_api::catchers())
}