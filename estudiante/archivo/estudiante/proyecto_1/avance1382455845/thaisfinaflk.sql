
/*==============================================================*/
/* Table: actividad                                             */
/*==============================================================*/
create table actividad
(
   id_actividad         int not null auto_increment,
   id_entrenamiento     int,
   nombre_actividad     varchar(100),
   primary key (id_actividad)
);

/*==============================================================*/
/* Table: anuncios                                              */
/*==============================================================*/
create table anuncios
(
   id_anuncios          int not null auto_increment,
   id_usuario           int,
   id_actividad         int,
   nombre_anuncios      varchar(100),
   descripcion_anuncio  varchar(100),
   primary key (id_anuncios)
);

/*==============================================================*/
/* Table: autor                                                 */
/*==============================================================*/
create table autor
(
   id_autor             int not null auto_increment,
   id_usuario           int,
   id_problema          int,
   primary key (id_autor)
);

/*==============================================================*/
/* Table: colegio                                               */
/*==============================================================*/
create table colegio
(
   id_colegio           int not null auto_increment,
   id_entrenamiento     int,
   nombre_colegio       varchar(100),
   descripcion_colegio  varchar(200),
   primary key (id_colegio)
);

/*==============================================================*/
/* Table: datos_entrada                                         */
/*==============================================================*/
create table datos_entrada
(
   id_datosentrada      int not null auto_increment,
   id_problema          int,
   valor_datosentrada   varchar(100),
   primary key (id_datosentrada)
);

/*==============================================================*/
/* Table: datos_salida                                          */
/*==============================================================*/
create table datos_salida
(
   id_datosalida        int not null auto_increment,
   id_problema          int,
   valor_salida         varchar(50),
   primary key (id_datosalida)
);

/*==============================================================*/
/* Table: datos_salidarespuesta                                 */
/*==============================================================*/
create table datos_salidarespuesta
(
   id_datosalidarespuesta int not null auto_increment,
   id_respuesta         int,
   valor_datossalidarespuesta varchar(200),
   primary key (id_datosalidarespuesta)
);

/*==============================================================*/
/* Table: entrenador                                            */
/*==============================================================*/
create table entrenador
(
   id_entrenador        int not null auto_increment,
   id_usuario           int,
   id_colegio           int,
   primary key (id_entrenador)
);

/*==============================================================*/
/* Table: entrenamiento                                         */
/*==============================================================*/
create table entrenamiento
(
   id_entrenamiento     int not null auto_increment,
   id_olimpiada         int,
   nombre_entrenamiento varchar(200),
   primary key (id_entrenamiento)
);

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
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   id_menu              int not null auto_increment,
   nombre_menu          varchar(100),
   url_menu             varchar(100),
   peso                 int,
   primary key (id_menu)
);

/*==============================================================*/
/* Table: nivel                                                 */
/*==============================================================*/
create table nivel
(
   id_nivel             int not null auto_increment,
   nombre_nivel         varchar(100),
   descripcion_nivel    varchar(300),
   primary key (id_nivel)
);

/*==============================================================*/
/* Table: olimpiada                                             */
/*==============================================================*/
create table olimpiada
(
   id_olimpiada         int not null auto_increment,
   nombre_olimpiada     varchar(100),
   descripcion_olimpiada varchar(200),
   primary key (id_olimpiada)
);

/*==============================================================*/
/* Table: participante                                          */
/*==============================================================*/
create table participante
(
   id_particioante      int not null auto_increment,
   id_usuario           int,
   id_colegio           int,
   primary key (id_particioante)
);

/*==============================================================*/
/* Table: problema                                              */
/*==============================================================*/
create table problema
(
   id_problema          int not null auto_increment,
   id_actividad         int,
   id_nivel             int,
   nombre_problema      varchar(200),
   archivo_problema     varchar(200),
   descripcion_problema varchar(200),
   primary key (id_problema)
);

