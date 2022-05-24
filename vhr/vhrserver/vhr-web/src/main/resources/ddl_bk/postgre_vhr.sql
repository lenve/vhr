-- Table Delete
DROP TABLE IF EXISTS "adjustsalary" CASCADE;
DROP TABLE IF EXISTS "appraise" CASCADE;
DROP TABLE IF EXISTS "department" CASCADE;
DROP TABLE IF EXISTS "employee" CASCADE;
DROP TABLE IF EXISTS "employeeec" CASCADE;
DROP TABLE IF EXISTS "employeeremove" CASCADE;
DROP TABLE IF EXISTS "employeetrain" CASCADE;
DROP TABLE IF EXISTS "empsalary" CASCADE;
DROP TABLE IF EXISTS "hr" CASCADE;
DROP TABLE IF EXISTS "hr_role" CASCADE;
DROP TABLE IF EXISTS "joblevel" CASCADE;
DROP TABLE IF EXISTS "mail_send_log" CASCADE;
DROP TABLE IF EXISTS "menu" CASCADE;
DROP TABLE IF EXISTS "menu_role" CASCADE;
DROP TABLE IF EXISTS "msgcontent" CASCADE;
DROP TABLE IF EXISTS "nation" CASCADE;
DROP TABLE IF EXISTS "oplog" CASCADE;
DROP TABLE IF EXISTS "politicsstatus" CASCADE;
DROP TABLE IF EXISTS "position" CASCADE;
DROP TABLE IF EXISTS "role" CASCADE;
DROP TABLE IF EXISTS "salary" CASCADE;
DROP TABLE IF EXISTS "sysmsg" CASCADE;

-- SEQUENCE Delete
DROP SEQUENCE IF EXISTS adjustsalary_seq;
DROP SEQUENCE IF EXISTS appraise_seq;
DROP SEQUENCE IF EXISTS department_seq;
DROP SEQUENCE IF EXISTS employee_seq;
DROP SEQUENCE IF EXISTS employeeec_seq;
DROP SEQUENCE IF EXISTS employeeremove_seq;
DROP SEQUENCE IF EXISTS employeetrain_seq;
DROP SEQUENCE IF EXISTS empsalary_seq;
DROP SEQUENCE IF EXISTS hr_seq;
DROP SEQUENCE IF EXISTS hr_role_seq;
DROP SEQUENCE IF EXISTS joblevel_seq;
DROP SEQUENCE IF EXISTS menu_seq;
DROP SEQUENCE IF EXISTS menu_role_seq;
DROP SEQUENCE IF EXISTS msgcontent_seq;
DROP SEQUENCE IF EXISTS nation_seq;
DROP SEQUENCE IF EXISTS oplog_seq;
DROP SEQUENCE IF EXISTS politicsstatus_seq;
DROP SEQUENCE IF EXISTS position_seq;
DROP SEQUENCE IF EXISTS role_seq;
DROP SEQUENCE IF EXISTS salary_seq;
DROP SEQUENCE IF EXISTS sysmsg_seq;


--
-- Name: adjustsalary; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.adjustsalary
(
    id             integer NOT NULL,
    eid            integer,
    as_date       date,
    before_salary integer,
    after_salary  integer,
    reason         character varying(255),
    remark         character varying(255)
);



--
-- Name: COLUMN adjustsalary.as_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.adjustsalary.as_date IS '调薪日期';


--
-- Name: COLUMN adjustsalary.before_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.adjustsalary.before_salary IS '调前薪资';


--
-- Name: COLUMN adjustsalary.after_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.adjustsalary.after_salary IS '调后薪资';


--
-- Name: COLUMN adjustsalary.reason; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.adjustsalary.reason IS '调薪原因';


--
-- Name: COLUMN adjustsalary.remark; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.adjustsalary.remark IS '备注';


--
-- Name: adjustsalary_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.adjustsalary_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: appraise; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.appraise
(
    id           integer NOT NULL,
    eid          integer,
    app_date    date,
    app_result  character varying(32),
    app_content character varying(255),
    remark       character varying(255)
);



--
-- Name: COLUMN appraise.app_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.appraise.app_date IS '考评日期';


--
-- Name: COLUMN appraise.app_result; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.appraise.app_result IS '考评结果';


--
-- Name: COLUMN appraise.app_content; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.appraise.app_content IS '考评内容';


--
-- Name: COLUMN appraise.remark; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.appraise.remark IS '备注';


--
-- Name: appraise_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.appraise_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: department; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.department
(
    id         integer NOT NULL,
    name       character varying(32),
    parent_id integer,
    dep_path  character varying(255),
    enabled    smallint,
    is_parent smallint
);



--
-- Name: COLUMN department.name; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.department.name IS '部门名称';


--
-- Name: department_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.department_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: employee; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.employee
(
    id               integer NOT NULL,
    name             character varying(10),
    gender           character(4),
    birthday         date,
    id_Card         character(18),
    wedlock          character varying(255),
    nation_id       integer,
    native_place    character varying(20),
    politic_id      integer,
    email            character varying(20),
    phone            character varying(11),
    address          character varying(64),
    department_id   integer,
    job_level_id     integer,
    pos_id          integer,
    engage_form     character varying(8),
    tiptop_degree   character varying(255),
    specialty        character varying(32),
    school           character varying(32),
    begin_date      date,
    work_state      character varying(255),
    work_id         character(8),
    contract_term   double precision,
    conversion_time date,
    notWork_date    date,
    begin_contract  date,
    end_contract    date,
    work_age        integer
);



--
-- Name: COLUMN employee.id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.id IS '员工编号';


--
-- Name: COLUMN employee.name; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.name IS '员工姓名';


--
-- Name: COLUMN employee.gender; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.gender IS '性别';


--
-- Name: COLUMN employee.birthday; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.birthday IS '出生日期';


--
-- Name: COLUMN employee.id_Card; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.id_Card IS '身份证号';


--
-- Name: COLUMN employee.wedlock; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.wedlock IS '婚姻状况';


--
-- Name: COLUMN employee.nation_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.nation_id IS '民族';


--
-- Name: COLUMN employee.native_place; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.native_place IS '籍贯';


--
-- Name: COLUMN employee.politic_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.politic_id IS '政治面貌';


--
-- Name: COLUMN employee.email; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.email IS '邮箱';


--
-- Name: COLUMN employee.phone; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.phone IS '电话号码';


--
-- Name: COLUMN employee.address; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.address IS '联系地址';


--
-- Name: COLUMN employee.department_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.department_id IS '所属部门';


--
-- Name: COLUMN employee.job_level_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.job_level_id IS '职称ID';


--
-- Name: COLUMN employee.pos_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.pos_id IS '职位ID';


--
-- Name: COLUMN employee.engage_form; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.engage_form IS '聘用形式';


--
-- Name: COLUMN employee.tiptop_degree; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.tiptop_degree IS '最高学历';


--
-- Name: COLUMN employee.specialty; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.specialty IS '所属专业';


--
-- Name: COLUMN employee.school; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.school IS '毕业院校';


