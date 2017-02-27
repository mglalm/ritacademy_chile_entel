
DROP TABLE BSCS_CLIENTE CASCADE CONSTRAINTS ;

DROP TABLE BSCS_CLIENTE_ESTADO CASCADE CONSTRAINTS ;

DROP TABLE BSCS_MSISDN CASCADE CONSTRAINTS ;

DROP TABLE BSCS_MSISDN_ESTADO CASCADE CONSTRAINTS ;

DROP TABLE BSCS_PLAN CASCADE CONSTRAINTS ;

DROP TABLE BSCS_SERVICIO CASCADE CONSTRAINTS ;

DROP TABLE BSCS_SERVICIO_ESTADO CASCADE CONSTRAINTS ;

CREATE TABLE BSCS_CLIENTE
  (
    ID_CLIENTE_BSCS   NUMBER (5) NOT NULL ,
    FECHA_CREACION    DATE ,
    ID_CLIENTE_ESTADO VARCHAR2 (1) NOT NULL ,
    RUT               VARCHAR2 (15)
  ) ;
ALTER TABLE BSCS_CLIENTE ADD CONSTRAINT BSCS_CLIENTE_PK PRIMARY KEY ( ID_CLIENTE_BSCS ) ;


CREATE TABLE BSCS_CLIENTE_ESTADO
  (
    ID_CLIENTE_ESTADO   VARCHAR2 (1) NOT NULL ,
    DESC_CLIENTE_ESTADO VARCHAR2 (30)
  ) ;
ALTER TABLE BSCS_CLIENTE_ESTADO ADD CONSTRAINT BSCS_CLIENTE_ESTADO_PK PRIMARY KEY ( ID_CLIENTE_ESTADO ) ;


CREATE TABLE BSCS_MSISDN
  (
    MSISDN           VARCHAR2 (15) NOT NULL ,
    ID_MSISDN_ESTADO VARCHAR2 (1) NOT NULL
  ) ;
ALTER TABLE BSCS_MSISDN ADD CONSTRAINT BSCS_MSISDN_PK PRIMARY KEY ( MSISDN ) ;


CREATE TABLE BSCS_MSISDN_ESTADO
  (
    ID_MSISDN_ESTADO   VARCHAR2 (1) NOT NULL ,
    DESC_MSISDN_ESTADO VARCHAR2 (30)
  ) ;
ALTER TABLE BSCS_MSISDN_ESTADO ADD CONSTRAINT BSCS_MSISDN_ESTADO_PK PRIMARY KEY ( ID_MSISDN_ESTADO ) ;


CREATE TABLE BSCS_PLAN
  (
    ID_PLAN_BSCS   NUMBER (5) NOT NULL ,
    DESC_PLAN_BSCS VARCHAR2 (30)
  ) ;
ALTER TABLE BSCS_PLAN ADD CONSTRAINT BSCS_PLAN_PK PRIMARY KEY ( ID_PLAN_BSCS ) ;


CREATE TABLE BSCS_SERVICIO
  (
    ID_CLIENTE_BSCS    NUMBER (5) NOT NULL ,
    MSISDN             VARCHAR2 (15) NOT NULL ,
    FECHA_ACTIVACION   DATE ,
    ID_SERVICIO_ESTADO VARCHAR2 (1) NOT NULL ,
    ID_PLAN_BSCS       NUMBER (5) NOT NULL
  ) ;


CREATE TABLE BSCS_SERVICIO_ESTADO
  (
    ID_SERVICIO_ESTADO   VARCHAR2 (1) NOT NULL ,
    DESC_SERVICIO_ESTADO VARCHAR2 (30)
  ) ;
ALTER TABLE BSCS_SERVICIO_ESTADO ADD CONSTRAINT BSCS_SERVICIO_ESTADO_PK PRIMARY KEY ( ID_SERVICIO_ESTADO ) ;


ALTER TABLE BSCS_MSISDN ADD CONSTRAINT BSCS_MSISDN_ESTADO_FK FOREIGN KEY ( ID_MSISDN_ESTADO ) REFERENCES BSCS_MSISDN_ESTADO ( ID_MSISDN_ESTADO ) ON
DELETE CASCADE ;

ALTER TABLE BSCS_SERVICIO ADD CONSTRAINT BSCS_SERVICIO_BSCS_CLIENTE_FK FOREIGN KEY ( ID_CLIENTE_BSCS ) REFERENCES BSCS_CLIENTE ( ID_CLIENTE_BSCS ) ON
DELETE CASCADE ;

ALTER TABLE BSCS_SERVICIO ADD CONSTRAINT BSCS_SERVICIO_BSCS_MSISDN_FK FOREIGN KEY ( MSISDN ) REFERENCES BSCS_MSISDN ( MSISDN ) ;

ALTER TABLE BSCS_SERVICIO ADD CONSTRAINT BSCS_SERVICIO_BSCS_PLAN_FK FOREIGN KEY ( ID_PLAN_BSCS ) REFERENCES BSCS_PLAN ( ID_PLAN_BSCS ) ;

ALTER TABLE BSCS_SERVICIO ADD CONSTRAINT BSCS_SERVICIO_ESTADO_FK FOREIGN KEY ( ID_SERVICIO_ESTADO ) REFERENCES BSCS_SERVICIO_ESTADO ( ID_SERVICIO_ESTADO ) ;

ALTER TABLE BSCS_CLIENTE ADD CONSTRAINT ID_CLIENTE_ESTADO FOREIGN KEY ( ID_CLIENTE_ESTADO ) REFERENCES BSCS_CLIENTE_ESTADO ( ID_CLIENTE_ESTADO ) ;

CREATE OR REPLACE TRIGGER FKNTM_BSCS_SERVICIO BEFORE
  UPDATE OF ID_SERVICIO_ESTADO,
    ID_PLAN_BSCS ON BSCS_SERVICIO BEGIN raise_application_error(-20225,'Non Transferable FK constraint  on table BSCS_SERVICIO is violated');
END;
/