/*==============================================================*/
/* Table: respuesta                                             */
/*==============================================================*/
create table respuesta
(
   id_respuesta         int not null auto_increment,
   id_problema          int,
   id_lenguaje          int,
   id_usuario           int,
   respuesta            varchar(1000),
   respuesta_archivo    varchar(200),
   primary key (id_respuesta)
);

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol
(
   id_rol               int not null auto_increment,
   nombre_rol           varchar(100),
   descripcion_rol      varchar(200),
   primary key (id_rol)
);

/*==============================================================*/
/* Table: rol_menu                                              */
/*==============================================================*/
create table rol_menu
(
   id_rolmenu           int not null auto_increment,
   id_menu              int,
   id_rol               int,
   primary key (id_rolmenu)
);

/*==============================================================*/
/* Table: solucionario                                          */
/*==============================================================*/
create table solucionario
(
   id_solucionario      int not null auto_increment,
   id_lenguaje          int,
   id_problema          int,
   id_usuario           int,
   archivo_solucionario varchar(200),
   primary key (id_solucionario)
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
   id_usuario           int,
   id_rol               int,
   primary key (id_usuariorol)
);

alter table actividad add constraint fk_relationship_18 foreign key (id_entrenamiento)
      references entrenamiento (id_entrenamiento) on delete restrict on update restrict;

alter table anuncios add constraint fk_relationship_22 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table anuncios add constraint fk_relationship_23 foreign key (id_actividad)
      references actividad (id_actividad) on delete restrict on update restrict;

alter table autor add constraint fk_relationship_20 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table autor add constraint fk_relationship_21 foreign key (id_problema)
      references problema (id_problema) on delete restrict on update restrict;

alter table colegio add constraint fk_relationship_3 foreign key (id_entrenamiento)
      references entrenamiento (id_entrenamiento) on delete restrict on update restrict;

alter table datos_entrada add constraint fk_relationship_13 foreign key (id_problema)
      references problema (id_problema) on delete restrict on update restrict;

alter table datos_salida add constraint fk_relationship_14 foreign key (id_problema)
      references problema (id_problema) on delete restrict on update restrict;

alter table datos_salidarespuesta add constraint fk_relationship_16 foreign key (id_respuesta)
      references respuesta (id_respuesta) on delete restrict on update restrict;

alter table entrenador add constraint fk_relationship_25 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table entrenador add constraint fk_relationship_27 foreign key (id_colegio)
      references colegio (id_colegio) on delete restrict on update restrict;

alter table entrenamiento add constraint fk_relationship_17 foreign key (id_olimpiada)
      references olimpiada (id_olimpiada) on delete restrict on update restrict;

alter table participante add constraint fk_relationship_4 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table participante add constraint fk_relationship_5 foreign key (id_colegio)
      references colegio (id_colegio) on delete restrict on update restrict;

alter table problema add constraint fk_relationship_19 foreign key (id_actividad)
      references actividad (id_actividad) on delete restrict on update restrict;

alter table problema add constraint fk_relationship_24 foreign key (id_nivel)
      references nivel (id_nivel) on delete restrict on update restrict;

alter table respuesta add constraint fk_relationship_11 foreign key (id_lenguaje)
      references lenguaje (id_lenguaje) on delete restrict on update restrict;

alter table respuesta add constraint fk_relationship_12 foreign key (id_problema)
      references problema (id_problema) on delete restrict on update restrict;

alter table respuesta add constraint fk_relationship_15 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table rol_menu add constraint fk_relationship_26 foreign key (id_menu)
      references menu (id_menu) on delete restrict on update restrict;

alter table rol_menu add constraint fk_relationship_9 foreign key (id_rol)
      references rol (id_rol) on delete restrict on update restrict;

alter table solucionario add constraint fk_relationship_10 foreign key (id_lenguaje)
      references lenguaje (id_lenguaje) on delete restrict on update restrict;

alter table solucionario add constraint fk_relationship_28 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table solucionario add constraint fk_relationship_8 foreign key (id_problema)
      references problema (id_problema) on delete restrict on update restrict;

alter table usuario_rol add constraint fk_relationship_1 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table usuario_rol add constraint fk_relationship_2 foreign key (id_rol)
      references rol (id_rol) on delete restrict on update restrict;

