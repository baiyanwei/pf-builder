prompt PL/SQL Developer import file
prompt Created on 2013年10月29日 by oracle
set feedback off
set define off
prompt Creating MSU_COMMAND...
create table MSU_COMMAND
(
  id           NUMBER(20) not null,
  open_command VARCHAR2(100),
  command      VARCHAR2(255),
  cdate        NUMBER(20),
  type_code    VARCHAR2(50)
)
;
comment on table MSU_COMMAND
  is '采集配置命令信息表';
comment on column MSU_COMMAND.id
  is 'id';
comment on column MSU_COMMAND.open_command
  is '开启命令';
comment on column MSU_COMMAND.command
  is '执行命令';
comment on column MSU_COMMAND.cdate
  is '入库时间';
comment on column MSU_COMMAND.type_code
  is '设备型号';
alter table MSU_COMMAND
  add constraint MSU_COMMAND_KEY_ID primary key (ID);

prompt Creating MSU_OPERTION...
create table MSU_OPERTION
(
  id             NUMBER(20) not null,
  operation_name VARCHAR2(50),
  operation_desc VARCHAR2(255),
  type_code      VARCHAR2(50)
)
;
comment on table MSU_OPERTION
  is '设备所支持的操作类型ssh/telnet,snmpv1/v2c/v3';
comment on column MSU_OPERTION.id
  is 'id';
comment on column MSU_OPERTION.operation_name
  is '操作名称';
comment on column MSU_OPERTION.operation_desc
  is '操作描述';
comment on column MSU_OPERTION.type_code
  is '设备型号编码';
alter table MSU_OPERTION
  add constraint MSU_OPERTION_KEY_ID primary key (ID);

prompt Creating MSU_RES_AUTH...
create table MSU_RES_AUTH
(
  id              NUMBER(20) not null,
  username        VARCHAR2(20),
  password        VARCHAR2(20),
  user_prompt     VARCHAR2(20),
  pass_prompt     VARCHAR2(20),
  prompt          VARCHAR2(20),
  exec_prompt     VARCHAR2(20),
  next_prompt     VARCHAR2(20),
  community       VARCHAR2(20),
  snmpv3_user     VARCHAR2(20),
  snmpv3_auth     VARCHAR2(20),
  snmpv3_authpass VARCHAR2(20),
  snmpv3_priv     VARCHAR2(20),
  snmpv3_privpass VARCHAR2(20),
  res_id          NUMBER(20) not null
)
;
comment on table MSU_RES_AUTH
  is '防火墙认证信息表';
comment on column MSU_RES_AUTH.id
  is 'id';
comment on column MSU_RES_AUTH.username
  is '用户名';
comment on column MSU_RES_AUTH.password
  is '密码';
comment on column MSU_RES_AUTH.user_prompt
  is '用户名提示字符串';
comment on column MSU_RES_AUTH.pass_prompt
  is '密码提示字符串';
comment on column MSU_RES_AUTH.prompt
  is '命令提示符';
comment on column MSU_RES_AUTH.exec_prompt
  is '执行命令提示符';
comment on column MSU_RES_AUTH.next_prompt
  is '翻页命令提示符';
comment on column MSU_RES_AUTH.community
  is '团体名';
comment on column MSU_RES_AUTH.snmpv3_user
  is 'V3版本用户名';
comment on column MSU_RES_AUTH.snmpv3_auth
  is '认证算法';
comment on column MSU_RES_AUTH.snmpv3_authpass
  is '认证密钥';
comment on column MSU_RES_AUTH.snmpv3_priv
  is '加密算法';
comment on column MSU_RES_AUTH.snmpv3_privpass
  is '加密密钥';
comment on column MSU_RES_AUTH.res_id
  is '资源ID';
alter table MSU_RES_AUTH
  add constraint MSU_RES_AUTH_KEY_ID primary key (ID);

prompt Creating MSU_SCHEDULE...
create table MSU_SCHEDULE
(
  task_id                  VARCHAR2(50) not null,
  schedule_id         VARCHAR2(50) not null,
  schedule_point      NUMBER(20) not null,
  create_at           NUMBER(20) not null,
  fetch_at            NUMBER(20),
  execute_at          NUMBER(20),
  execute_cost        NUMBER(20),
  execute_status      NUMBER(1),
  execute_description VARCHAR2(50)
)
;
comment on table MSU_SCHEDULE
  is '任务调度执行表';
comment on column MSU_SCHEDULE.id
  is '任务标识ID';
comment on column MSU_SCHEDULE.schedule_id
  is '任务调度ID';
comment on column MSU_SCHEDULE.schedule_point
  is '调度时间';
comment on column MSU_SCHEDULE.create_at
  is '入库时间';
comment on column MSU_SCHEDULE.fetch_at
  is '获取时间';
comment on column MSU_SCHEDULE.execute_at
  is '执行时间';
comment on column MSU_SCHEDULE.execute_cost
  is '执行时长';
comment on column MSU_SCHEDULE.execute_status
  is '执行情况';
comment on column MSU_SCHEDULE.execute_description
  is '执行描述';
alter table MSU_SCHEDULE
  add constraint MSU_SCHEDULE_KEY_ID primary key (ID, SCHEDULE_ID);

prompt Creating MSU_TASK...
create table MSU_TASK
(
  id          VARCHAR2(50) not null,
  region      VARCHAR2(50) not null,
  create_at   NUMBER(20) not null,
  schedule    VARCHAR2(255),
  operation   VARCHAR2(50) not null,
  content     VARCHAR2(1000),
  res_id      NUMBER(20) not null,
  is_realtime NUMBER(1) default 1
)
;
comment on table MSU_TASK
  is '任务信息表';
comment on column MSU_TASK.id
  is '任务标识ID';
comment on column MSU_TASK.region
  is '省市县编码';
comment on column MSU_TASK.create_at
  is '创建时间';
comment on column MSU_TASK.schedule
  is '调度规则';
comment on column MSU_TASK.operation
  is '任务操作';
comment on column MSU_TASK.content
  is '任务内容';
comment on column MSU_TASK.res_id
  is '资源ID';
comment on column MSU_TASK.is_realtime
  is 'realtime';
alter table MSU_TASK
  add constraint MSU_TASK_KEY_ID primary key (ID);

prompt Loading MSU_COMMAND...
prompt Table is empty
prompt Loading MSU_OPERTION...
prompt Table is empty
prompt Loading MSU_RES_AUTH...
prompt Table is empty
prompt Loading MSU_SCHEDULE...
prompt Table is empty
prompt Loading MSU_TASK...
prompt Table is empty
set feedback on
set define on
prompt Done.
