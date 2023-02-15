

drop table ava_data;

drop table bottle_data;

drop table terminology_data;

drop table user_favorite;

drop table users;

drop table varietal_data;

drop table winery_data;

/*==============================================================*/
/* Table: ava_data                                              */
/*==============================================================*/
create table ava_data (
   ava_id               SERIAL not null,
   topography           VARCHAR(800)         null,
   varietals            VARCHAR(800)         null,
   climate              VARCHAR(800)         null,
   ava_name             VARCHAR(255)         null,
   soils                VARCHAR(800)         null,
   location             VARCHAR(800)         null,
   constraint PK_AVA_DATA primary key (ava_id)
);

comment on table ava_data is
'ava_data_������ֲ��';

/*==============================================================*/
/* Table: bottle_data                                           */
/*==============================================================*/
create table bottle_data (
   bottle_id            SERIAL not null,
   pct_alcohol          VARCHAR(255)         null,
   year                 VARCHAR(6)           null,
   clusters             VARCHAR(255)         null,
   ta                   VARCHAR(255)         null,
   ph                   VARCHAR(255)         null,
   aging_process        VARCHAR(255)         null,
   winery_id            VARCHAR(30)          null,
   clones               VARCHAR(255)         null,
   wine_name            VARCHAR(255)         null,
   winery_name          VARCHAR(255)         null,
   varietals            VARCHAR(255)         null,
   soils                VARCHAR(255)         null,
   source_file          VARCHAR(255)         null,
   cases_produced       VARCHAR(255)         null,
   run_date             DATE                 null,
   constraint PK_BOTTLE_DATA primary key (bottle_id)
);

comment on table bottle_data is
'bottle_data_������';

/*==============================================================*/
/* Table: terminology_data                                      */
/*==============================================================*/
create table terminology_data (
   term                 VARCHAR(30)          not null,
   description          VARCHAR(1000)        null,
   constraint PK_TERMINOLOGY_DATA primary key (term)
);

comment on table terminology_data is
'terminology_data_����';

/*==============================================================*/
/* Table: user_favorite                                         */
/*==============================================================*/
create table user_favorite (
   id                   SERIAL not null,
   user_id              integer              not null,
   fav_id               integer              not null,
   type                 INT2                 not null,
   create_time          TIMESTAMP            null,
   op_time              TIMESTAMP            null,
   constraint PK_USER_FAVORITE primary key (id)
);

comment on table user_favorite is
'user_favorite�û��ղ�';

comment on column user_favorite.type is
'1.ava 2 winery,3.techsheet';

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users (
   user_id              SERIAL not null,
   user_name            VARCHAR(50)          null,
   user_old             INT4                 null,
   address              VARCHAR(800)         null,
   phone                VARCHAR(50)          null,
   email                VARCHAR(50)          null,
   create_time          INT8                 null,
   op_time              INT8                 null,
   constraint PK_USERS primary key (user_id)
);

comment on table users is
'users_�û�����';

/*==============================================================*/
/* Table: varietal_data                                         */
/*==============================================================*/
create table varietal_data (
   varietal_id          SERIAL not null,
   varietal_name        VARCHAR(255)         null,
   constraint PK_VARIETAL_DATA primary key (varietal_id)
);

comment on table varietal_data is
'varietal_data_Ʒ������';

/*==============================================================*/
/* Table: winery_data                                           */
/*==============================================================*/
create table winery_data (
   winery_id            SERIAL not null,
   address              VARCHAR(255)         null,
   phone_number         VARCHAR(30)          null,
   winery_url           VARCHAR(255)         null,
   winery_name          VARCHAR(255)         null,
   winemaker            VARCHAR(255)         null,
   constraint PK_WINERY_DATA primary key (winery_id)
);

comment on table winery_data is
'winery_data_��Ƴ�����';

