<template>
  <div>
    <el-container>
      <el-header style="display: flex;justify-content: space-between;align-items: center;padding-left: 0px">
        <el-button @click="dialogVisible = true" icon="el-icon-plus" type="primary" size="mini">添加调薪</el-button>

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

        <el-button size="mini" type="success" @click="loadAdjustsalarysCfg" icon="el-icon-refresh"></el-button>
      </el-header>
      <el-main style="padding-left: 0px;padding-top: 0px">
        <div>
          <el-table
            :data="adjustsalarys"
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
              label="调薪日期">
              <template slot-scope="scope">{{ scope.row.asDate | formatDate}}</template>
            </el-table-column>
            <el-table-column
              width="200"
              prop="beforeSalary"
              label="调前薪资">
            </el-table-column>
            <el-table-column
            prop="afterSalary"
            label="调后薪资">
            </el-table-column>
            <el-table-column
              prop="reason"
              label="调薪原因">
            </el-table-column>
            <!--<el-table-column-->
            <!--label="奖罚类别">-->
            <!--<template slot-scope="scope">{{ scope.row.ecType | awardFilter}}</template>-->
            <!--</el-table-column>-->
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
        <!--<div style="text-align: left;margin-top: 10px" v-if="adjustsalarys!=0">-->
          <!--<el-button type="danger" round size="mini" :disabled="multipleSelection.length==0" @click="deleteAll">批量删除-->
          <!--</el-button>-->
        <!--</div>-->


        <div style="display: flex;justify-content: space-between;margin: 2px" v-if="adjustsalarys!=0">
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
      <el-form :model="adjustsalary" :rules="rules" ref="addEmpForm" style="margin: 0px;padding: 0px;">
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
                    <el-select v-model="adjustsalary.eid" style="width: 200px" size="mini" placeholder="请输入员工姓名">
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
                  <el-form-item label="调薪日期:" prop="ecDate">
                    <el-date-picker
                      v-model="adjustsalary.asDate"
                      value-format="yyyy-MM-dd HH:mm:ss"
                      size="mini"
                      style="width: 135px"
                      type="date"
                      placeholder="请输入培训日期">
                    </el-date-picker>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-form-item label="调薪原因:" prop="adjustsalaryContent">
                    <el-input prefix-icon="el-icon-edit" v-model="adjustsalary.reason" size="mini" style="width: 150px"
                              placeholder="请输入调薪原因"></el-input>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>
            <!--第二行-->
            <el-row>
              <!--<el-col :span="7">-->
              <!--<div>-->
              <!--<el-form-item label="奖罚类型:" prop="ecType">-->
              <!--<el-select v-model="award.ecType" style="width: 200px" size="mini" placeholder="请输入奖罚类型">-->
              <!--<el-option-->
              <!--v-for="item in awardType"-->
              <!--:key="item.id"-->
              <!--:label="item.dictName"-->
              <!--:value="item.dictValue">-->
              <!--</el-option>-->
              <!--</el-select>-->
              <!--</el-form-item>-->
              <!--</div>-->
              <!--</el-col>-->
              <el-col :span="6">
                <div>
                  <el-form-item label="调前薪资:" prop="ecPoint">
                    <el-input prefix-icon="el-icon-edit" v-model="adjustsalary.beforeSalary" size="mini" style="width: 150px"
                              placeholder="请输入调前薪资"></el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-form-item label="调后薪资:" prop="ecPoint">
                    <el-input prefix-icon="el-icon-edit" v-model="adjustsalary.afterSalary" size="mini" style="width: 150px"
                              placeholder="请输入调后薪资"></el-input>
                  </el-form-item>
                </div>
              </el-col>

              <el-col :span="6">
                <div>
                  <el-form-item label="备注:" prop="remark">
                    <el-input prefix-icon="el-icon-edit" v-model="adjustsalary.remark" size="mini" style="width: 150px"
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
        keywords:'',
        advanceSearchViewVisible: false,
        totalCount: -1,
        currentPage: 1,

        dialogVisible: false,
        dialogTitle: '新增培训',
        tableLoading: false,
        index: 0,
        adjustsalarys: [],
        emps:[],
        multipleSelection: [],
        adjustsalary: {
          id: '',
          eid: '',
          asDate: '',
          beforeSalary: '',
          afterSalary: '',
          reason: '',
          remark: '',
          name:''
        },
        rules: {
          eid: [{required: true, message: '必填:姓名', trigger: 'blur'}],
          asDate: [{required: true, message: '必填:调薪日期', trigger: 'blur'}],
          beforeSalary: [{required: true, message: '必填:调前薪资', trigger: 'blur'}],
          afterSalary: [{required: true, message: '必填:调后薪资', trigger: 'blur'}],
          reason: [{required: true, message: '必填:调薪原因', trigger: 'blur'}],
        }
      };
    },
    methods: {
      keywordsChange(val) {
        if (val == '') {
          this.loadAdjustsalarysCfg();
        }
      },
      searchEmp() {
        this.loadAdjustsalarysCfg();
      },

      currentChange(currentChange) {
        this.currentPage = currentChange;
        this.loadAdjustsalarysCfg();
      },
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
        this.adjustsalary = row;
      },
      handleDelete(index, row) {
        this.$confirm('删除[' + 1 + ']条记录, 是否继续?', '提示', {
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
        this.deleteRequest("/personnel/adjustsalary/" + id).then(resp=>{
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;

            _this.loadAdjustsalarysCfg();
          }
        });
      },
      loadAdjustsalarysCfg(){
        this.tableLoading = true;
        var _this = this;
        this.getRequest("/personnel/adjustsalary?keywords="+_this.keywords+"&page=" + this.currentPage).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            _this.adjustsalarys = resp.data.adjustsalaryList;
            _this.totalCount = resp.data.count;
          }
          var old = _this.adjustsalarys;
          old.forEach(item => {
            _this.emps.forEach(itemE => {
              if (item.eid == itemE.id) {
                item.name = itemE.name;
              }
            })
          })
          _this.adjustsalarys = old;
        })
      },
      emptyAdjustsalary(){
        this.adjustsalary = {
          id: '',
          eid: '',
          asDate: '',
          beforeSalary: '',
          afterSalary: '',
          reason: '',
          remark: '',
          name:''
        };
        this.index = 0;
      },
      cancelEidt() {
        this.dialogVisible = false;
        this.emptyAdjustsalary();
      },
      addEmp(formName) {
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if (this.adjustsalary.id) {
              //更新
              this.tableLoading = true;
              this.putRequest("/personnel/adjustsalary", this.adjustsalary).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;
                  _this.dialogVisible = false;
                  _this.emptyAdjustsalary();
                  _this.loadAdjustsalarysCfg();
                }
              })
            } else {
              //添加
              this.tableLoading = true;
              this.postRequest("/personnel/adjustsalary", this.adjustsalary).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;

                  _this.dialogVisible = false;
                  _this.emptyAdjustsalary();
                  _this.loadAdjustsalarysCfg();
                }
              })
            }
          } else {
            return false;
          }
        });
      },
      initData() {
        var _this = this;

        this.getRequest("/personnel/award/emps").then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.emps = data.emps;
          }
        }).then(() =>{
          _this.loadAdjustsalarysCfg();
        })
      }
    },
    mounted: function () {
      this.initData();
    }
  }
</script>
<style>
  .el-dialog__body {
    padding-bottom: 10px;
  }
</style>
