<template>
    <div v-if="hr">
        <el-card class="box-card" style="width: 400px">
            <div slot="header" class="clearfix">
                <span>{{hr.name}}</span>
            </div>
            <div>
                <div style="display: flex;justify-content: center">
                    <img title="点击修改用户图像" :src="hr.userface" style="width: 100px;height: 100px;border-radius: 50px"
                         alt="">
                </div>
                <div>电话号码：
                    <el-tag>{{hr.telephone}}</el-tag>
                </div>
                <div>手机号码：
                    <el-tag>{{hr.phone}}</el-tag>
                </div>
                <div>居住地址：
                    <el-tag>{{hr.address}}</el-tag>
                </div>
                <div>用户标签：
                    <el-tag type="success" style="margin-right: 5px" v-for="(r,index) in hr.roles" :key="index">
                        {{r.nameZh}}
                    </el-tag>
                </div>
                <div style="display: flex;justify-content: space-around;margin-top: 10px">
                    <el-button type="primary" @click="showUpdateHrInfoView">修改信息</el-button>
                    <el-button type="danger">修改密码</el-button>
                </div>
            </div>
        </el-card>
        <el-dialog
                title="修改用户信息"
                :visible.sync="dialogVisible"
                width="30%">
            <div>
                <table>
                    <tr>
                        <td><el-tag>用户姓名：</el-tag></td>
                        <td><el-input v-model="hr2.name"></el-input></td>
                    </tr>
                    <tr>
                        <td><el-tag>电话号码：</el-tag></td>
                        <td><el-input v-model="hr2.telephone"></el-input></td>
                    </tr>
                    <tr>
                        <td><el-tag>手机号码：</el-tag></td>
                        <td><el-input v-model="hr2.phone"></el-input></td>
                    </tr>
                    <tr>
                        <td><el-tag>用户地址：</el-tag></td>
                        <td><el-input v-model="hr2.address"></el-input></td>
                    </tr>
                </table>
            </div>
            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="updateHrInfo">确 定</el-button>
  </span>
        </el-dialog>
    </div>
</template>

<script>
    export default {
        name: "HrInfo",
        data() {
            return {
                hr: null,
                hr2: null,
                dialogVisible:false
            }
        },
        mounted() {
            this.initHr();
        },
        methods: {
            updateHrInfo() {
                this.putRequest("/hr/info",this.hr2).then(resp=>{
                    if (resp) {
                        this.getRequest("/logout");
                        window.sessionStorage.removeItem("user")
                        this.$store.commit('initRoutes', []);
                        this.$router.replace("/");
                    }
                })
            },
            showUpdateHrInfoView() {
                this.dialogVisible = true;
            },
            initHr() {
                this.getRequest('/hr/info').then(resp => {
                    if (resp) {
                        this.hr = resp;
                        this.hr2 = Object.assign({}, this.hr);
                    }
                })
            }
        }
    }
</script>

<style scoped>

</style>