--
-- Name: COLUMN employee.begin_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.begin_date IS '入职日期';


--
-- Name: COLUMN employee.work_state; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.work_state IS '在职状态';


--
-- Name: COLUMN employee.work_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.work_id IS '工号';


--
-- Name: COLUMN employee.contract_term; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.contract_term IS '合同期限';


--
-- Name: COLUMN employee.conversion_time; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.conversion_time IS '转正日期';


--
-- Name: COLUMN employee.notWork_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.notWork_date IS '离职日期';


--
-- Name: COLUMN employee.begin_contract; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.begin_contract IS '合同起始日期';


--
-- Name: COLUMN employee.end_contract; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.end_contract IS '合同终止日期';


--
-- Name: COLUMN employee.work_age; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employee.work_age IS '工龄';


--
-- Name: employee_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.employee_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: employeeec; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.employeeec
(
    id         integer NOT NULL,
    eid        integer,
    ec_date   date,
    ec_reason character varying(255),
    ec_point  integer,
    ec_type   integer,
    remark     character varying(255)
);



--
-- Name: COLUMN employeeec.eid; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.eid IS '员工编号';


--
-- Name: COLUMN employeeec.ec_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.ec_date IS '奖罚日期';


--
-- Name: COLUMN employeeec.ec_reason; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.ec_reason IS '奖罚原因';


--
-- Name: COLUMN employeeec.ec_point; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.ec_point IS '奖罚分';


--
-- Name: COLUMN employeeec.ec_type; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.ec_type IS '奖罚类别，0：奖，1：罚';


--
-- Name: COLUMN employeeec.remark; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeec.remark IS '备注';


--
-- Name: employeeec_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.employeeec_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: employeeremove; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.employeeremove
(
    id           integer NOT NULL,
    eid          integer,
    after_dep_id integer,
    after_job_id integer,
    remove_date date,
    reason       character varying(255),
    remark       character varying(255)
);



--
-- Name: COLUMN employeeremove.after_dep_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeremove.after_dep_id IS '调动后部门';


--
-- Name: COLUMN employeeremove.after_job_id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeremove.after_job_id IS '调动后职位';


--
-- Name: COLUMN employeeremove.remove_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeremove.remove_date IS '调动日期';


--
-- Name: COLUMN employeeremove.reason; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeeremove.reason IS '调动原因';


--
-- Name: employeeremove_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.employeeremove_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: employeetrain; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.employeetrain
(
    id             integer NOT NULL,
    eid            integer,
    train_date    date,
    train_content character varying(255),
    remark         character varying(255)
);



--
-- Name: COLUMN employeetrain.eid; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeetrain.eid IS '员工编号';


--
-- Name: COLUMN employeetrain.train_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeetrain.train_date IS '培训日期';


--
-- Name: COLUMN employeetrain.train_content; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeetrain.train_content IS '培训内容';


--
-- Name: COLUMN employeetrain.remark; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.employeetrain.remark IS '备注';


--
-- Name: employeetrain_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.employeetrain_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: empsalary; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.empsalary
(
    id  integer NOT NULL,
    eid integer,
    sid integer
);



--
-- Name: empsalary_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.empsalary_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: hr; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.hr
(
    id        integer NOT NULL,
    name      character varying(32),
    phone     character(11),
    telephone character varying(16),
    address   character varying(64),
    enabled   smallint,
    username  character varying(255),
    password  character varying(255),
    userface  character varying(255),
    remark    character varying(255)
);



--
-- Name: COLUMN hr.id; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.id IS 'hrID';


--
-- Name: COLUMN hr.name; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.name IS '姓名';


--
-- Name: COLUMN hr.phone; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.phone IS '手机号码';


--
-- Name: COLUMN hr.telephone; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.telephone IS '住宅电话';


--
-- Name: COLUMN hr.address; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.address IS '联系地址';


--
-- Name: COLUMN hr.username; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.username IS '用户名';


--
-- Name: COLUMN hr.password; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.hr.password IS '密码';


--
-- Name: hr_role; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.hr_role
(
    id   integer NOT NULL,
    hrid integer,
    rid  integer
);



--
-- Name: hr_role_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.hr_role_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: hr_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.hr_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: joblevel; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.joblevel
(
    id           integer NOT NULL,
    name         character varying(32),
    title_level character varying(255),
    create_date timestamp without time zone,
    enabled      smallint
);



--
-- Name: COLUMN joblevel.name; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.joblevel.name IS '职称名称';


--
-- Name: joblevel_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.joblevel_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: mail_send_log; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.mail_send_log
(
    msg_id      character varying(255),
    emp_id      integer,
    status       integer,
    route_key   character varying(255),
    exchange     character varying(255),
    count        integer,
    try_time    timestamp without time zone,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);



--
-- Name: COLUMN mail_send_log.status; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.mail_send_log.status IS '0发送中，1发送成功，2发送失败';


--
-- Name: COLUMN mail_send_log.count; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.mail_send_log.count IS '重试次数';


--
-- Name: COLUMN mail_send_log.try_time; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.mail_send_log.try_time IS '第一次重试时间';


--
-- Name: menu; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.menu
(
    id            integer NOT NULL,
    url           character varying(64),
    path          character varying(64),
    component     character varying(64),
    name          character varying(64),
    icon_cls     character varying(64),
    keep_alive   smallint,
    require_auth smallint,
    parent_id    integer,
    enabled       smallint
);



--
-- Name: menu_role; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.menu_role
(
    id  integer NOT NULL,
    mid integer,
    rid integer
);



--
-- Name: menu_role_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.menu_role_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: menu_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.menu_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: msgcontent; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.msgcontent
(
    id           integer NOT NULL,
    title        character varying(64),
    message      character varying(255),
    create_date timestamp without time zone NOT NULL
);



--
-- Name: msgcontent_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.msgcontent_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: nation; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.nation
(
    id   integer NOT NULL,
    name character varying(32)
);



--
-- Name: nation_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.nation_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: oplog; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.oplog
(
    id        integer NOT NULL,
    add_date date,
    operate   character varying(255),
    hrid      integer
);



--
-- Name: COLUMN oplog.add_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.oplog.add_date IS '添加日期';


--
-- Name: COLUMN oplog.operate; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.oplog.operate IS '操作内容';


--
-- Name: COLUMN oplog.hrid; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.oplog.hrid IS '操作员ID';


--
-- Name: oplog_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.oplog_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: politicsstatus; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.politicsstatus
(
    id   integer NOT NULL,
    name character varying(32)
);



--
-- Name: politicsstatus_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.politicsstatus_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: position; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.position
(
    id           integer NOT NULL,
    name         character varying(32),
    create_date timestamp without time zone,
    enabled      smallint
);



--
-- Name: COLUMN position.name; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.position.name IS '职位';


--
-- Name: position_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.position_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: role; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.role
(
    id       integer NOT NULL,
    name     character varying(64),
    name_zh character varying(64)
);



--
-- Name: COLUMN role.name_zh; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.role.name_zh IS '角色名称';


