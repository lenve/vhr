package org.sang.example;

import java.util.ArrayList;
import java.util.List;

public class HrDictExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public HrDictExample() {
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

        public Criteria andDescIsNull() {
            addCriterion("`desc` is null");
            return (Criteria) this;
        }

        public Criteria andDescIsNotNull() {
            addCriterion("`desc` is not null");
            return (Criteria) this;
        }

        public Criteria andDescEqualTo(String value) {
            addCriterion("`desc` =", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotEqualTo(String value) {
            addCriterion("`desc` <>", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescGreaterThan(String value) {
            addCriterion("`desc` >", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescGreaterThanOrEqualTo(String value) {
            addCriterion("`desc` >=", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLessThan(String value) {
            addCriterion("`desc` <", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLessThanOrEqualTo(String value) {
            addCriterion("`desc` <=", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLike(String value) {
            addCriterion("`desc` like", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotLike(String value) {
            addCriterion("`desc` not like", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescIn(List<String> values) {
            addCriterion("`desc` in", values, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotIn(List<String> values) {
            addCriterion("`desc` not in", values, "desc");
            return (Criteria) this;
        }

        public Criteria andDescBetween(String value1, String value2) {
            addCriterion("`desc` between", value1, value2, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotBetween(String value1, String value2) {
            addCriterion("`desc` not between", value1, value2, "desc");
            return (Criteria) this;
        }

        public Criteria andDictNameIsNull() {
            addCriterion("dictName is null");
            return (Criteria) this;
        }

        public Criteria andDictNameIsNotNull() {
            addCriterion("dictName is not null");
            return (Criteria) this;
        }

        public Criteria andDictNameEqualTo(String value) {
            addCriterion("dictName =", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameNotEqualTo(String value) {
            addCriterion("dictName <>", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameGreaterThan(String value) {
            addCriterion("dictName >", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameGreaterThanOrEqualTo(String value) {
            addCriterion("dictName >=", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameLessThan(String value) {
            addCriterion("dictName <", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameLessThanOrEqualTo(String value) {
            addCriterion("dictName <=", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameLike(String value) {
            addCriterion("dictName like", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameNotLike(String value) {
            addCriterion("dictName not like", value, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameIn(List<String> values) {
            addCriterion("dictName in", values, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameNotIn(List<String> values) {
            addCriterion("dictName not in", values, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameBetween(String value1, String value2) {
            addCriterion("dictName between", value1, value2, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictNameNotBetween(String value1, String value2) {
            addCriterion("dictName not between", value1, value2, "dictName");
            return (Criteria) this;
        }

        public Criteria andDictValueIsNull() {
            addCriterion("dictValue is null");
            return (Criteria) this;
        }

        public Criteria andDictValueIsNotNull() {
            addCriterion("dictValue is not null");
            return (Criteria) this;
        }

        public Criteria andDictValueEqualTo(Integer value) {
            addCriterion("dictValue =", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotEqualTo(Integer value) {
            addCriterion("dictValue <>", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueGreaterThan(Integer value) {
            addCriterion("dictValue >", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueGreaterThanOrEqualTo(Integer value) {
            addCriterion("dictValue >=", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueLessThan(Integer value) {
            addCriterion("dictValue <", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueLessThanOrEqualTo(Integer value) {
            addCriterion("dictValue <=", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueIn(List<Integer> values) {
            addCriterion("dictValue in", values, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotIn(List<Integer> values) {
            addCriterion("dictValue not in", values, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueBetween(Integer value1, Integer value2) {
            addCriterion("dictValue between", value1, value2, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotBetween(Integer value1, Integer value2) {
            addCriterion("dictValue not between", value1, value2, "dictValue");
            return (Criteria) this;
        }

        public Criteria andIsfixedIsNull() {
            addCriterion("isfixed is null");
            return (Criteria) this;
        }

        public Criteria andIsfixedIsNotNull() {
            addCriterion("isfixed is not null");
            return (Criteria) this;
        }

        public Criteria andIsfixedEqualTo(Integer value) {
            addCriterion("isfixed =", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedNotEqualTo(Integer value) {
            addCriterion("isfixed <>", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedGreaterThan(Integer value) {
            addCriterion("isfixed >", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedGreaterThanOrEqualTo(Integer value) {
            addCriterion("isfixed >=", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedLessThan(Integer value) {
            addCriterion("isfixed <", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedLessThanOrEqualTo(Integer value) {
            addCriterion("isfixed <=", value, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedIn(List<Integer> values) {
            addCriterion("isfixed in", values, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedNotIn(List<Integer> values) {
            addCriterion("isfixed not in", values, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedBetween(Integer value1, Integer value2) {
            addCriterion("isfixed between", value1, value2, "isfixed");
            return (Criteria) this;
        }

        public Criteria andIsfixedNotBetween(Integer value1, Integer value2) {
            addCriterion("isfixed not between", value1, value2, "isfixed");
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