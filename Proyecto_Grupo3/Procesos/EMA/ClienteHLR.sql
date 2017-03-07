--------------------------------------------------------
-- Archivo creado  - miércoles-marzo-01-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTEHLR
--------------------------------------------------------

  CREATE TABLE "C##TRAIN"."CLIENTEHLR" 
   (	"IMSI" NUMBER(15,0), 
	"MSISDN" NUMBER(15,0), 
	"PROFILE" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into C##TRAIN.CLIENTEHLR
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_CLIENTEHLR
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TRAIN"."PK_CLIENTEHLR" ON "C##TRAIN"."CLIENTEHLR" ("IMSI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CLIENTEHLR
--------------------------------------------------------

  ALTER TABLE "C##TRAIN"."CLIENTEHLR" ADD CONSTRAINT "PK_CLIENTEHLR" PRIMARY KEY ("IMSI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##TRAIN"."CLIENTEHLR" MODIFY ("IMSI" NOT NULL ENABLE);
