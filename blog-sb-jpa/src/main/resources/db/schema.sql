create table t_blog
(
  id              bigint                               not null,
  create_date     timestamp  default current_timestamp not null,
  deleted         tinyint(1) default 0                 not null,
  modify_date     timestamp  default current_timestamp not null,
  appreciation    boolean                              not null,
  commentabled    boolean                              not null,
  content         clob,
  description     varchar(255),
  first_picture   varchar(255),
  flag            varchar(255),
  published       boolean                              not null,
  recommend       boolean                              not null,
  share_statement boolean                              not null,
  title           varchar(255),
  views           integer,
  type_id         bigint,
  user_id         bigint,
  primary key (id)
);

create table t_blog_tags
(
  blogs_id bigint not null,
  tags_id  bigint not null
);

create table t_comment
(
  id                bigint                               not null,
  create_date       timestamp  default current_timestamp not null,
  deleted           tinyint(1) default 0                 not null,
  modify_date       timestamp  default current_timestamp not null,
  admin_comment     boolean                              not null,
  avatar            varchar(255),
  content           varchar(255),
  email             varchar(255),
  nickname          varchar(255),
  blog_id           bigint,
  parent_comment_id bigint,
  primary key (id)
);

create table t_tag
(
  id          bigint                               not null,
  create_date timestamp  default current_timestamp not null,
  deleted     tinyint(1) default 0                 not null,
  modify_date timestamp  default current_timestamp not null,
  name        varchar(255),
  primary key (id)
);

create table t_type
(
  id          bigint                               not null,
  create_date timestamp  default current_timestamp not null,
  deleted     tinyint(1) default 0                 not null,
  modify_date timestamp  default current_timestamp not null,
  name        varchar(255),
  primary key (id)
);

create table t_user
(
  id          bigint                               not null,
  create_date timestamp  default current_timestamp not null,
  deleted     tinyint(1) default 0                 not null,
  modify_date timestamp  default current_timestamp not null,
  avatar      varchar(255),
  email       varchar(255),
  nickname    varchar(255),
  password    varchar(255),
  type        integer,
  username    varchar(255),
  primary key (id)
);

create sequence hibernate_sequence start with 1 increment by 1;

alter table t_blog
  add constraint FK292449gwg5yf7ocdlmswv9w4j foreign key (type_id) references t_type;

alter table t_blog
  add constraint FK8ky5rrsxh01nkhctmo7d48p82 foreign key (user_id) references t_user;

alter table t_blog_tags
  add constraint FK5feau0gb4lq47fdb03uboswm8 foreign key (tags_id) references t_tag;

alter table t_blog_tags
  add constraint FKh4pacwjwofrugxa9hpwaxg6mr foreign key (blogs_id) references t_blog;
alter table t_comment
  add constraint FKke3uogd04j4jx316m1p51e05u foreign key (blog_id) references t_blog;
alter table t_comment
  add constraint FK4jj284r3pb7japogvo6h72q95 foreign key (parent_comment_id) references t_comment;


