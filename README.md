## Dependencies

#### Install Diesel
```
cargo install diesel_cli --no-default-features --features postgres
```

#### Install Cargo watch 

```
cargo install cargo-watch
```

## Running the api

#### Run docker compose

```
docker compose up
```

#### Diesel Migration

```
diesel migration run
```

#### Run Rocket

```
cargo watch -x run
```