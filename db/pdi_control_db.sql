drop database if exists pdi;
drop user if exists pdi_user;

CREATE USER pdi_user PASSWORD 'password';

CREATE DATABASE pdi WITH OWNER = pdi_user ENCODING = 'UTF8' TABLESPACE = pg_default;

GRANT ALL PRIVILEGES ON DATABASE pdi to pdi_user;

\connect pdi;

CREATE TABLE pdi_connections_log (
    id SERIAL PRIMARY KEY,
    connection_name varchar(255) not null,
    status varchar(12) not null default 'AVAILABLE', -- AVAILABLE, UNAVAILABLE,
    last_check_at timestamp not null ,
    UNIQUE(connection_name)
);

