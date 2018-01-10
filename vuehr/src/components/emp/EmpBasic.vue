<template>
  <div>
    <el-container>
      <el-header style="padding: 0px;display:flex;justify-content:flex-start;align-items: center">
          <el-input
            placeholder="输入员工名搜索员工..."
            style="width: 300px;margin: 0px;padding: 0px;"
            size="mini"
            prefix-icon="el-icon-search"
            v-model="keywords">
          </el-input>
        <el-button type="primary" size="mini" style="margin-left: 5px" icon="el-icon-search">搜索</el-button>
        <el-button type="primary" size="mini" style="margin-left: 5px" icon="el-icon-plus">添加员工</el-button>
      </el-header>
      <el-main>Main</el-main>
    </el-container>
  </div>
</template>
<style>

</style>