--
-- Name: role_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.role_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: salary; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.salary
(
    id                     integer NOT NULL,
    basic_salary          integer,
    bonus                  integer,
    lunch_salary          integer,
    traffic_salary        integer,
    all_salary            integer,
    pension_base          integer,
    pension_per           real,
    create_date           timestamp without time zone,
    medical_base          integer,
    medical_per           real,
    accumulation_fund_base integer,
    accumulation_fund_per  real,
    name                   character varying(32)
);



--
-- Name: COLUMN salary.basic_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.basic_salary IS '基本工资';


--
-- Name: COLUMN salary.bonus; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.bonus IS '奖金';


--
-- Name: COLUMN salary.lunch_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.lunch_salary IS '午餐补助';


--
-- Name: COLUMN salary.traffic_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.traffic_salary IS '交通补助';


--
-- Name: COLUMN salary.all_salary; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.all_salary IS '应发工资';


--
-- Name: COLUMN salary.pension_base; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.pension_base IS '养老金基数';


--
-- Name: COLUMN salary.pension_per; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.pension_per IS '养老金比率';


--
-- Name: COLUMN salary.create_date; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.create_date IS '启用时间';


--
-- Name: COLUMN salary.medical_base; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.medical_base IS '医疗基数';


--
-- Name: COLUMN salary.medical_per; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.medical_per IS '医疗保险比率';


--
-- Name: COLUMN salary.accumulation_fund_base; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.accumulation_fund_base IS '公积金基数';


--
-- Name: COLUMN salary.accumulation_fund_per; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.salary.accumulation_fund_per IS '公积金比率';


--
-- Name: salary_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.salary_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;



--
-- Name: sysmsg; Type: TABLE; Schema: vhr; Owner: postgres
--

CREATE TABLE vhr.sysmsg
(
    id    integer NOT NULL,
    mid   integer,
    type  integer,
    hrid  integer,
    state integer
);



--
-- Name: COLUMN sysmsg.mid; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.sysmsg.mid IS '消息id';


--
-- Name: COLUMN sysmsg.type; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.sysmsg.type IS '0表示群发消息';


--
-- Name: COLUMN sysmsg.hrid; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.sysmsg.hrid IS '这条消息是给谁的';


--
-- Name: COLUMN sysmsg.state; Type: COMMENT; Schema: vhr; Owner: postgres
--

COMMENT ON COLUMN vhr.sysmsg.state IS '0 未读 1 已读';


--
-- Name: sysmsg_seq; Type: SEQUENCE; Schema: vhr; Owner: postgres
--

CREATE
    SEQUENCE vhr.sysmsg_seq
    START
        WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
        1;


