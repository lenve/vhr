package org.sang.example;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class EmployeeecExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EmployeeecExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andEidIsNull() {
            addCriterion("eid is null");
            return (Criteria) this;
        }

        public Criteria andEidIsNotNull() {
            addCriterion("eid is not null");
            return (Criteria) this;
        }

        public Criteria andEidEqualTo(Integer value) {
            addCriterion("eid =", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidNotEqualTo(Integer value) {
            addCriterion("eid <>", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidGreaterThan(Integer value) {
            addCriterion("eid >", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidGreaterThanOrEqualTo(Integer value) {
            addCriterion("eid >=", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidLessThan(Integer value) {
            addCriterion("eid <", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidLessThanOrEqualTo(Integer value) {
            addCriterion("eid <=", value, "eid");
            return (Criteria) this;
        }

        public Criteria andEidIn(List<Integer> values) {
            addCriterion("eid in", values, "eid");
            return (Criteria) this;
        }

        public Criteria andEidNotIn(List<Integer> values) {
            addCriterion("eid not in", values, "eid");
            return (Criteria) this;
        }

        public Criteria andEidBetween(Integer value1, Integer value2) {
            addCriterion("eid between", value1, value2, "eid");
            return (Criteria) this;
        }

        public Criteria andEidNotBetween(Integer value1, Integer value2) {
            addCriterion("eid not between", value1, value2, "eid");
            return (Criteria) this;
        }

        public Criteria andEcDateIsNull() {
            addCriterion("ecDate is null");
            return (Criteria) this;
        }

        public Criteria andEcDateIsNotNull() {
            addCriterion("ecDate is not null");
            return (Criteria) this;
        }

        public Criteria andEcDateEqualTo(Date value) {
            addCriterionForJDBCDate("ecDate =", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("ecDate <>", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateGreaterThan(Date value) {
            addCriterionForJDBCDate("ecDate >", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("ecDate >=", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateLessThan(Date value) {
            addCriterionForJDBCDate("ecDate <", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("ecDate <=", value, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateIn(List<Date> values) {
            addCriterionForJDBCDate("ecDate in", values, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("ecDate not in", values, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("ecDate between", value1, value2, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("ecDate not between", value1, value2, "ecDate");
            return (Criteria) this;
        }

        public Criteria andEcReasonIsNull() {
            addCriterion("ecReason is null");
            return (Criteria) this;
        }

        public Criteria andEcReasonIsNotNull() {
            addCriterion("ecReason is not null");
            return (Criteria) this;
        }

        public Criteria andEcReasonEqualTo(String value) {
            addCriterion("ecReason =", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonNotEqualTo(String value) {
            addCriterion("ecReason <>", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonGreaterThan(String value) {
            addCriterion("ecReason >", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonGreaterThanOrEqualTo(String value) {
            addCriterion("ecReason >=", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonLessThan(String value) {
            addCriterion("ecReason <", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonLessThanOrEqualTo(String value) {
            addCriterion("ecReason <=", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonLike(String value) {
            addCriterion("ecReason like", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonNotLike(String value) {
            addCriterion("ecReason not like", value, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonIn(List<String> values) {
            addCriterion("ecReason in", values, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonNotIn(List<String> values) {
            addCriterion("ecReason not in", values, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonBetween(String value1, String value2) {
            addCriterion("ecReason between", value1, value2, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcReasonNotBetween(String value1, String value2) {
            addCriterion("ecReason not between", value1, value2, "ecReason");
            return (Criteria) this;
        }

        public Criteria andEcPointIsNull() {
            addCriterion("ecPoint is null");
            return (Criteria) this;
        }

        public Criteria andEcPointIsNotNull() {
            addCriterion("ecPoint is not null");
            return (Criteria) this;
        }

        public Criteria andEcPointEqualTo(Integer value) {
            addCriterion("ecPoint =", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointNotEqualTo(Integer value) {
            addCriterion("ecPoint <>", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointGreaterThan(Integer value) {
            addCriterion("ecPoint >", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointGreaterThanOrEqualTo(Integer value) {
            addCriterion("ecPoint >=", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointLessThan(Integer value) {
            addCriterion("ecPoint <", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointLessThanOrEqualTo(Integer value) {
            addCriterion("ecPoint <=", value, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointIn(List<Integer> values) {
            addCriterion("ecPoint in", values, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointNotIn(List<Integer> values) {
            addCriterion("ecPoint not in", values, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointBetween(Integer value1, Integer value2) {
            addCriterion("ecPoint between", value1, value2, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcPointNotBetween(Integer value1, Integer value2) {
            addCriterion("ecPoint not between", value1, value2, "ecPoint");
            return (Criteria) this;
        }

        public Criteria andEcTypeIsNull() {
            addCriterion("ecType is null");
            return (Criteria) this;
        }

        public Criteria andEcTypeIsNotNull() {
            addCriterion("ecType is not null");
            return (Criteria) this;
        }

        public Criteria andEcTypeEqualTo(Integer value) {
            addCriterion("ecType =", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeNotEqualTo(Integer value) {
            addCriterion("ecType <>", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeGreaterThan(Integer value) {
            addCriterion("ecType >", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("ecType >=", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeLessThan(Integer value) {
            addCriterion("ecType <", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeLessThanOrEqualTo(Integer value) {
            addCriterion("ecType <=", value, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeIn(List<Integer> values) {
            addCriterion("ecType in", values, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeNotIn(List<Integer> values) {
            addCriterion("ecType not in", values, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeBetween(Integer value1, Integer value2) {
            addCriterion("ecType between", value1, value2, "ecType");
            return (Criteria) this;
        }

        public Criteria andEcTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("ecType not between", value1, value2, "ecType");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}