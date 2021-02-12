drop database if exists integrations_metadata;
drop user if exists integrations_user;

CREATE USER integrations_user PASSWORD 'password';

CREATE DATABASE integrations WITH OWNER = integration_user ENCODING = 'UTF8' TABLESPACE = pg_default;

GRANT ALL PRIVILEGES ON DATABASE integrations to integrations_user;

\connect integrations;

CREATE SCHEMA IF NOT EXISTS logs;

CREATE TABLE logs.integrations_log (
	id varchar(32) not null,
	process varchar(32) NOT NULL,
	proc_status char(1) NOT NULL,
	max_gravity integer default(0),
	date_started timestamp NOT NULL,
	date_finished timestamp NULL,
	log_file_ref varchar(255) NOT NULL,
	username varchar(32) NULL,
	host varchar(64) NULL,
	CONSTRAINT integration_log_px PRIMARY KEY (id)
);

CREATE TABLE logs.integrations_log_detail (
	id varchar(32) not null,
	integration_log_id varchar(32) not null,
	source_sys_code varchar(32) NOT NULL,
	source_sys_row_ref varchar(50) NOT NULL,
	message_text text NULL,
	log_level char(1) not null,
	gravity integer NOT NULL default(0),
	CONSTRAINT integration_log_detail_pk PRIMARY KEY (Id)
);

CREATE SCHEMA IF NOT EXISTS master_data;

CREATE TABLE master_data.geography (
	id varchar(50) NOT NULL,
	town varchar(100) NOT NULL,
	administrative_code varchar(50) NOT NULL,
	administrative_name varchar(100) NOT NULL,
	area varchar(50) NOT NULL,
	state varchar(50) NOT NULL,
	population int4 NULL,
	male int4 NULL,
	female int4 NULL,
	town_tax_id_code varchar(50) NULL,
	CONSTRAINT pk_geography PRIMARY KEY (id)
);
