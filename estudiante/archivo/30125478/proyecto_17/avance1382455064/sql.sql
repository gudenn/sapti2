/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     9/23/2013 8:54:37 AM                         */
/*==============================================================*/


drop table if exists lenguaje;

drop table if exists nivel;

drop table if exists olimpiada;

drop table if exists problema;

drop table if exists respuestas;

drop table if exists rol;

drop table if exists solucion;

drop table if exists usuario;

drop table if exists usuario_rol;

/*==============================================================*/
/* Table: lenguaje                                              */
/*==============================================================*/
create table lenguaje
(
   id_lenguaje          int not null auto_increment,
   nombre_lenguaje      varchar(100),
   descripcion_lenguaje varchar(200),
   primary key (id_lenguaje)
);

/*==============================================================*/
/* Table: nivel                                                 */
/*==============================================================*/
create table nivel
(
   id_nivel             int not null auto_increment,
   nombre_nivel         varchar(200),
   primary key (id_nivel)
);

/*==============================================================*/
/* Table: olimpiada                                             */
/*==============================================================*/
create table olimpiada
(
   id_olimpiada         int not null auto_increment,
   nombre_olimpiada     varchar(100),
   primary key (id_olimpiada)
);

/*==============================================================*/
/* Table: problema                                              */
/*==============================================================*/
create table problema
(
   id_problema          int not null auto_increment,
   id_nivel             int,
   id_olimpiada         int,
   nombre_problema      varchar(500),
   archivo_problema     varchar(200),
   primary key (id_problema)
);

/*==============================================================*/
/* Table: respuestas                                            */
/*==============================================================*/
create table respuestas
(
   id_respuesta         int not null auto_increment,
   id_usuario           int,
   id_lenguaje          int,
   id_problema          int,
   primary key (id_respuesta)
);

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol
(
   id_rol               int not null auto_increment,
   nombre_rol           varchar(100),
   primary key (id_rol)
);

/*==============================================================*/
/* Table: solucion                                              */
/*==============================================================*/
create table solucion
(
   id_solucion          int not null auto_increment,
   id_problema          int,
   archivo_solucion     varchar(200),
   primary key (id_solucion)
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario
(
   id_usuario           int not null auto_increment,
   nombre_usuario       varchar(200),
   apellido_paterno     varchar(200),
   apellido_materno     varchar(200),
   fecha_nacimiento     date,
   ci_usuario           int,
   email_usuario        varchar(200),
   login                varchar(200),
   password             varchar(200),
   primary key (id_usuario)
);

/*==============================================================*/
/* Table: usuario_rol                                           */
/*==============================================================*/
create table usuario_rol
(
   id_usuariorol        int not null auto_increment,
   id_rol               int,
   id_usuario           int,
   primary key (id_usuariorol)
);

alter table problema add constraint fk_relationship_5 foreign key (id_nivel)
      references nivel (id_nivel) on delete cascade on update cascade;

alter table problema add constraint fk_relationship_8 foreign key (id_olimpiada)
      references olimpiada (id_olimpiada) on delete cascade on update cascade;

alter table respuestas add constraint fk_relationship_11 foreign key (id_lenguaje)
      references lenguaje (id_lenguaje) on delete cascade on update cascade;

alter table respuestas add constraint fk_relationship_7 foreign key (id_usuario)
      references usuario (id_usuario) on delete cascade on update cascade;

alter table respuestas add constraint fk_relationship_9 foreign key (id_problema)
      references problema (id_problema) on delete cascade on update cascade;

alter table solucion add constraint fk_relationship_6 foreign key (id_problema)
      references problema (id_problema) on delete cascade on update cascade;

alter table usuario_rol add constraint fk_relationship_2 foreign key (id_usuario)
      references usuario (id_usuario) on delete cascade on update cascade;

alter table usuario_rol add constraint fk_relationship_4 foreign key (id_rol)
      references rol (id_rol) on delete cascade on update cascade;

