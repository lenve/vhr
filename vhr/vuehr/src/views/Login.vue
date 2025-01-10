<template>
  <el-form :rules="rules" class="loginContainer" :model="loginForm" ref="loginForm">
    <h3 class="loginTitle">系统登录</h3>
    <el-form-item prop="username">
      <el-input type="text" v-model="loginForm.username" auto-complete="off" placeholder="请输入用户名"></el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="请输入密码"></el-input>
    </el-form-item>
    <!-- 注释掉验证码相关的表单项
    <el-form-item prop="code">
      <el-input type="text" v-model="loginForm.code" auto-complete="off" placeholder="点击图片更换验证码" style="width: 250px"></el-input>
      <img :src="vcUrl" @click="updateVerifyCode" alt="" style="cursor: pointer">
    </el-form-item>
    -->
    <el-button type="primary" style="width: 100%;" @click="submitLogin">登录</el-button>
  </el-form>
</template>

<script>
export default {
  data() {
    return {
      loginForm: {
        username: '',
        password: ''
        // code: ''  // 注释掉验证码字段
      },
      // vcUrl: '/verifyCode',  // 注释掉验证码URL
      rules: {
        username: [{required: true, message: '请输入用户名', trigger: 'blur'}],
        password: [{required: true, message: '请输入密码', trigger: 'blur'}]
        // code: [{required: true, message: '请输入验证码', trigger: 'blur'}]  // 注释掉验证码校验规则
      }
    }
  },
  methods: {
    /* 注释掉验证码更新方法
    updateVerifyCode() {
      this.vcUrl = '/verifyCode?time=' + new Date();
    },
    */
    submitLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.postRequest('/doLogin', {
            username: this.loginForm.username,
            password: this.loginForm.password
            // code: this.loginForm.code  // 注释掉验证码参数
          }).then(resp => {
            // ... 保持原有的登录成功处理逻辑
          })
        } else {
          return false;
        }
      });
    }
  }
}
</script> 