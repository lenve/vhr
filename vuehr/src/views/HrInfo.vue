<template>
    <div>
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
                    <el-button type="primary">修改信息</el-button>
                    <el-button type="danger">修改密码</el-button>
                </div>
            </div>
        </el-card>
    </div>
</template>

<script>
    export default {
        name: "HrInfo",
        data() {
            return {
                hr: null,
                dialogVisible: false
            }
        },
        mounted() {
            this.initHr();
        },
        methods: {
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