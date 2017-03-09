

DROP TABLE PR_EMA_ESTADO_SERVICIO CASCADE CONSTRAINTS ;

DROP TABLE PR_EMA_NODO CASCADE CONSTRAINTS ;

DROP TABLE PR_EMA_PROFILE CASCADE CONSTRAINTS ;

DROP TABLE PR_EMA_PROFILE_DETALLE CASCADE CONSTRAINTS ;

DROP TABLE PR_EMA_SERVICIO CASCADE CONSTRAINTS ;

DROP TABLE PR_EMA_SERVICIO_NODO_ACTIVO CASCADE CONSTRAINTS ;

CREATE TABLE PR_EMA_ESTADO_SERVICIO
  (
    ID_ESTADO   VARCHAR2 (1) NOT NULL ,
    DESC_ESTADO VARCHAR2 (30)
  ) ;
ALTER TABLE PR_EMA_ESTADO_SERVICIO ADD CONSTRAINT EMA_ESTADO_SERVICIO_PK PRIMARY KEY ( ID_ESTADO ) ;


CREATE TABLE PR_EMA_NODO
  (
    SYSTEM_ID_NODO_N_EMA NUMBER (10) NOT NULL ,
    SYSTEM_ID_NODO_C_EMA VARCHAR2 (10) ,
    DESC_NODO            VARCHAR2 (30) ,
    PLATAFORMA           VARCHAR2 (30)
  ) ;
ALTER TABLE PR_EMA_NODO ADD CONSTRAINT EMA_NODO_PK PRIMARY KEY ( SYSTEM_ID_NODO_N_EMA ) ;


CREATE TABLE PR_EMA_PROFILE
  (
    SYSTEM_ID_PROFILE_N_EMA NUMBER (10) NOT NULL ,
    SYSTEM_ID_PROFILE_C_EMA VARCHAR2 (10) ,
    DESC_PROFILE            VARCHAR2 (30)
  ) ;
ALTER TABLE PR_EMA_PROFILE ADD CONSTRAINT EMA_PROFILE_PK PRIMARY KEY ( SYSTEM_ID_PROFILE_N_EMA ) ;


CREATE TABLE PR_EMA_PROFILE_DETALLE
  (
    SYSTEM_ID_PROFILE_N_EMA NUMBER (10) NOT NULL ,
    SYSTEM_ID_PROFILE_C_EMA VARCHAR2 (10) ,
    SYSTEM_ID_NODO_N_EMA    NUMBER (10) NOT NULL ,
    SYSTEM_ID_NODO_C_EMA    VARCHAR2 (10) ,
    DESC_PROFILE_DETALLE    VARCHAR2 (30)
  ) ;


CREATE TABLE PR_EMA_SERVICIO
  (
    SYSTEM_ID_SERVICIO_N_EMA NUMBER (10) ,
    SYSTEM_ID_SERVICIO_C_EMA VARCHAR2 (10) ,
    MSISDN                   VARCHAR2 (15) NOT NULL ,
    SYSTEM_ID_PROFILE_N_EMA  NUMBER (10) ,
    SYSTEM_ID_PROFILE_C_EMA  VARCHAR2 (10) ,
    ORDER_ID                 VARCHAR2 (16) ,
    ID_ESTADO                VARCHAR2 (1) NOT NULL ,
    FECHA_ACTIVACION         DATE ,
    FECHA_ACTUALIZACION      DATE
  ) ;


CREATE TABLE PR_EMA_SERVICIO_NODO_ACTIVO
  (
    SYSTEM_ID_NODO_N_EMA NUMBER (10) NOT NULL ,
    SYSTEM_ID_NODO_C_EMA VARCHAR2 (10) NOT NULL ,
    MSISDN               VARCHAR2 (15) NOT NULL ,
    FECHA_ACTIVACION     DATE
  ) ;
ALTER TABLE PR_EMA_SERVICIO_NODO_ACTIVO ADD CONSTRAINT PR_EMA_SERVICIO_NODO_ACTIVO_PK PRIMARY KEY ( SYSTEM_ID_NODO_N_EMA ) ;

ALTER TABLE PR_EMA_PROFILE_DETALLE ADD CONSTRAINT EMA_PROFILE_DETALLE_FK FOREIGN KEY ( SYSTEM_ID_PROFILE_N_EMA ) REFERENCES PR_EMA_PROFILE ( SYSTEM_ID_PROFILE_N_EMA ) ;

ALTER TABLE PR_EMA_PROFILE_DETALLE ADD CONSTRAINT EMA_PROFILE_NODO_FK FOREIGN KEY ( SYSTEM_ID_NODO_N_EMA ) REFERENCES PR_EMA_NODO ( SYSTEM_ID_NODO_N_EMA ) ;

ALTER TABLE PR_EMA_SERVICIO ADD CONSTRAINT EMA_SERVICIO_FK FOREIGN KEY ( ID_ESTADO ) REFERENCES PR_EMA_ESTADO_SERVICIO ( ID_ESTADO ) ;


CREATE OR REPLACE VIEW PR_EMA_SERVICIO_VIGENTE
AS
  SELECT c.SYSTEM_ID_SERVICIO_N_EMA,
    c.SYSTEM_ID_SERVICIO_C_EMA,
    c.MSISDN,
    c.SYSTEM_ID_PROFILE_N_EMA,
    c.SYSTEM_ID_PROFILE_C_EMA,
    c.ORDER_ID,
    c.ID_ESTADO,
    c.FECHA_ACTIVACION,
    c.FECHA_ACTUALIZACION
  FROM
    (SELECT a.MSISDN,
      MAX(a.FECHA_ACTUALIZACION) FECHA_ACTUALIZACION
    FROM PR_EMA_SERVICIO a
    GROUP BY a.MSISDN
    ) b,
    PR_EMA_SERVICIO c
  WHERE b.MSISDN            = c.MSISDN
  AND b.FECHA_ACTUALIZACION = c.FECHA_ACTUALIZACION ;

  --SECUENCIAS

CREATE SEQUENCE SEQ_ID_NODO_EMA     INCREMENT BY 1 START WITH 100;

CREATE SEQUENCE SEQ_ID_SERVICIO_EMA INCREMENT BY 1 START WITH 100;


--------------------------------------------------------------------------------------------------------

insert into PR_EMA_ESTADO_SERVICIO values ('1','ACTIVO');
insert into PR_EMA_ESTADO_SERVICIO values ('2','SUSPENDIDO');
insert into PR_EMA_ESTADO_SERVICIO values ('3','DESACTIVADO');
COMMIT;

insert into PR_EMA_NODO values (1,'1','PLATAFORMA DE VOZ','VOZ');
insert into PR_EMA_NODO values (2,'2','PLATAFORMA DE SMS','SMS');
insert into PR_EMA_NODO values (3,'3','PLATAFORMA DE DATOS','DATOS');
COMMIT;

insert into PR_EMA_PROFILE values (1,'1','PERFIL VOZ');
insert into PR_EMA_PROFILE values (2,'2','PERFIL VOZ + SMS');
COMMIT;

insert into PR_EMA_PROFILE_DETALLE values (1,'1',1,'1','VOZ');
insert into PR_EMA_PROFILE_DETALLE values (1,'1',2,'2','SMS');
insert into PR_EMA_PROFILE_DETALLE values (2,'2',2,'2','SMS');

COMMIT;

--------------------------------------------------------------------------------------------------------
