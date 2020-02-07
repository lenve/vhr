<template>
  <div>
    <el-container>
      <el-header style="display: flex;justify-content: space-between;align-items: center;padding-left: 0px">
        <el-button @click="dialogVisible = true" icon="el-icon-plus" type="primary" size="mini">添加奖惩</el-button>

        <div style="display: inline">
          <el-input
            placeholder="通过员工名搜索员工,记得回车哦..."
            clearable
            @change="keywordsChange"
            style="width: 300px;margin: 0px;padding: 0px;"
            size="mini"
            :disabled="advanceSearchViewVisible"
            @keyup.enter.native="searchEmp"
            prefix-icon="el-icon-search"
            v-model="keywords">
          </el-input>
          <el-button type="primary" size="mini" style="margin-left: 5px" icon="el-icon-search" @click="searchEmp">搜索
          </el-button>

        </div>

        <div style="margin-left: 5px;margin-right: 20px;display: inline">
          <el-upload
            :show-file-list="false"
            accept="application/vnd.ms-excel"
            action="/personnel/award/importAward"
            :on-success="fileUploadSuccess"
            :on-error="fileUploadError" :disabled="fileUploadBtnText=='正在导入'"
            :before-upload="beforeFileUpload" style="display: inline">
            <el-button size="mini" type="success" :loading="fileUploadBtnText=='正在导入'"><i class="fa fa-lg fa-level-up"
                                                                                          style="margin-right: 5px"></i>{{fileUploadBtnText}}
            </el-button>
          </el-upload>
          <el-button type="success" size="mini" @click="exportEmps"><i class="fa fa-lg fa-level-down"
                                                                       style="margin-right: 5px"></i>导出数据
          </el-button>

        </div>

        <el-button size="mini" type="success" @click="loadAwardsCfg" icon="el-icon-refresh"></el-button>
      </el-header>
      <el-main style="padding-left: 0px;padding-top: 0px">
        <div>
          <el-table
            :data="awards"
            stripe
            v-loading="tableLoading"
            size="mini"
            @selection-change="handleSelectionChange"
            style="width: 100%">
            <el-table-column
              type="selection"
              width="30">
            </el-table-column>
            <el-table-column
              prop="name"
              label="员工姓名">
            </el-table-column>
            <el-table-column
              label="奖罚日期">
              <template slot-scope="scope">{{ scope.row.ecDate | formatDate}}</template>
            </el-table-column>
            <el-table-column
              width="200"
              prop="ecReason"
              label="奖罚原因">
            </el-table-column>
            <el-table-column
              prop="ecPoint"
              label="奖罚分">
            </el-table-column>
            <el-table-column
              label="奖罚类别">
              <template slot-scope="scope">{{ scope.row.ecType | awardFilter}}</template>
            </el-table-column>
            <el-table-column
              prop="remark"
              label="备注">
            </el-table-column>


            <el-table-column label="操作" align="center">
              <el-table-column label="编辑" align="center">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    @click="handleEdit(scope.$index, scope.row)">编辑
                  </el-button>
                </template>
              </el-table-column>
              <el-table-column label="删除" align="center">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.$index, scope.row)">删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table-column>
          </el-table>
        </div>
        <!--分页 start   style="text-align: left;margin-top: 10px"-->
        <div style="display: flex;justify-content: space-between;margin: 2px" v-if="awards!=0">
          <el-button type="danger" round size="mini" :disabled="multipleSelection.length==0" @click="deleteAll">批量删除
          </el-button>
          <el-pagination
            background
            :page-size="10"
            :current-page="currentPage"
            @current-change="currentChange"
            layout="prev, pager, next"
            :total="totalCount">
          </el-pagination>
        </div>
      </el-main>
    </el-container>
    <div style="text-align: left">
      <el-form :model="award" :rules="rules" ref="addEmpForm" style="margin: 0px;padding: 0px;">
        <div style="text-align: left">
          <el-dialog
            :title="dialogTitle"
            style="padding: 0px;"
            :close-on-click-modal="false"
            :visible.sync="dialogVisible"
            width="77%">
            <!--第一行-->
            <el-row>
              <el-col :span="7">

                <div>
                  <el-form-item label="姓名:" prop="eid">
                    <el-select v-model="award.eid" style="width: 200px" size="mini" placeholder="请输入员工姓名">
                      <el-option
                        v-for="item in emps"
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                      </el-option>
                    </el-select>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-form-item label="奖罚日期:" prop="ecDate">
                    <el-date-picker
                      v-model="award.ecDate"
                      value-format="yyyy-MM-dd HH:mm:ss"
                      size="mini"
                      style="width: 135px"
                      type="date"
                      placeholder="请输入奖罚日期">
                    </el-date-picker>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-form-item label="奖罚原因:" prop="ecReason">
                    <el-input prefix-icon="el-icon-edit" v-model="award.ecReason" size="mini" style="width: 150px"
                              placeholder="请输入奖罚原因"></el-input>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>
            <!--第二行-->
            <el-row>
              <el-col :span="7">
                <div>
                  <el-form-item label="奖罚类型:" prop="ecType">
                    <el-select v-model="award.ecType" style="width: 200px" size="mini" placeholder="请输入奖罚类型">
                      <el-option
                        v-for="item in awardType"
                        :key="item.id"
                        :label="item.dictName"
                        :value="item.dictValue">
                      </el-option>
                    </el-select>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-form-item label="奖罚分:" prop="ecPoint">
                    <el-input prefix-icon="el-icon-edit" v-model="award.ecPoint" size="mini" style="width: 150px"
                              placeholder="请输入奖罚分"></el-input>
                  </el-form-item>
                </div>
              </el-col>

              <el-col :span="6">
                <div>
                  <el-form-item label="备注:" prop="remark">
                    <el-input prefix-icon="el-icon-edit" v-model="award.remark" size="mini" style="width: 150px"
                              placeholder="请输入备注"></el-input>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>


            <span slot="footer" class="dialog-footer">
    <el-button size="mini" @click="cancelEidt">取 消</el-button>
    <el-button size="mini" type="primary" @click="addEmp('addEmpForm')">确 定</el-button>
  </span>
          </el-dialog>
        </div>
      </el-form>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        fileUploadBtnText: '导入数据',
        dialogVisible: false,
        dialogTitle: '新增惩罚',
        tableLoading: false,
        index: 0,
        awards: [],
        emps:[],
        jobs:[],
        keywords:'',
        advanceSearchViewVisible: false,
        multipleSelection: [],
        award: {
          id: '',
          eid: '',
          ecDate: '',
          ecReason: '',
          ecPoint: '',
          ecType: '',
          remark: '',
          name:''
        },
        awardType:[],
        rules: {
          eid: [{required: true, message: '必填:姓名', trigger: 'blur'}],
          ecDate: [{required: true, message: '必填:日期', trigger: 'blur'}],
          ecPoint: [{required: true, message: '必填:分数', trigger: 'blur'}],
          ecType: [{required: true, message: '必填:类型', trigger: 'blur'}],
          ecReason: [{required: true, message: '必填:原因', trigger: 'blur'}],
        },
        totalCount: -1,
        currentPage: 1,
      };
    },
    methods: {
      deleteAll(){
        this.$confirm('删除[' + this.multipleSelection.length + ']条记录, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = '';
          this.multipleSelection.forEach(row=> {
            ids = ids + row.id + ",";
          })
          this.doDelete(ids);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleEdit(index, row) {
        this.dialogVisible = true;
        this.award = row;
      },
      handleDelete(index, row) {
        this.$confirm('删除[' + 1 + ']条奖惩数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.doDelete(row.id);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      doDelete(id){
        var _this = this;
        _this.tableLoading = true;
        this.deleteRequest("/personnel/award/ec/" + id).then(resp=>{
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;

            _this.loadAwardsCfg();
          }
        });
      },
      loadAwardsCfg(){
        this.tableLoading = true;
        var _this = this;
        this.getRequest("/personnel/award/ec?keywords="+_this.keywords+"&page=" + this.currentPage).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            _this.awards = resp.data.awardsList;
            _this.totalCount = resp.data.count;
          }
          var old = _this.awards;
          old.forEach(item => {
            _this.emps.forEach(itemE => {
              if (item.eid == itemE.id) {
                item.name = itemE.name;
              }
            })
          })
          _this.awards = old;
        })
        //   .then(()=>{
        //   var old = _this.awards;
        //   old.forEach(item => {
        //     _this.emps.forEach(itemE => {
        //       if (item.eid == itemE.id) {
        //         item.name = itemE.name;
        //       }
        //     })
        //   })
        //   _this.awards = old;
        //   console.log(old);
        // })
      },
      emptySalary(){
        this.award = {
          id: '',
          eid: '',
          ecDate: '',
          ecReason: '',
          ecPoint: '',
          ecType: '',
          remark: '',
          name:''
        };
        this.index = 0;
      },
      cancelEidt() {
        this.dialogVisible = false;
        this.emptySalary();
      },
      addEmp(formName) {
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if (this.award.id) {
              //更新
              this.tableLoading = true;
              this.putRequest("/personnel/award/ec", this.award).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;
                  _this.dialogVisible = false;
                  _this.emptySalary();
                  _this.loadAwardsCfg();
                }
              })
            } else {
              //添加
              this.tableLoading = true;
              this.postRequest("/personnel/award/ec", this.award).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;

                  _this.dialogVisible = false;
                  _this.emptySalary();
                  _this.loadAwardsCfg();
                }
              })
            }
          } else {
            return false;
          }
        });
      },
      keywordsChange(val) {
        if (val == '') {
          this.loadAwardsCfg();
        }
      },
      searchEmp() {
        this.loadAwardsCfg();
      },
      fileUploadSuccess(response, file, fileList) {
        if (response) {
          this.$message({type: response.status, message: response.msg});
        }
        this.loadAwardsCfg();
        this.fileUploadBtnText = '导入数据';
      },
      fileUploadError(err, file, fileList) {
        this.$message({type: 'error', message: "导入失败!"});
        this.fileUploadBtnText = '导入数据';
      },
      beforeFileUpload(file) {
        this.fileUploadBtnText = '正在导入';
      },
      exportEmps() {
        window.open("/personnel/award/exportAward", "_parent");
      },
      currentChange(currentChange) {
        this.currentPage = currentChange;
        this.loadAwardsCfg();
      },
      initData() {
        var _this = this;
        var joinList = [];
        var list = JSON.parse(window.localStorage.getItem("dict"));
        list.forEach(row => {
          if (row.desc == "奖罚类型") {

            joinList.push(row);
          }
        })
        this.awardType = joinList;

        this.getRequest("/personnel/award/emps").then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.emps = data.emps;
          }
        }).then(() =>{
          _this.loadAwardsCfg();
        })
      }
    },
    mounted: function () {
      this.initData();
      // this.loadAwardsCfg();

      // var _this = this;
      // setTimeout(function () {
      //   console.log(_this.awards);
      //
      // },2000);


    },
    filters: {
      awardFilter: function (dataValue) {
        var descToDict = JSON.parse(window.localStorage.getItem("dict"));
        for (var i = 0;descToDict.length; i++){
          if (descToDict[i].desc == "奖罚类型" && descToDict[i].dictValue == dataValue) {
            return descToDict[i].dictName;
          }
        }
      }
    }
  }
</script>
<style>
  .el-dialog__body {
    padding-bottom: 10px;
  }
</style>
