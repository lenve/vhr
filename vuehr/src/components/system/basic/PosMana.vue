<template>
  <div>
    <div style="text-align: left">
      <el-input
        :placeholder="state=='position'?'添加职位...':'添加职称...'"
        size="mini"
        @keyup.enter.native="addPosition"
        style="width: 300px;"
        prefix-icon="el-icon-plus"
        v-model="positionName">
      </el-input>
      <el-select v-model="titleLevel" v-if="state=='jobtitle'" size="mini" placeholder="职称等级">
        <el-option
          v-for="tl in titleLevels"
          :key="tl"
          :label="tl"
          :value="tl">
        </el-option>
      </el-select>
      <el-button type="primary" icon="el-icon-plus" size="mini" @click="addPosition">添加</el-button>
    </div>
    <div style="margin-top: 10px">
      <el-table
        v-loading="loading"
        :data="posData"
        size="mini"
        stripe
        border
        @selection-change="handleSelectionChange"
        style="width: 80%">
        <el-table-column
          type="selection"
          width="55"
          align="left">
        </el-table-column>
        <el-table-column
          prop="id"
          label="编号"
          width="80"
          align="left">
        </el-table-column>
        <el-table-column
          prop="name"
          :label="state=='position'?'职位名称':'职称名称'"
          width="180"
          align="left">
        </el-table-column>
        <el-table-column
          prop="titleLevel"
          label="职称级别"
          width="180"
          align="left" v-if="state=='jobtitle'">
        </el-table-column>
        <el-table-column
          width="180"
          label="创建时间"
          align="left">
          <template slot-scope="scope">{{ scope.row.createDate | formatDate}}</template>
        </el-table-column>
        <el-table-column label="操作" align="left">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleEdit(scope.$index, scope.row)">编辑
            </el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div style="text-align: left;margin-top: 10px">
      <el-button type="danger" size="mini" v-if="posData.length>0" :disabled="multipleSelection.length==0"
                 @click="deleteMany">批量删除
      </el-button>
    </div>
    <div style="text-align: left">
      <el-dialog
        :title="state=='position'?'编辑职位名称':'编辑职称'"
        :visible.sync="dialogVisible"
        width="25%">
        <el-input v-model="updatePosName" size="mini" placeholder="请输入新的职位名称..."></el-input>
        <el-select v-model="updateTitleLevel" v-if="state=='jobtitle'" style="margin-top: 10px" size="mini"
                   placeholder="职称等级">
          <el-option
            v-for="tl in titleLevels"
            :key="tl"
            :label="tl"
            :value="tl">
          </el-option>
        </el-select>
        <span slot="footer" class="dialog-footer">
    <el-button size="mini" @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" size="mini" @click="updatePosNameExec">确 定</el-button>
  </span>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  export default{
    mounted: function () {
      this.loadTableData();
    },
    methods: {
      updatePosNameExec(){
        if (!this.isNotNullORBlank(this.updatePosName)) {
          this.$message.warning(this.state == 'position' ? '职位名称不能为空!' : '职称名称不能为空!');
          return;
        }
        this.loading = true;
        var _this = this;
        this.putRequest(this.state=='position'?"/system/basic/position":"/system/basic/joblevel", {name: this.updatePosName, id: this.updatePosId,titleLevel:this.updateTitleLevel}).then(resp=> {
          _this.loading = false;
          if (resp && resp.status == 200) {
            this.dialogVisible = false;
            var data = resp.data;
            _
            _this.loadTableData();
          }
        })
      },
      deleteMany(){
        var _this = this;
        this.$confirm('删除' + this.multipleSelection.length + '条数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var multipleSelection = _this.multipleSelection;
          var ids = '';
          multipleSelection.forEach(row=> {
            ids = ids + row.id + ',';
          })
          _this.doDelete(ids);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      addPosition(){
        if (!this.isNotNullORBlank(this.positionName)) {
          this.$message.warning(this.state == 'position' ? '职位名称不能为空!' : '职称名称不能为空!');
          return;
        }
        if (this.state == 'jobtitle') {
          if (!this.isNotNullORBlank(this.titleLevel)) {
            this.$message.warning('请选择职称级别!');
            return;
          }
        }
        var _this = this;
        this.loading = true;
        this.postRequest(this.state == 'position' ? "/system/basic/position" : "/system/basic/joblevel", {
          name: this.positionName,
          titleLevel: this.titleLevel
        }).then(resp=> {
          _this.loading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            _
            _this.loadTableData();
            _this.positionName = '';
            _this.titleLevel = '';
          }
        });
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleEdit(index, row){
        this.updatePosName = row.name;
        this.updatePosId = row.id;
        this.updateTitleLevel=row.titleLevel;
        this.dialogVisible = true;
      },
      handleDelete(index, row){
        var _this = this;
        this.$confirm('删除[' + row.name + '], 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          _this.doDelete(row.id);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      doDelete(ids){
        var _this = this;
        _this.loading = true;
        var url = this.state == 'position' ? '/system/basic/position/' : '/system/basic/joblevel/';
        this.deleteRequest(url + ids).then(resp=> {
          _this.loading = false;
          if (resp && resp.status == 200) {
            _this.loadTableData();
          }
        })
      },
      loadTableData(){
        var _this = this;
        this.loading = true;
        this.getRequest(this.state == 'position' ? "/system/basic/positions" : "/system/basic/joblevels").then(resp=> {
          _this.loading = false;
          if (resp && resp.status == 200) {
            _this.posData = resp.data;
          }
        })
      }
    },
    data(){
      return {
        positionName: '',
        updatePosName: '',
        updateTitleLevel: '',
        titleLevel: '',
        updatePosId: -1,
        loading: false,
        dialogVisible: false,
        multipleSelection: [],
        type: [],
        titleLevels: ['正高级', '副高级', '中级', '初级', '员级'],
        nameLabelName: this.state == 'position' ? '职位名称' : '职称名称',
        posData: []
      }
    },
    props: ['state']
  }
</script>
