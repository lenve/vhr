<template>
  <div>
    <el-container>
      <el-header style="display: flex;justify-content: space-between;align-items: center;padding-left: 0px">
        <el-button @click="dialogVisible = true" icon="el-icon-plus" type="primary" size="mini">添加培训</el-button>

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

        <el-button size="mini" type="success" @click="loadTrainsCfg" icon="el-icon-refresh"></el-button>
      </el-header>
      <el-main style="padding-left: 0px;padding-top: 0px">
        <div>
          <el-table
            :data="trains"
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
              label="培训日期">
              <template slot-scope="scope">{{ scope.row.trainDate | formatDate}}</template>
            </el-table-column>
            <el-table-column
              width="200"
              prop="trainContent"
              label="培训内容">
            </el-table-column>
            <!--<el-table-column-->
              <!--prop="ecPoint"-->
              <!--label="奖罚分">-->
            <!--</el-table-column>-->
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
        <div style="display: flex;justify-content: space-between;margin: 2px" v-if="trains!=0">
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
      <el-form :model="train" :rules="rules" ref="addEmpForm" style="margin: 0px;padding: 0px;">
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
                    <el-select v-model="train.eid" style="width: 200px" size="mini" placeholder="请输入员工姓名">
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
                  <el-form-item label="培训日期:" prop="ecDate">
                    <el-date-picker
                      v-model="train.trainDate"
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
                  <el-form-item label="培训内容:" prop="trainContent">
                    <el-input prefix-icon="el-icon-edit" v-model="train.trainContent" size="mini" style="width: 150px"
                              placeholder="请输入培训内容"></el-input>
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
              <!--<el-col :span="6">-->
                <!--<div>-->
                  <!--<el-form-item label="奖罚分:" prop="ecPoint">-->
                    <!--<el-input prefix-icon="el-icon-edit" v-model="award.ecPoint" size="mini" style="width: 150px"-->
                              <!--placeholder="请输入奖罚分"></el-input>-->
                  <!--</el-form-item>-->
                <!--</div>-->
              <!--</el-col>-->

              <el-col :span="6">
                <div>
                  <el-form-item label="备注:" prop="remark">
                    <el-input prefix-icon="el-icon-edit" v-model="train.remark" size="mini" style="width: 150px"
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
        dialogVisible: false,
        dialogTitle: '新增培训',
        tableLoading: false,
        keywords:'',
        advanceSearchViewVisible: false,
        index: 0,
        totalCount: -1,
        currentPage: 1,
        trains: [],
        emps:[],
        multipleSelection: [],
        train: {
          id: '',
          eid: '',
          trainDate: '',
          trainContent: '',
          remark: '',
          name:''
        },
        rules: {
          eid: [{required: true, message: '必填:姓名', trigger: 'blur'}],
          trainDate: [{required: true, message: '必填:培训日期', trigger: 'blur'}],
          trainContent: [{required: true, message: '必填:培训内容', trigger: 'blur'}],
        }
      };
    },
    methods: {
      keywordsChange(val) {
        if (val == '') {
          this.loadTrainsCfg();
        }
      },
      searchEmp() {
        this.loadTrainsCfg();
      },
      currentChange(currentChange) {
        this.currentPage = currentChange;
        this.loadTrainsCfg();
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
        this.train = row;
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
        this.deleteRequest("/personnel/train/" + id).then(resp=>{
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;

            _this.loadTrainsCfg();
          }
        });
      },
      loadTrainsCfg(){
        this.tableLoading = true;
        var _this = this;
        this.getRequest("/personnel/train?keywords="+_this.keywords+"&page=" + this.currentPage).then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            _this.trains = resp.data.trainsList;
            _this.totalCount = resp.data.count;
          }
          var old = _this.trains;
          old.forEach(item => {
            _this.emps.forEach(itemE => {
              if (item.eid == itemE.id) {
                item.name = itemE.name;
              }
            })
          })
          _this.trains = old;
        })
      },
      emptyTrain(){
        this.train = {
          id: '',
          eid: '',
          trainDate: '',
          trainContent: '',
          remark: '',
          name:''
        };
        this.index = 0;
      },
      cancelEidt() {
        this.dialogVisible = false;
        this.emptyTrain();
      },
      addEmp(formName) {
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if (this.train.id) {
              //更新
              this.tableLoading = true;
              this.putRequest("/personnel/train", this.train).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;
                  _this.dialogVisible = false;
                  _this.emptyTrain();
                  _this.loadTrainsCfg();
                }
              })
            } else {
              //添加
              this.tableLoading = true;
              this.postRequest("/personnel/train", this.train).then(resp => {
                _this.tableLoading = false;
                if (resp && resp.status == 200) {
                  var data = resp.data;

                  _this.dialogVisible = false;
                  _this.emptyTrain();
                  _this.loadTrainsCfg();
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
          _this.loadTrainsCfg();
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
