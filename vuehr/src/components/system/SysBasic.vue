<template>
  <div style="margin-top: 10px">
    <el-tabs v-model="defaultTab" type="card">
      <el-tab-pane label="部门管理" name="depMana">部门管理</el-tab-pane>
      <el-tab-pane label="职位管理" name="positionMana">职位管理</el-tab-pane>
      <el-tab-pane label="职称管理" name="jobTitleMana">职称管理</el-tab-pane>
      <el-tab-pane label="奖惩规则" name="ecCfg">奖惩规则</el-tab-pane>
      <el-tab-pane label="权限组" name="menuRole">
        <menu-role></menu-role>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
  import MenuRole from './MenuRole.vue'
  export default {
    data() {
      return {
        defaultTab: 'depMana'
      };
    },
    methods: {

    },
    components: {
      'menu-role': MenuRole
    }
  };
</script>
