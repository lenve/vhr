<template>
  <div>
    <el-container>
      <el-header style="text-align: left;padding-left: 0px">
        <el-button type="success" size="mini" plain icon="el-icon-success" @click="allRead">全部标为已读</el-button>
        <el-button type="primary" size="mini" plain v-if="isAdmin" @click="dialogVisible = true"><i
          class="fa fa-send"
          style="margin-right: 15px"></i>发送系统通知
        </el-button>
      </el-header>
      <el-main style="padding: 0px;">
        <el-collapse accordion style="width: 90%" @change="handleChange" v-model="mid">
          <el-collapse-item v-for="(msg,index) in sysmsgs" :key="index" :name="msg.msgContent.id">
            <template slot="title">
              <div style="display: flex;justify-content: flex-start;align-items: center;">
                <div style="display: flex;justify-content: center;align-items: center;width: 25px;height: 25px">
                  <div
                    style="width: 8px;height: 8px;background-color: #ea0206;border-radius: 8px;"
                    v-if="msg.state==0"></div>
                </div>
                <span style="width: 600px;text-align: left">{{msg.msgContent.title}}</span>
                <el-tag>{{msg.msgContent.createDate|formatDate}}</el-tag>
              </div>
            </template>
            <div
              style="display: flex;justify-content: flex-start;align-items: center;border-style: solid;border-width: 1px;border-color: #409eff;border-radius: 5px;padding: 4px 0px 4px 8px;box-sizing: border-box;height: 100%">
              {{msg.msgContent.message}}
            </div>
          </el-collapse-item>
        </el-collapse>
        <div style="color: #ea0206;font-size: 18px;text-align: center" v-if="sysmsgs.length==0">暂无通知</div>
      </el-main>
    </el-container>
    <div style="text-align: left">
      <el-dialog
        title="发送系统通知"
        v-loading="dialogLoading"
        :visible.sync="dialogVisible"
        :close-on-click-modal="false"
        width="45%">
        <el-row>
          <el-col :span="3">
            通知标题:
          </el-col>
          <el-col :span="21">
            <el-input v-model="title" size="mini" placeholder="请输入标题"></el-input>
          </el-col>
        </el-row>
        <el-row style="margin-top: 10px;">
          <el-col :span="3">
            通知内容:
          </el-col>
          <el-col :span="21">
            <el-input
              type="textarea"
              size="mini"
              :autosize="{ minRows: 5, maxRows: 10}"
              placeholder="请输入通知内容..."
              v-model="message"></el-input>
          </el-col>
        </el-row>
        <el-row style="margin-top: 10px;padding-right: 10px">
          <el-col :offset="18">
            <el-button type="default" size="mini" @click="cancelSend">取消
            </el-button>
            <el-button type="primary" size="mini" @click="sendNFMsg"><i
              class="fa fa-send"
              style="margin-right: 15px"></i>发送
            </el-button>
          </el-col>
        </el-row>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        dialogVisible: false,
        dialogLoading: false,
        title: '',
        message: '',
        mid: -1,
        sysmsgs: []
      }
    },
    mounted() {
      this.initSysMsgs();
    },
    computed: {
      isAdmin: function () {
        var roles = this.$store.state.user.roles;
        var isAdmin = false;
        roles.forEach(role=> {
          if (role.name == 'ROLE_admin') {
            isAdmin = true;
          }
        })
        return isAdmin;
      }
    },
    methods: {
      handleChange(newVal){
        if (newVal == '') {
          return;
        }
        var _this = this;
        this.putRequest("/chat/markread", {flag: this.mid}).then(resp=> {
          if (resp && resp.status == 200) {
            _this.initSysMsgs();
          }
        })
      },
      initSysMsgs(){
        var _this = this;
        this.getRequest("/chat/sysmsgs").then(resp=> {
          _this.sysmsgs = resp.data;
          var isDot = false;
          _this.sysmsgs.forEach(msg=> {
            if (msg.state == 0) {
              isDot = true;
            }
          })
          _this.$store.commit('toggleNFDot', isDot);
        })
      },
      allRead(){
        var _this = this;
        this.putRequest("/chat/markread", {flag: -1}).then(resp=> {
          if (resp && resp.status == 200) {
            _this.$store.commit('toggleNFDot', false);
            _this.initSysMsgs();
          }
        })
      },
      sendNFMsg(){
        this.dialogLoading = true;
        var _this = this;
        this.postRequest("/chat/nf", {message: this.message, title: this.title}).then(resp=> {
          _this.dialogLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            
            if (data.status == 'success') {
              _this.$store.state.stomp.send("/ws/nf", {}, '');
              _this.initSysMsgs();
              _this.cancelSend();
            }
          }
        })
      },
      cancelSend(){
        this.dialogVisible = false;
        this.title = '';
        this.message = '';
      }
    }
  }
</script>