--
-- Data for Name: adjustsalary; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: appraise; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: department; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.department
VALUES (1, '股东会', -1, '.1 ', 1, 1);
INSERT INTO vhr.department
VALUES (4, '董事会', 1, '.1.4 ', 1, 1);
INSERT INTO vhr.department
VALUES (5, '总办', 4, '.1.4.5 ', 1, 1);
INSERT INTO vhr.department
VALUES (8, '财务部', 5, '.1.4.5.8 ', 1, 0);
INSERT INTO vhr.department
VALUES (78, '市场部', 5, '.1.4.5.78 ', 1, 1);
INSERT INTO vhr.department
VALUES (81, '华北市场部', 78, '.1.4.5.78.81 ', 1, 1);
INSERT INTO vhr.department
VALUES (82, '华南市场部', 78, '.1.4.5.78.82 ', 1, 0);
INSERT INTO vhr.department
VALUES (85, '石家庄市场部', 81, '.1.4.5.78.81.85 ', 1, 0);
INSERT INTO vhr.department
VALUES (86, '西北市场部', 78, '.1.4.5.78.86 ', 1, 1);
INSERT INTO vhr.department
VALUES (87, '西安市场', 86, '.1.4.5.78.86.87 ', 1, 1);
INSERT INTO vhr.department
VALUES (89, '莲湖区市场', 87, '.1.4.5.78.86.87.89 ', 1, 0);
INSERT INTO vhr.department
VALUES (91, '技术部', 5, '.1.4.5.91 ', 1, 0);
INSERT INTO vhr.department
VALUES (92, '运维部', 5, '.1.4.5.92 ', 1, 1);
INSERT INTO vhr.department
VALUES (93, '运维1部', 92, '.1.4.5.92.93 ', 1, 0);
INSERT INTO vhr.department
VALUES (94, '运维2部', 92, '.1.4.5.92.94 ', 1, 0);
INSERT INTO vhr.department
VALUES (96, 'bbb', 1, '.1.96 ', 1, 1);
INSERT INTO vhr.department
VALUES (104, '111', 96, '.1.96.104 ', 1, 0);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.employee
VALUES (1, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (2, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (3, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (4, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (5, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (6, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (7, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (8, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (9, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (10, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (11, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (12, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (13, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (14, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (15, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (16, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (17, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (18, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (19, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (20, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (21, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (22, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (24, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (25, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (26, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (27, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (28, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (29, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1355, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (31, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (32, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (33, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (34, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (35, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (36, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (37, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (38, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (39, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (40, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (41, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (42, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (43, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (44, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (45, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (46, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (47, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (48, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (49, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (50, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (51, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (52, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (53, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (54, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (55, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (56, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1351, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1352, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1353, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1354, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1357, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1358, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1359, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1360, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1361, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1362, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1363, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1364, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1365, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1366, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1367, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1368, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1369, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1370, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1371, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1372, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1373, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1374, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1375, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1376, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1377, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1378, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1379, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1380, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1381, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1382, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1383, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1384, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1385, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1411, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1723, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1412, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1413, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4,
        '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1414, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1415, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1416, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1417, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1418, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1419, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31',
        NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1420, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1421, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1422, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1423, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1424, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1425, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1426, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1427, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1428, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1429, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1430, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1431, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1432, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1433, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1434, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1435, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1436, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1437, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1438, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1439, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1440, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1441, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1442, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1443, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1444, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1445, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1446, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1447, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1448, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1449, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1450, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1451, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1452, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1453, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1454, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1455, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1456, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1457, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1458, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1459, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1460, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1461, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1462, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1463, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1464, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1465, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1466, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1467, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1468, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1469, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1470, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1471, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1472, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1473, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1724, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1474, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1475, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1476, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1477, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1478, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1479, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1480, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1481, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1482, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1483, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1484, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1485, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1486, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1487, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1488, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1489, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1490, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1491, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1492, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1493, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1494, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1495, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1496, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1497, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1498, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1499, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1500, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1501, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1502, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1503, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1725, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1504, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1505, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1506, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1507, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1508, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1509, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1510, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1511, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL,
        '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1512, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1513, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1514, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1515, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1516, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1517, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1518, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1519, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1520, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1521, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1522, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1523, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1526, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1527, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO vhr.employee
VALUES (1528, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1529, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1530, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1531, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1532, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1533, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1534, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1535, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1536, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1537, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1538, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1539, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1540, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1541, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1542, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1543, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1544, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1545, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1546, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1547, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1548, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1549, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1550, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1551, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1552, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1553, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1554, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1555, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1556, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1557, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1558, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1559, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1560, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1561, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1562, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1563, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1564, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1565, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1566, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1567, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1568, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1569, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1570, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1571, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1572, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1573, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1574, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1575, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1576, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1577, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1578, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1579, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1580, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1581, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1582, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1583, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1584, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1585, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1586, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1587, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1588, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1589, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1590, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1591, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1592, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1593, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1594, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1595, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1596, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1597, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1598, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1599, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1600, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1601, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1602, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1603, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1604, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1605, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1606, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1607, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1608, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1609, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1610, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1611, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1612, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1613, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1614, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1615, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1616, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1617, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1618, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1619, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1620, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4,
        '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1621, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1622, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1623, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1624, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1625, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1626, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31',
        NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1627, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1628, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1629, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1630, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1631, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1632, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1633, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1634, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1635, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1636, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1637, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1638, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1639, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1640, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1641, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1642, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1643, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1644, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1645, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1646, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1647, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1648, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1649, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1650, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1651, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1652, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1653, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1654, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1655, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1656, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1657, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1658, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1659, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1660, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1661, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1662, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1663, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1664, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1665, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1666, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1667, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1668, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1669, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1670, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1671, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1672, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1673, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1674, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1675, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1676, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1677, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1678, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1679, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1680, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1681, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1682, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1683, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1684, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1685, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1686, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1687, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1688, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1689, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1690, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1691, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1692, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1693, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1694, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1695, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1696, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1697, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1698, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1699, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1700, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1701, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1702, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1703, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1704, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1705, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1706, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1707, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1708, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1709, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1710, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1711, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1712, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1713, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1714, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1715, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1716, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1717, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1718, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL,
        '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1719, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1720, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1721, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1722, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1726, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1727, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1728, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1729, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1730, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1731, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1732, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO vhr.employee
VALUES (1733, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1734, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1735, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1736, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1737, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1738, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1739, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1740, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1741, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1742, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1743, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1744, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1745, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1746, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1747, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1748, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1749, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1750, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1751, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1752, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1753, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1754, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1755, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1756, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1757, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1758, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1759, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1760, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1761, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1762, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1763, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1764, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1765, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1766, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1767, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1768, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1769, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1770, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1771, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1772, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1773, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1774, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1775, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1776, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1777, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1778, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1779, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1780, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1781, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1782, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1783, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1784, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1785, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1786, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1787, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1788, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1789, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1790, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1791, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1792, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1793, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1794, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1795, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1796, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1797, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1798, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1799, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1800, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1801, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1802, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1803, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1804, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1805, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1806, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1807, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1808, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1809, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1810, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1811, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1812, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1813, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1814, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1815, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1816, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1817, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1818, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1819, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1820, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1821, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1822, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1823, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1824, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1825, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4,
        '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1826, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1827, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1828, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1829, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1830, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1831, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31',
        NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1832, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1833, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1834, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1835, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1836, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1837, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1838, '云星', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1839, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1840, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1841, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1842, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1843, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1844, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1845, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1846, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1847, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1848, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1849, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1850, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1851, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1852, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1853, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1854, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1855, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1856, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1857, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1858, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1859, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1860, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1861, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1862, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1863, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1864, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1865, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1866, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1867, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1868, '张黎明2', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1869, '薛磊4', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1870, '张洁4', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1871, '江南一点雨5', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1872, '陈静5', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1873, '赵琳浩5', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1874, '鹿存亮5', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1875, '姚森5', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1876, '云星5', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1877, '贾旭明5', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1878, '张黎明5', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1879, '薛磊5', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1880, '张洁5', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1881, '江南一点雨6', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1882, '陈静6', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1883, '赵琳浩6', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1884, '鹿存亮6', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1885, '姚森6', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1886, '云星6', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1887, '江南一点雨', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1888, '陈静', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1889, '赵琳浩', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1890, '鹿存亮', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1891, '姚森', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1892, '贾旭明', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1893, '张黎明', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1894, '薛磊', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1895, '张洁', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1896, '江南一点雨2', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1897, '陈静2', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1898, '赵琳浩2', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1899, '鹿存亮2', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1900, '姚森2', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1901, '云星2', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1902, '贾旭明2', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1903, '王一亭', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1904, '薛磊2', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1905, '张洁2', '女   ', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com',
        '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职',
        '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1906, '江南一点雨3', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1907, '陈静3', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1908, '鹿存亮3', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1909, '姚森3', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1910, '云星3', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1911, '贾旭明3', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1912, '张黎明3', '男   ', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com',
        '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028',
        7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO vhr.employee
VALUES (1913, '薛磊3', '男   ', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com',
        '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职',
        '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1914, '江南一点雨4', '男   ', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职',
        '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1915, '陈静4', '女   ', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com',
        '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职',
        '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO vhr.employee
VALUES (1916, '赵琳浩4', '男   ', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com',
        '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1917, '鹿存亮4', '男   ', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com',
        '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职',
        '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO vhr.employee
VALUES (1918, '姚森4', '男   ', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com',
        '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职',
        '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO vhr.employee
VALUES (1919, '云星4', '女   ', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com',
        '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职',
        '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1920, '贾旭明4', '男   ', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com',
        '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职',
        '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO vhr.employee
VALUES (1921, '谢工', '女   ', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com',
        '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职',
        '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1922, '林昭亮', '男   ', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com',
        '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职',
        '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO vhr.employee
VALUES (1923, '11', '男   ', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com',
        '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL,
        '2018-01-01', '2022-01-26', NULL);
INSERT INTO vhr.employee
VALUES (1924, '1', '男   ', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1925, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL,
        '2018-01-31', '2019-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1926, '1', '男   ', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1927, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1928, '1', '男   ', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL,
        '2018-01-01', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1929, '林伯渠', '男   ', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com',
        '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1930, '1', '男   ', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1',
        '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL,
        '2018-01-31', '2018-01-31', NULL);
INSERT INTO vhr.employee
VALUES (1931, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1932, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1933, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职',
        '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1934, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1935, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com',
        '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1936, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO vhr.employee
VALUES (1937, 'javaboy', '男   ', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com',
        '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职',
        '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO vhr.employee
VALUES (1938, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1939, 'javaboy666', '男   ', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com',
        '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063',
        3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO vhr.employee
VALUES (1940, 'javaboy', '男   ', '2017-11-01', '610144199905059999', '已婚', 1, '广东', 13,
        '584991843@qq.com', '18564447789', '广东深圳', 85, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学',
        '2019-11-24', '在职', '00000064', 3, '2020-01-10', NULL, '2019-11-24', '2022-11-27', NULL);
INSERT INTO vhr.employee
VALUES (1941, 'javaboy', '男   ', '2019-11-24', '610144199905056666', '已婚', 1, '广东', 13,
        '584991843@qq.com', '18566667777', '广东深圳', 89, 9, 29, '劳动合同', '本科', '计算机科学', '深圳大学',
        '2019-11-24', '在职', '00000065', 3, '2020-02-23', NULL, '2019-11-24', '2022-11-27', NULL);


--
-- Data for Name: employeeec; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: employeeremove; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: employeetrain; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: empsalary; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.empsalary
VALUES (6, 4, 10);
INSERT INTO vhr.empsalary
VALUES (10, 5, 9);
INSERT INTO vhr.empsalary
VALUES (11, 6, 13);
INSERT INTO vhr.empsalary
VALUES (12, 7, 13);
INSERT INTO vhr.empsalary
VALUES (14, 8, 10);
INSERT INTO vhr.empsalary
VALUES (15, 9, 10);
INSERT INTO vhr.empsalary
VALUES (20, 10, 13);
INSERT INTO vhr.empsalary
VALUES (21, 11, 9);
INSERT INTO vhr.empsalary
VALUES (22, 3, 13);
INSERT INTO vhr.empsalary
VALUES (24, 2, 9);
INSERT INTO vhr.empsalary
VALUES (25, 1, 13);
INSERT INTO vhr.empsalary
VALUES (26, 33, 10);
INSERT INTO vhr.empsalary
VALUES (28, 34, 9);
INSERT INTO vhr.empsalary
VALUES (29, 44, 10);
INSERT INTO vhr.empsalary
VALUES (30, 45, 10);
INSERT INTO vhr.empsalary
VALUES (31, 43, 10);
INSERT INTO vhr.empsalary
VALUES (32, 47, 10);
INSERT INTO vhr.empsalary
VALUES (33, 52, 13);
INSERT INTO vhr.empsalary
VALUES (34, 53, 10);
INSERT INTO vhr.empsalary
VALUES (35, 54, 10);
INSERT INTO vhr.empsalary
VALUES (36, 56, 10);
INSERT INTO vhr.empsalary
VALUES (38, 21, 9);


--
-- Data for Name: hr; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.hr
VALUES (3, '系统管理员', '18568887789', '029-82881234', '深圳南山', 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL);
INSERT INTO vhr.hr
VALUES (5, '李白', '18568123489', '029-82123434', '海口美兰', 1, 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL);
INSERT INTO vhr.hr
VALUES (10, '韩愈', '18568123666', '029-82111555', '广州番禺', 1, 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO vhr.hr
VALUES (11, '柳宗元', '18568123377', '029-82111333', '广州天河', 1, 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', NULL);
INSERT INTO vhr.hr
VALUES (12, '曾巩', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);


--
-- Data for Name: hr_role; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.hr_role
VALUES (1, 3, 6);
INSERT INTO vhr.hr_role
VALUES (35, 12, 4);
INSERT INTO vhr.hr_role
VALUES (36, 12, 3);
INSERT INTO vhr.hr_role
VALUES (37, 12, 2);
INSERT INTO vhr.hr_role
VALUES (43, 11, 3);
INSERT INTO vhr.hr_role
VALUES (44, 11, 2);
INSERT INTO vhr.hr_role
VALUES (45, 11, 4);
INSERT INTO vhr.hr_role
VALUES (46, 11, 5);
INSERT INTO vhr.hr_role
VALUES (48, 10, 3);
INSERT INTO vhr.hr_role
VALUES (49, 10, 4);
INSERT INTO vhr.hr_role
VALUES (72, 5, 1);
INSERT INTO vhr.hr_role
VALUES (73, 5, 2);
INSERT INTO vhr.hr_role
VALUES (74, 5, 3);


--
-- Data for Name: joblevel; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.joblevel
VALUES (9, '教授', '正高级', '2018-01-11 00:00:00', 1);
INSERT INTO vhr.joblevel
VALUES (10, '副教授', '副高级', '2018-01-11 21:19:20', 1);
INSERT INTO vhr.joblevel
VALUES (12, '助教', '初级 ', '2018-01-11 21:35:39', 1);
INSERT INTO vhr.joblevel
VALUES (13, '讲师', '中级 ', '2018-01-11 00:00:00', 0);
INSERT INTO vhr.joblevel
VALUES (14, '初级工程师', '初级 ', '2018-01-14 00:00:00', 1);
INSERT INTO vhr.joblevel
VALUES (15, '中级工程师66', '中级 ', '2018-01-14 00:00:00', 1);
INSERT INTO vhr.joblevel
VALUES (16, '高级工程师', '副高级', '2018-01-14 16:19:14', 1);
INSERT INTO vhr.joblevel
VALUES (17, '骨灰级工程师', '正高级', '2018-01-14 16:19:24', 1);


--
-- Data for Name: mail_send_log; Type: TABLE DATA; Schema: vhr; Owner: postgres
--


--
-- Data for Name: menu; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.menu
VALUES (1, ' / ', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1);
INSERT INTO vhr.menu
VALUES (2, ' / ', ' / home ', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO vhr.menu
VALUES (3, ' / ', ' / home ', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO vhr.menu
VALUES (4, ' / ', ' / home ', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO vhr.menu
VALUES (5, ' / ', ' / home ', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO vhr.menu
VALUES (6, ' / ', ' / home ', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO vhr.menu
VALUES (7, ' / employee / basic/**', '/emp/basic', 'EmpBasic', '基本资料', NULL, NULL, 1, 2, 1);
INSERT INTO vhr.menu VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', NULL, NULL, 1, 2, 1);
INSERT INTO vhr.menu VALUES (9, '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', NULL, NULL, 1, 3, 1);
INSERT INTO vhr.menu VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', NULL, NULL, 1, 3, 1);
INSERT INTO vhr.menu VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', NULL, NULL, 1, 3, 1);
INSERT INTO vhr.menu VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', NULL, NULL, 1, 3, 1);
INSERT INTO vhr.menu VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', NULL, NULL, 1, 3, 1);
INSERT INTO vhr.menu VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', NULL, NULL, 1, 4, 1);
INSERT INTO vhr.menu VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', NULL, NULL, 1, 4, 1);
INSERT INTO vhr.menu VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', NULL, NULL, 1, 4, 1);
INSERT INTO vhr.menu VALUES (17, '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', NULL, NULL, 1, 4, 1);
INSERT INTO vhr.menu VALUES (18, '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', NULL, NULL, 1, 4, 1);
INSERT INTO vhr.menu VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO vhr.menu VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', NULL, NULL, 1, 5, 1);
INSERT INTO vhr.menu VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO vhr.menu VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录统计', NULL, NULL, 1, 5, 1);
INSERT INTO vhr.menu VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', NULL, NULL, 1, 6, 1);
INSERT INTO vhr.menu VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', NULL, NULL, 1, 6, 1);
INSERT INTO vhr.menu VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', NULL, NULL, 1, 6, 1);
INSERT INTO vhr.menu VALUES (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', NULL, NULL, 1, 6, 1);
INSERT INTO vhr.menu VALUES (27, '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', NULL, NULL, 1, 6, 1);
INSERT INTO vhr.menu VALUES (28, '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', NULL, NULL, 1, 6, 1);


--
-- Data for Name: menu_role; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.menu_role VALUES (161, 7, 3);
INSERT INTO vhr.menu_role VALUES (162, 7, 6);
INSERT INTO vhr.menu_role VALUES (163, 9, 6);
INSERT INTO vhr.menu_role VALUES (164, 10, 6);
INSERT INTO vhr.menu_role VALUES (165, 11, 6);
INSERT INTO vhr.menu_role VALUES (166, 12, 6);
INSERT INTO vhr.menu_role VALUES (167, 13, 6);
INSERT INTO vhr.menu_role VALUES (168, 14, 6);
INSERT INTO vhr.menu_role VALUES (169, 15, 6);
INSERT INTO vhr.menu_role VALUES (170, 16, 6);
INSERT INTO vhr.menu_role VALUES (171, 17, 6);
INSERT INTO vhr.menu_role VALUES (172, 18, 6);
INSERT INTO vhr.menu_role VALUES (173, 19, 6);
INSERT INTO vhr.menu_role VALUES (174, 20, 6);
INSERT INTO vhr.menu_role VALUES (175, 21, 6);
INSERT INTO vhr.menu_role VALUES (176, 22, 6);
INSERT INTO vhr.menu_role VALUES (177, 23, 6);
INSERT INTO vhr.menu_role VALUES (178, 25, 6);
INSERT INTO vhr.menu_role VALUES (179, 26, 6);
INSERT INTO vhr.menu_role VALUES (180, 27, 6);
INSERT INTO vhr.menu_role VALUES (181, 28, 6);
INSERT INTO vhr.menu_role VALUES (182, 24, 6);
INSERT INTO vhr.menu_role VALUES (247, 7, 4);
INSERT INTO vhr.menu_role VALUES (248, 8, 4);
INSERT INTO vhr.menu_role VALUES (249, 11, 4);
INSERT INTO vhr.menu_role VALUES (250, 7, 2);
INSERT INTO vhr.menu_role VALUES (251, 8, 2);
INSERT INTO vhr.menu_role VALUES (252, 9, 2);
INSERT INTO vhr.menu_role VALUES (253, 10, 2);
INSERT INTO vhr.menu_role VALUES (254, 12, 2);
INSERT INTO vhr.menu_role VALUES (255, 13, 2);
INSERT INTO vhr.menu_role VALUES (256, 7, 1);
INSERT INTO vhr.menu_role VALUES (257, 8, 1);
INSERT INTO vhr.menu_role VALUES (258, 9, 1);
INSERT INTO vhr.menu_role VALUES (259, 10, 1);
INSERT INTO vhr.menu_role VALUES (260, 11, 1);
INSERT INTO vhr.menu_role VALUES (261, 12, 1);
INSERT INTO vhr.menu_role VALUES (262, 13, 1);
INSERT INTO vhr.menu_role VALUES (263, 14, 1);
INSERT INTO vhr.menu_role VALUES (264, 15, 1);
INSERT INTO vhr.menu_role VALUES (265, 16, 1);
INSERT INTO vhr.menu_role VALUES (266, 17, 1);
INSERT INTO vhr.menu_role VALUES (267, 18, 1);
INSERT INTO vhr.menu_role VALUES (268, 19, 1);
INSERT INTO vhr.menu_role VALUES (269, 20, 1);
INSERT INTO vhr.menu_role VALUES (270, 21, 1);
INSERT INTO vhr.menu_role VALUES (271, 22, 1);
INSERT INTO vhr.menu_role VALUES (272, 23, 1);
INSERT INTO vhr.menu_role VALUES (273, 24, 1);
INSERT INTO vhr.menu_role VALUES (274, 25, 1);
INSERT INTO vhr.menu_role VALUES (275, 26, 1);
INSERT INTO vhr.menu_role VALUES (276, 27, 1);
INSERT INTO vhr.menu_role VALUES (277, 28, 1);
INSERT INTO vhr.menu_role VALUES (280, 7, 14);
INSERT INTO vhr.menu_role VALUES (281, 8, 14);
INSERT INTO vhr.menu_role VALUES (282, 9, 14);


--
-- Data for Name: msgcontent; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.msgcontent VALUES (14, '2222222222', '11111111111111111', '2018-02-02 20:46:19');
INSERT INTO vhr.msgcontent VALUES (15, '22222222', '3333333333333333333333', '2018-02-02 21:45:57');
INSERT INTO vhr.msgcontent VALUES (16, '通知标题1', '通知内容1', '2018-02-03 11:41:39');
INSERT INTO vhr.msgcontent VALUES (17, '通知标题2', '通知内容2', '2018-02-03 11:52:37');
INSERT INTO vhr.msgcontent VALUES (18, '通知标题3', '通知内容3', '2018-02-03 12:19:41');


--
-- Data for Name: nation; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.nation VALUES (1, '汉族');
INSERT INTO vhr.nation VALUES (2, '蒙古族');
INSERT INTO vhr.nation VALUES (3, '回族');
INSERT INTO vhr.nation VALUES (4, '藏族');
INSERT INTO vhr.nation VALUES (5, '维吾尔族');
INSERT INTO vhr.nation VALUES (6, '苗族');
INSERT INTO vhr.nation VALUES (7, '彝族');
INSERT INTO vhr.nation VALUES (8, '壮族');
INSERT INTO vhr.nation VALUES (9, '布依族');
INSERT INTO vhr.nation VALUES (10, '朝鲜族');
INSERT INTO vhr.nation VALUES (11, '满族');
INSERT INTO vhr.nation VALUES (12, '侗族');
INSERT INTO vhr.nation VALUES (13, '瑶族');
INSERT INTO vhr.nation VALUES (14, '白族');
INSERT INTO vhr.nation VALUES (15, '土家族');
INSERT INTO vhr.nation VALUES (16, '哈尼族');
INSERT INTO vhr.nation VALUES (17, '哈萨克族');
INSERT INTO vhr.nation VALUES (18, '傣族');
INSERT INTO vhr.nation VALUES (19, '黎族');
INSERT INTO vhr.nation VALUES (20, '傈僳族');
INSERT INTO vhr.nation VALUES (21, '佤族');
INSERT INTO vhr.nation VALUES (22, '畲族');
INSERT INTO vhr.nation VALUES (23, '高山族');
INSERT INTO vhr.nation VALUES (24, '拉祜族');
INSERT INTO vhr.nation VALUES (25, '水族');
INSERT INTO vhr.nation VALUES (26, '东乡族');
INSERT INTO vhr.nation VALUES (27, '纳西族');
INSERT INTO vhr.nation VALUES (28, '景颇族');
INSERT INTO vhr.nation VALUES (29, '柯尔克孜族');
INSERT INTO vhr.nation VALUES (30, '土族');
INSERT INTO vhr.nation VALUES (31, '达斡尔族');
INSERT INTO vhr.nation VALUES (32, '仫佬族');
INSERT INTO vhr.nation VALUES (33, '羌族');
INSERT INTO vhr.nation VALUES (34, '布朗族');
INSERT INTO vhr.nation VALUES (35, '撒拉族');
INSERT INTO vhr.nation VALUES (36, '毛难族');
INSERT INTO vhr.nation VALUES (37, '仡佬族');
INSERT INTO vhr.nation VALUES (38, '锡伯族');
INSERT INTO vhr.nation VALUES (39, '阿昌族');
INSERT INTO vhr.nation VALUES (40, '普米族');
INSERT INTO vhr.nation VALUES (41, '塔吉克族');
INSERT INTO vhr.nation VALUES (42, '怒族');
INSERT INTO vhr.nation VALUES (43, '乌孜别克族');
INSERT INTO vhr.nation VALUES (44, '俄罗斯族');
INSERT INTO vhr.nation VALUES (45, '鄂温克族');
INSERT INTO vhr.nation VALUES (46, '崩龙族');
INSERT INTO vhr.nation VALUES (47, '保安族');
INSERT INTO vhr.nation VALUES (48, '裕固族');
INSERT INTO vhr.nation VALUES (49, '京族');
INSERT INTO vhr.nation VALUES (50, '塔塔尔族');
INSERT INTO vhr.nation VALUES (51, '独龙族');
INSERT INTO vhr.nation VALUES (52, '鄂伦春族');
INSERT INTO vhr.nation VALUES (53, '赫哲族');
INSERT INTO vhr.nation VALUES (54, '门巴族');
INSERT INTO vhr.nation VALUES (55, '珞巴族');
INSERT INTO vhr.nation VALUES (56, '基诺族');


--
-- Data for Name: oplog; Type: TABLE DATA; Schema: vhr; Owner: postgres
--



--
-- Data for Name: politicsstatus; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.politicsstatus VALUES (1, '中共党员');
INSERT INTO vhr.politicsstatus VALUES (2, '中共预备党员');
INSERT INTO vhr.politicsstatus VALUES (3, '共青团员');
INSERT INTO vhr.politicsstatus VALUES (4, '民革党员');
INSERT INTO vhr.politicsstatus VALUES (5, '民盟盟员');
INSERT INTO vhr.politicsstatus VALUES (6, '民建会员');
INSERT INTO vhr.politicsstatus VALUES (7, '民进会员');
INSERT INTO vhr.politicsstatus VALUES (8, '农工党党员');
INSERT INTO vhr.politicsstatus VALUES (9, '致公党党员');
INSERT INTO vhr.politicsstatus VALUES (10, '九三学社社员');
INSERT INTO vhr.politicsstatus VALUES (11, '台盟盟员');
INSERT INTO vhr.politicsstatus VALUES (12, '无党派民主人士');
INSERT INTO vhr.politicsstatus VALUES (13, '普通公民');


--
-- Data for Name: position; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr."position" VALUES (29, '技术总监', '2018-01-11 21:13:42', 1);
INSERT INTO vhr."position" VALUES (30, '运营总监', '2018-01-11 21:13:48', 1);
INSERT INTO vhr."position" VALUES (31, '市场总监', '2018-01-11 00:00:00', 1);
INSERT INTO vhr."position" VALUES (33, '研发工程师', '2018-01-14 00:00:00', 0);
INSERT INTO vhr."position" VALUES (34, '运维工程师', '2018-01-14 16:11:41', 1);
INSERT INTO vhr."position" VALUES (36, 'Java研发经理', '2019-10-01 00:00:00', 1);


--
-- Data for Name: role; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.role VALUES (1, 'ROLE_manager', '部门经理');
INSERT INTO vhr.role VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO vhr.role VALUES (3, 'ROLE_recruiter', '招聘主管');
INSERT INTO vhr.role VALUES (4, 'ROLE_train', '培训主管');
INSERT INTO vhr.role VALUES (5, 'ROLE_performance', '薪酬绩效主管');
INSERT INTO vhr.role VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO vhr.role VALUES (13, 'ROLE_test2', '测试角色2');
INSERT INTO vhr.role VALUES (14, 'ROLE_test1', '测试角色1');
INSERT INTO vhr.role VALUES (17, 'ROLE_test3', '测试角色3');
INSERT INTO vhr.role VALUES (18, 'ROLE_test4', '测试角色4');
INSERT INTO vhr.role VALUES (19, 'ROLE_test4', '测试角色4');
INSERT INTO vhr.role VALUES (20, 'ROLE_test5', '测试角色5');
INSERT INTO vhr.role VALUES (21, 'ROLE_test6', '测试角色6');


--
-- Data for Name: salary; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.salary VALUES (9, 9000, 4000, 800, 500, NULL, 2000, 0.07, '2018-01-24 00:00:00', 2000, 0.07, 2000, 0.07, '市场部工资账套');
INSERT INTO vhr.salary VALUES (10, 2000, 2000, 400, 1000, NULL, 2000, 0.07, '2018-01-01 00:00:00', 2000, 0.07, 2000, 0.07, '人事部工资账套');
INSERT INTO vhr.salary VALUES (13, 20000, 3000, 500, 500, NULL, 4000, 0.07, '2018-01-25 00:00:00', 4000, 0.07, 4000, 0.07, '运维部工资账套');


--
-- Data for Name: sysmsg; Type: TABLE DATA; Schema: vhr; Owner: postgres
--

INSERT INTO vhr.sysmsg VALUES (57, 14, 0, 3, 1);
INSERT INTO vhr.sysmsg VALUES (58, 14, 0, 5, 1);
INSERT INTO vhr.sysmsg VALUES (59, 14, 0, 10, 1);
INSERT INTO vhr.sysmsg VALUES (60, 14, 0, 11, 0);
INSERT INTO vhr.sysmsg VALUES (61, 14, 0, 12, 0);
INSERT INTO vhr.sysmsg VALUES (62, 15, 0, 3, 1);
INSERT INTO vhr.sysmsg VALUES (63, 15, 0, 5, 1);
INSERT INTO vhr.sysmsg VALUES (64, 15, 0, 10, 1);
INSERT INTO vhr.sysmsg VALUES (65, 15, 0, 11, 0);
INSERT INTO vhr.sysmsg VALUES (66, 15, 0, 12, 0);
INSERT INTO vhr.sysmsg VALUES (67, 16, 0, 3, 1);
INSERT INTO vhr.sysmsg VALUES (68, 16, 0, 5, 1);
INSERT INTO vhr.sysmsg VALUES (69, 16, 0, 10, 1);
INSERT INTO vhr.sysmsg VALUES (70, 16, 0, 11, 0);
INSERT INTO vhr.sysmsg VALUES (71, 16, 0, 12, 0);
INSERT INTO vhr.sysmsg VALUES (72, 17, 0, 3, 1);
INSERT INTO vhr.sysmsg VALUES (73, 17, 0, 5, 1);
INSERT INTO vhr.sysmsg VALUES (74, 17, 0, 10, 1);
INSERT INTO vhr.sysmsg VALUES (75, 17, 0, 11, 0);
INSERT INTO vhr.sysmsg VALUES (76, 17, 0, 12, 0);
INSERT INTO vhr.sysmsg VALUES (77, 18, 0, 3, 1);
INSERT INTO vhr.sysmsg VALUES (78, 18, 0, 5, 0);
INSERT INTO vhr.sysmsg VALUES (79, 18, 0, 10, 0);
INSERT INTO vhr.sysmsg VALUES (80, 18, 0, 11, 0);
INSERT INTO vhr.sysmsg VALUES (81, 18, 0, 12, 0);

--
-- Name: adjustsalary adjustsalary_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.adjustsalary
    ADD CONSTRAINT adjustsalary_id PRIMARY KEY (id);


--
-- Name: appraise appraise_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.appraise
    ADD CONSTRAINT appraise_id PRIMARY KEY (id);


--
-- Name: department department_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.department
    ADD CONSTRAINT department_id PRIMARY KEY (id);


--
-- Name: employee employee_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_id PRIMARY KEY (id);


--
-- Name: employeeec employeeec_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeeec
    ADD CONSTRAINT employeeec_id PRIMARY KEY (id);


--
-- Name: employeeremove employeeremove_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeeremove
    ADD CONSTRAINT employeeremove_id PRIMARY KEY (id);


--
-- Name: employeetrain employeetrain_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeetrain
    ADD CONSTRAINT employeetrain_id PRIMARY KEY (id);


--
-- Name: empsalary empsalary_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.empsalary
    ADD CONSTRAINT empsalary_id PRIMARY KEY (id);


--
-- Name: hr hr_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.hr
    ADD CONSTRAINT hr_id PRIMARY KEY (id);


--
-- Name: hr_role hr_role_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.hr_role
    ADD CONSTRAINT hr_role_id PRIMARY KEY (id);


--
-- Name: joblevel joblevel_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.joblevel
    ADD CONSTRAINT joblevel_id PRIMARY KEY (id);


--
-- Name: menu menu_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.menu
    ADD CONSTRAINT menu_id PRIMARY KEY (id);


--
-- Name: menu_role menu_role_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.menu_role
    ADD CONSTRAINT menu_role_id PRIMARY KEY (id);


--
-- Name: msgcontent msgcontent_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.msgcontent
    ADD CONSTRAINT msgcontent_id PRIMARY KEY (id);


--
-- Name: nation nation_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.nation
    ADD CONSTRAINT nation_id PRIMARY KEY (id);


--
-- Name: oplog oplog_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.oplog
    ADD CONSTRAINT oplog_id PRIMARY KEY (id);


--
-- Name: politicsstatus politicsstatus_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.politicsstatus
    ADD CONSTRAINT politicsstatus_id PRIMARY KEY (id);


--
-- Name: position position_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr."position"
    ADD CONSTRAINT position_id PRIMARY KEY (id);


--
-- Name: role role_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.role
    ADD CONSTRAINT role_id PRIMARY KEY (id);


--
-- Name: salary salary_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.salary
    ADD CONSTRAINT salary_id PRIMARY KEY (id);


--
-- Name: sysmsg sysmsg_id; Type: CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.sysmsg
    ADD CONSTRAINT sysmsg_id PRIMARY KEY (id);


--
-- Name: idx_department_id; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_department_id ON vhr.employee USING btree (department_id);


--
-- Name: idx_pos_id; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_pos_id ON vhr.employee USING btree (pos_id);


--
-- Name: jobId; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_job_level_id ON vhr.employee USING btree (job_level_id);


--
-- Name: nationId; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_nation_id ON vhr.employee USING btree (nation_id);

--
-- Name: politicId; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_politic_id ON vhr.employee USING btree (politic_id);

--
-- Name: workID; Type: INDEX; Schema: vhr; Owner: postgres
--

CREATE INDEX idx_work_id ON vhr.employee USING btree (work_id);


--
-- Name: adjustsalary adjustsalary_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.adjustsalary
    ADD CONSTRAINT adjustsalary_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: appraise appraise_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.appraise
    ADD CONSTRAINT appraise_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: employee employee_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_ibfk_1 FOREIGN KEY (department_id) REFERENCES vhr.department(id);


--
-- Name: employee employee_ibfk_2; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_ibfk_2 FOREIGN KEY (job_level_id) REFERENCES vhr.joblevel(id);


--
-- Name: employee employee_ibfk_3; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_ibfk_3 FOREIGN KEY (pos_id) REFERENCES vhr."position"(id);


--
-- Name: employee employee_ibfk_4; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_ibfk_4 FOREIGN KEY (nation_id) REFERENCES vhr.nation(id);


--
-- Name: employee employee_ibfk_5; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employee
    ADD CONSTRAINT employee_ibfk_5 FOREIGN KEY (politic_id) REFERENCES vhr.politicsstatus(id);


--
-- Name: employeeec employeeec_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeeec
    ADD CONSTRAINT employeeec_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: employeeremove employeeremove_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeeremove
    ADD CONSTRAINT employeeremove_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: employeetrain employeetrain_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.employeetrain
    ADD CONSTRAINT employeetrain_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: empsalary empsalary_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.empsalary
    ADD CONSTRAINT empsalary_ibfk_1 FOREIGN KEY (eid) REFERENCES vhr.employee(id);


--
-- Name: empsalary empsalary_ibfk_2; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.empsalary
    ADD CONSTRAINT empsalary_ibfk_2 FOREIGN KEY (sid) REFERENCES vhr.salary(id);


--
-- Name: hr_role hr_role_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.hr_role
    ADD CONSTRAINT hr_role_ibfk_1 FOREIGN KEY (hrid) REFERENCES vhr.hr(id);


--
-- Name: hr_role hr_role_ibfk_2; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.hr_role
    ADD CONSTRAINT hr_role_ibfk_2 FOREIGN KEY (rid) REFERENCES vhr.role(id);


--
-- Name: menu menu_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.menu
    ADD CONSTRAINT menu_ibfk_1 FOREIGN KEY (parent_id) REFERENCES vhr.menu(id);


--
-- Name: menu_role menu_role_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.menu_role
    ADD CONSTRAINT menu_role_ibfk_1 FOREIGN KEY (mid) REFERENCES vhr.menu(id);


--
-- Name: menu_role menu_role_ibfk_2; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.menu_role
    ADD CONSTRAINT menu_role_ibfk_2 FOREIGN KEY (rid) REFERENCES vhr.role(id);


--
-- Name: oplog oplog_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.oplog
    ADD CONSTRAINT oplog_ibfk_1 FOREIGN KEY (hrid) REFERENCES vhr.hr(id);


--
-- Name: sysmsg sysmsg_ibfk_1; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.sysmsg
    ADD CONSTRAINT sysmsg_ibfk_1 FOREIGN KEY (mid) REFERENCES vhr.msgcontent(id);


--
-- Name: sysmsg sysmsg_ibfk_2; Type: FK CONSTRAINT; Schema: vhr; Owner: postgres
--

ALTER TABLE ONLY vhr.sysmsg
    ADD CONSTRAINT sysmsg_ibfk_2 FOREIGN KEY (hrid) REFERENCES vhr.hr(id);
