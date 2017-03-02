-- Ericsson Software Inc. 2001-2012

-- DATABASE UPGRADE SCRIPT OF api_common. PRODUCT NO 20130410
-- DATABASE UPGRADE SCRIPT OF cwl_security. PRODUCT NO 20120817
-- DATABASE UPGRADE SCRIPT OF cwl_config. PRODUCT NO 20131210
-- DATABASE UPGRADE SCRIPT OF cwt_common5. PRODUCT NO 20130315
-- DATABASE UPGRADE SCRIPT OF cwl_ims. PRODUCT NO 20130319


-- ATTENTION: THIS SCRIPT HAS TO BE EXAMINED BY DATABASE ADMINISTRATOR!
--            IT MAY NOT CONTAIN ALL NEEDED PARAMETERS.
--            MODIFY THE SCRIPT TO SPECIFY PROPER TABLESPACE AND STORAGE CLAUSES

-- Generated by Ericsson Service Designer on Thu Mar 02 12:34:28 CLT 2017


-- THE FOLLOWING STATEMENTS APPLY TO 'c##train:orcl@localhost' DATABASE ------------------------------- 


define DEFAULT_TABLESPACE_TABLE = USERS;
define DEFAULT_TABLESPACE_INDEX = USERS;
define PE_TABLESPACE_TABLE = USERS;
define PE_TABLESPACE_INDEX = USERS;

CREATE TABLE c##train.GG_clienteChargingSystem(
	MSISDN NUMBER(15) NOT NULL,
	IMSI NUMBER(16),
	IDCLIENTE VARCHAR2(32),
	PLANCS VARCHAR2(32),
	SALDO NUMBER(10),
	CONSTRAINT PK_GG_clienteChargingSystem PRIMARY KEY(MSISDN) USING INDEX
	(CREATE UNIQUE INDEX PK_GG_clienteChargingSystem ON GG_clienteChargingSystem(MSISDN) TABLESPACE &DEFAULT_TABLESPACE_INDEX)
)
TABLESPACE &DEFAULT_TABLESPACE_TABLE;




COMMIT;


-- Generated by Ericsson Service Designer on Thu Mar 02 12:34:28 CLT 2017

