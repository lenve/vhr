<template>
  <div style="margin-top: 10px">
    <el-table
      :data="emps"
      size="mini"
      border
      stripe
      v-loading="tableLoading"
      style="width: 100%">
      <el-table-column
        type="selection"
        align="left"
        width="55">
      </el-table-column>
      <el-table-column
        prop="name"
        align="left"
        fixed
        label="姓名"
        width="120">
      </el-table-column>
      <el-table-column
        prop="workID"
        width="120"
        align="left"
        label="工号">
      </el-table-column>
      <el-table-column
        prop="email"
        width="200"
        align="left"
        label="电子邮件">
      </el-table-column>
      <el-table-column
        prop="phone"
        width="120"
        label="电话号码">
      </el-table-column>
      <el-table-column
        prop="department.name"
        align="left"
        width="120"
        label="所属部门">
      </el-table-column>
      <el-table-column label="工资账套" align="center">
        <template slot-scope="scope">
          <el-tooltip placement="right">
            <div slot="content">
              <template v-if="scope.row.salary">
                <div>
                  <el-tag size="mini">基本工资</el-tag>
                  ￥{{scope.row.salary.basicSalary}}
                </div>
                <div>
                  <el-tag size="mini">奖金</el-tag>
                  ￥{{scope.row.salary.bonus}}
                </div>
                <div>
                  <el-tag size="mini">午餐补助</el-tag>
                  ￥{{scope.row.salary.lunchSalary}}
                </div>
                <div>
                  <el-tag size="mini">交通补助</el-tag>
                  ￥{{scope.row.salary.trafficSalary}}
                </div>
                <div>
                  <el-tag size="mini">养老金基数</el-tag>
                  ￥{{scope.row.salary.pensionBase}}
                </div>
                <div>
                  <el-tag size="mini">养老金比率</el-tag>
                  {{scope.row.salary.pensionPer}}
                </div>
                <div>
                  <el-tag size="mini">公积金基数</el-tag>
                  ￥{{scope.row.salary.accumulationFundBase}}
                </div>
                <div>
                  <el-tag size="mini">公积金比率</el-tag>
                  {{scope.row.salary.accumulationFundPer}}
                </div>
                <div>
                  <el-tag size="mini">医疗保险基数</el-tag>
                  ￥{{scope.row.salary.medicalBase}}
                </div>
                <div>
                  <el-tag size="mini">医疗保险比率</el-tag>
                  {{scope.row.salary.medicalPer}}
                </div>
              </template>
            </div>
            <el-tag size="mini">{{scope.row.salary?scope.row.salary.name:'暂未设置'}}</el-tag>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-popover
            placement="right"
            width="200"
            @hide="updateSalaryCfg(scope.row.id)"
            :key="scope.row.id"
            trigger="click">
            <el-select size="mini" v-model="sid" placeholder="请选择">
              <el-option
                v-for="item in salaries"
                :key="item.id"
                :label="item.name"
                :value="item.id">
              </el-option>
            </el-select>
            <el-button
              size="mini"
              slot="reference"
              type="danger" @click="showUpdateView(scope.row)">修改账套
            </el-button>
          </el-popover>
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align: right;margin-top: 10px">
      <el-pagination
        background
        @current-change="currentChange"
        layout="prev, pager, next"
        :total="totalCount">
      </el-pagination>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        emps: [],
        salaries: [],
        tableLoading: false,
        totalCount: -1,
        sid: '',
        osid: '',
        currentPage: 1
      }
    },
    mounted: function () {
      this.loadEmps();
    },
    methods: {
      showUpdateView(data){
        this.loadSalaries();
        if (data.salary) {
          this.sid = data.salary.id;
          this.osid = data.salary.id;
        } else {
          this.sid = '';
          this.osid = '';
        }
      },
      loadSalaries(){
        var _this = this;
        this.getRequest("/salary/sobcfg/salaries").then(resp=> {
          if (resp && resp.status == 200) {
            _this.salaries = resp.data;
          }
        })
      },
      updateSalaryCfg(eid){
        var _this = this;
        if(this.osid==this.sid) {
          return;
        }
        this.putRequest("/salary/sobcfg/", {eid: eid, sid: this.sid}).then(resp=> {
          if(resp&&resp.status==200) {
            var data = resp.data;
           
            _this.loadEmps();
          }
        })
      },
      currentChange(currentPage){
        this.currentPage = currentPage;
        this.loadEmps();
      },
      loadEmps(){
        this.tableLoading = true;
        var _this = this;
        this.getRequest("/salary/sobcfg/emp?page=" + this.currentPage + "&size=10").then(resp=> {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.emps = data.emps;
            _this.totalCount = data.count;
          }
        })
      }
    }
  }
</script>
