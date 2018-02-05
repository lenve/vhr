<template>
  <div>
    <el-container>
      <el-aside width="160px">
        <div class="friendListDiv" v-for="(hr,index) in hrs" :key="hr.id" @click="toggleFriend(hr)"
             v-bind:class="{currentChatFriend:currentFriend.id==hr.id}">
          <img :src="hr.userface" class="userfaceImg"/>
          <el-badge :is-dot="isDotMap.get('isDot#'+currentUser.username+'#'+hr.username)!=null">{{hr.name}}</el-badge>
        </div>
        <div style="background-color: #20a0ff;height: 1px;width: 160px;"/>
      </el-aside>
      <el-main style="padding-top: 0px;padding-bottom: 0px">
        <div class="chatDiv" ref="chatDiv" id="chatDiv">
          <p v-show="currentFriend.name">与
            <el-tag type="primary" size="small" style="margin-left: 5px;margin-right: 5px">{{currentFriend.name}}
            </el-tag>
            聊天中
          </p>
          <template v-for="msg in msgList">
            <!--发送来的消息-->
            <div
              style="display: flex;justify-content: flex-start;align-items: center;box-sizing: border-box;"
              v-if="msg.from==currentFriend.username">
              <img :src="currentFriend.userface" class="userfaceImg">
              <div
                style="display: inline-flex;border-style: solid;border-width: 1px;border-color: #20a0ff;border-radius: 5px;padding: 5px 8px 5px 8px">
                {{msg.msg}}
              </div>
            </div>
            <!--发出去的消息-->
            <div v-if="msg.from!=currentFriend.username"
                 style="display: flex;justify-content: flex-end;align-items: center;box-sizing: border-box;">
              <div
                style="display: inline-flex;border-style: solid;border-width: 1px;border-color: #20a0ff;border-radius: 5px;padding: 5px 8px 5px 8px;margin-right: 3px;background-color: #9eea6a">
                {{msg.msg}}
              </div>
              <img :src="currentUser.userface" class="userfaceImg">
            </div>
          </template>
        </div>
        <div style="text-align: left;margin-top: 10px">
          <el-input v-model="msg" placeholder="请输入内容" size="mini" style="width: 600px;" type="textarea"
                    autosize></el-input>
          <el-button :disabled="!currentFriend.id" size="small" type="primary" class="sendBtn" @click="sendMsg"><i
            class="fa fa-send"
            style="margin-right: 15px"></i>发送
          </el-button>
        </div>
      </el-main>
    </el-container>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        hrs: [],
        msg: '',
        currentUser: this.$store.state.user,
        currentFriend: {}
      }
    },
    computed: {
      msgList: {
        get: function () {
          return this.$store.state.msgList
        }
      },
      isDotMap: {
        get: function () {
          return this.$store.state.isDotMap
        }
      }
    },
    watch: {
      msgList(){
        document.getElementById('chatDiv').scrollTop = document.getElementById('chatDiv').scrollHeight;
      }
    },
    methods: {
      sendMsg(){
        var oldMsg = window.localStorage.getItem(this.$store.state.user.username + "#" + this.currentFriend.username);
        if (oldMsg == null) {
          oldMsg = [];
          oldMsg.push({msg: this.msg, from: this.$store.state.user.username});
          window.localStorage.setItem(this.$store.state.user.username + "#" + this.currentFriend.username, JSON.stringify(oldMsg))
        } else {
          var oldMsgJson = JSON.parse(oldMsg);
          oldMsgJson.push({msg: this.msg, from: this.$store.state.user.username});
          window.localStorage.setItem(this.$store.state.user.username + "#" + this.currentFriend.username, JSON.stringify(oldMsgJson))
        }
        this.$store.state.stomp.send("/ws/chat", {}, this.msg + ";" + this.currentFriend.username);
        this.msg = '';
        this.updateChatDiv();
      },
      updateChatDiv(){
        var oldMsg = window.localStorage.getItem(this.currentUser.username + "#" + this.currentFriend.username);
        if (oldMsg == null) {
          this.$store.commit('updateMsgList', [])
        } else {
          this.$store.commit('updateMsgList', JSON.parse(oldMsg))
        }
      },
      toggleFriend(hr){
        //切换数据
        if (hr == this.currentFriend) {
          return;
        }
        this.currentFriend = hr;
        this.$store.commit('updateCurrentFriend', hr);
        this.updateChatDiv();
        this.$store.commit("removeValueDotMap", "isDot#" + this.currentUser.username + "#" + hr.username);
        document.getElementById('chatDiv').scrollTop = document.getElementById('chatDiv').scrollHeight;
      },
      loadHrs(){
        var _this = this;
        this.getRequest("/chat/hrs").then(resp=> {
          _this.hrs = resp.data;
        })
      }
    },
    mounted: function () {
      this.loadHrs();
    }
  }
</script>
<style>
  .userfaceImg {
    width: 37px;
    height: 37px;
    border-radius: 30px;
    margin-right: 10px;
  }

  .friendListDiv {
    display: flex;
    justify-content: flex-start;
    padding-left: 20px;
    box-sizing: border-box;
    align-items: center;
    width: 160px;
    height: 40px;
    border-color: #20a0ff;
    border-left-style: solid;
    border-top-style: solid;
    border-right-style: solid;
    border-width: 1px;
    cursor: pointer
  }

  .chatDiv {
    border-color: #20a0ff;
    border-style: solid;
    border-radius: 5px;
    border-width: 1px;
    box-sizing: border-box;
    width: 700px;
    height: 450px;
    overflow-y: auto;
    padding-bottom: 50px;
  }

  .sendBtn {
    padding-left: 25px;
    padding-right: 25px
  }

  .currentChatFriend {
    background-color: #dcdfe6;
  }
</style>
