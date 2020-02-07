webpackJsonp([2],{"6zLp":function(e,t){},CRWC:function(e,t){},DhJw:function(e,t){},F1RE:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("el-container",[a("el-header",{staticStyle:{display:"flex","justify-content":"space-between","align-items":"center","padding-left":"0px"}},[a("el-button",{attrs:{icon:"el-icon-plus",type:"primary",size:"mini"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("添加调动记录")]),e._v(" "),a("div",{staticStyle:{display:"inline"}},[a("el-input",{staticStyle:{width:"300px",margin:"0px",padding:"0px"},attrs:{placeholder:"通过员工名搜索员工,记得回车哦...",clearable:"",size:"mini",disabled:e.advanceSearchViewVisible,"prefix-icon":"el-icon-search"},on:{change:e.keywordsChange},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchEmp(t)}},model:{value:e.keywords,callback:function(t){e.keywords=t},expression:"keywords"}}),e._v(" "),a("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"primary",size:"mini",icon:"el-icon-search"},on:{click:e.searchEmp}},[e._v("搜索\n        ")])],1),e._v(" "),a("el-button",{attrs:{size:"mini",type:"success",icon:"el-icon-refresh"},on:{click:e.loadTrainsCfg}})],1),e._v(" "),a("el-main",{staticStyle:{"padding-left":"0px","padding-top":"0px"}},[a("div",[a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.tableLoading,expression:"tableLoading"}],staticStyle:{width:"100%"},attrs:{data:e.moves,stripe:"",size:"mini"},on:{"selection-change":e.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection",width:"30"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"员工姓名"}}),e._v(" "),a("el-table-column",{attrs:{label:"调动日期"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e._f("formatDate")(t.row.removeDate)))]}}])}),e._v(" "),a("el-table-column",{attrs:{width:"200",prop:"department.name",label:"调动后部门"}}),e._v(" "),a("el-table-column",{attrs:{prop:"position.name",label:"调动后职位"}}),e._v(" "),a("el-table-column",{attrs:{prop:"reason",label:"调动原因"}}),e._v(" "),a("el-table-column",{attrs:{prop:"remark",label:"备注"}}),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"}},[a("el-table-column",{attrs:{label:"编辑",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini"},on:{click:function(a){return e.handleEdit(t.$index,t.row)}}},[e._v("编辑\n                ")])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"删除",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){return e.handleDelete(t.$index,t.row)}}},[e._v("删除\n                ")])]}}])})],1)],1)],1),e._v(" "),0!=e.moves?a("div",{staticStyle:{display:"flex","justify-content":"space-between",margin:"2px"}},[a("el-button",{attrs:{type:"danger",round:"",size:"mini",disabled:0==e.multipleSelection.length},on:{click:e.deleteAll}},[e._v("批量删除\n        ")]),e._v(" "),a("el-pagination",{attrs:{background:"","page-size":10,"current-page":e.currentPage,layout:"prev, pager, next",total:e.totalCount},on:{"current-change":e.currentChange}})],1):e._e()])],1),e._v(" "),a("div",{staticStyle:{"text-align":"left"}},[a("el-form",{ref:"addEmpForm",staticStyle:{margin:"0px",padding:"0px"},attrs:{model:e.move,rules:e.rules}},[a("div",{staticStyle:{"text-align":"left"}},[a("el-dialog",{staticStyle:{padding:"0px"},attrs:{title:e.dialogTitle,"close-on-click-modal":!1,visible:e.dialogVisible,width:"77%"},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("el-row",[a("el-col",{attrs:{span:7}},[a("div",[a("el-form-item",{attrs:{label:"姓名:",prop:"eid"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入员工姓名"},model:{value:e.move.eid,callback:function(t){e.$set(e.move,"eid",t)},expression:"move.eid"}},e._l(e.emps,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调动日期:",prop:"removeDate"}},[a("el-date-picker",{staticStyle:{width:"135px"},attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",size:"mini",type:"date",placeholder:"请输入调动日期"},model:{value:e.move.removeDate,callback:function(t){e.$set(e.move,"removeDate",t)},expression:"move.removeDate"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调动原因:",prop:"reason"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入调动原因"},model:{value:e.move.reason,callback:function(t){e.$set(e.move,"reason",t)},expression:"move.reason"}})],1)],1)])],1),e._v(" "),a("el-row",[a("el-col",{attrs:{span:8}},[a("div",[a("el-form-item",{attrs:{label:"调动后部门:",prop:"afterDepId"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入调动后部门"},model:{value:e.move.afterDepId,callback:function(t){e.$set(e.move,"afterDepId",t)},expression:"move.afterDepId"}},e._l(e.deps,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:8}},[a("div",[a("el-form-item",{attrs:{label:"调动后职位:",prop:"afterJobId"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入调动后职位"},model:{value:e.move.afterJobId,callback:function(t){e.$set(e.move,"afterJobId",t)},expression:"move.afterJobId"}},e._l(e.jobs,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"备注:",prop:"remark"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入备注"},model:{value:e.move.remark,callback:function(t){e.$set(e.move,"remark",t)},expression:"move.remark"}})],1)],1)])],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{attrs:{size:"mini"},on:{click:e.cancelEidt}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(t){return e.addEmp("addEmpForm")}}},[e._v("确 定")])],1)],1)],1)])],1)],1)},staticRenderFns:[]};var n=a("C7Lr")({data:function(){return{keywords:"",advanceSearchViewVisible:!1,totalCount:-1,currentPage:1,dialogVisible:!1,dialogTitle:"新增培训",tableLoading:!1,index:0,moves:[],emps:[],jobs:[],multipleSelection:[],move:{id:"",eid:"",afterDepId:"",afterJobId:"",removeDate:"",reason:"",remark:"",name:""},rules:{eid:[{required:!0,message:"必填:姓名",trigger:"blur"}],afterDepId:[{required:!0,message:"必填:调动后部门",trigger:"blur"}],afterJobId:[{required:!0,message:"必填:调动后置位",trigger:"blur"}],removeDate:[{required:!0,message:"必填:调动日期",trigger:"blur"}],reason:[{required:!0,message:"必填:调动原因",trigger:"blur"}]},deps:[],positions:[]}},methods:{keywordsChange:function(e){""==e&&this.loadTrainsCfg()},searchEmp:function(){this.loadTrainsCfg()},currentChange:function(e){this.currentPage=e,this.loadTrainsCfg()},deleteAll:function(){var e=this;this.$confirm("删除["+this.multipleSelection.length+"]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t="";e.multipleSelection.forEach(function(e){t=t+e.id+","}),e.doDelete(t)}).catch(function(){e.$message({type:"info",message:"已取消删除"})})},handleSelectionChange:function(e){this.multipleSelection=e},handleEdit:function(e,t){this.dialogVisible=!0,this.move=t},handleDelete:function(e,t){var a=this;this.$confirm("删除[1]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){a.doDelete(t.id)}).catch(function(){a.$message({type:"info",message:"已取消删除"})})},doDelete:function(e){var t=this;t.tableLoading=!0,this.deleteRequest("/personnel/move/"+e).then(function(e){t.tableLoading=!1,e&&200==e.status&&(e.data,t.loadTrainsCfg())})},loadTrainsCfg:function(){this.tableLoading=!0;var e=this;this.getRequest("/personnel/move?keywords="+e.keywords+"&page="+this.currentPage).then(function(t){e.tableLoading=!1,t&&200==t.status&&(e.moves=t.data.moveList,e.totalCount=t.data.count);var a=e.moves;a.forEach(function(t){e.emps.forEach(function(e){t.eid==e.id&&(t.name=e.name)})}),e.moves=a})},emptyTrain:function(){this.move={id:"",eid:"",afterDepId:"",afterJobId:"",removeDate:"",reason:"",remark:"",name:""},this.index=0},cancelEidt:function(){this.dialogVisible=!1,this.emptyTrain()},addEmp:function(e){var t=this,a=this;this.$refs[e].validate(function(e){if(!e)return!1;t.move.id?(t.tableLoading=!0,t.putRequest("/personnel/move",t.move).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyTrain(),a.loadTrainsCfg())})):(t.tableLoading=!0,t.postRequest("/personnel/move",t.move).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyTrain(),a.loadTrainsCfg())}))})},initData:function(){var e=this;this.getRequest("/personnel/award/emps").then(function(t){if(t&&200==t.status){var a=t.data;e.emps=a.emps}}).then(function(){e.loadTrainsCfg()}),this.getRequest("/personnel/jobs").then(function(t){if(t&&200==t.status){var a=t.data;e.jobs=a}}),this.getRequest("/personnel/deps").then(function(t){if(t&&200==t.status){var a=t.data;e.deps=a}})}},mounted:function(){this.initData()}},i,!1,function(e){a("DhJw")},null,null);t.default=n.exports},GZY3:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={data:function(){return{fileUploadBtnText:"导入数据",dialogVisible:!1,dialogTitle:"新增惩罚",tableLoading:!1,index:0,awards:[],emps:[],jobs:[],keywords:"",advanceSearchViewVisible:!1,multipleSelection:[],award:{id:"",eid:"",ecDate:"",ecReason:"",ecPoint:"",ecType:"",remark:"",name:""},awardType:[],rules:{eid:[{required:!0,message:"必填:姓名",trigger:"blur"}],ecDate:[{required:!0,message:"必填:日期",trigger:"blur"}],ecPoint:[{required:!0,message:"必填:分数",trigger:"blur"}],ecType:[{required:!0,message:"必填:类型",trigger:"blur"}],ecReason:[{required:!0,message:"必填:原因",trigger:"blur"}]},totalCount:-1,currentPage:1}},methods:{deleteAll:function(){var e=this;this.$confirm("删除["+this.multipleSelection.length+"]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t="";e.multipleSelection.forEach(function(e){t=t+e.id+","}),e.doDelete(t)}).catch(function(){e.$message({type:"info",message:"已取消删除"})})},handleSelectionChange:function(e){this.multipleSelection=e},handleEdit:function(e,t){this.dialogVisible=!0,this.award=t},handleDelete:function(e,t){var a=this;this.$confirm("删除[1]条奖惩数据, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){a.doDelete(t.id)}).catch(function(){a.$message({type:"info",message:"已取消删除"})})},doDelete:function(e){var t=this;t.tableLoading=!0,this.deleteRequest("/personnel/award/ec/"+e).then(function(e){if(t.tableLoading=!1,e&&200==e.status){e.data;t.loadAwardsCfg()}})},loadAwardsCfg:function(){this.tableLoading=!0;var e=this;this.getRequest("/personnel/award/ec?keywords="+e.keywords+"&page="+this.currentPage).then(function(t){e.tableLoading=!1,t&&200==t.status&&(e.awards=t.data.awardsList,e.totalCount=t.data.count);var a=e.awards;a.forEach(function(t){e.emps.forEach(function(e){t.eid==e.id&&(t.name=e.name)})}),e.awards=a})},emptySalary:function(){this.award={id:"",eid:"",ecDate:"",ecReason:"",ecPoint:"",ecType:"",remark:"",name:""},this.index=0},cancelEidt:function(){this.dialogVisible=!1,this.emptySalary()},addEmp:function(e){var t=this,a=this;this.$refs[e].validate(function(e){if(!e)return!1;t.award.id?(t.tableLoading=!0,t.putRequest("/personnel/award/ec",t.award).then(function(e){if(a.tableLoading=!1,e&&200==e.status){e.data;a.dialogVisible=!1,a.emptySalary(),a.loadAwardsCfg()}})):(t.tableLoading=!0,t.postRequest("/personnel/award/ec",t.award).then(function(e){if(a.tableLoading=!1,e&&200==e.status){e.data;a.dialogVisible=!1,a.emptySalary(),a.loadAwardsCfg()}}))})},keywordsChange:function(e){""==e&&this.loadAwardsCfg()},searchEmp:function(){this.loadAwardsCfg()},fileUploadSuccess:function(e,t,a){e&&this.$message({type:e.status,message:e.msg}),this.loadAwardsCfg(),this.fileUploadBtnText="导入数据"},fileUploadError:function(e,t,a){this.$message({type:"error",message:"导入失败!"}),this.fileUploadBtnText="导入数据"},beforeFileUpload:function(e){this.fileUploadBtnText="正在导入"},exportEmps:function(){window.open("/personnel/award/exportAward","_parent")},currentChange:function(e){this.currentPage=e,this.loadAwardsCfg()},initData:function(){var e=this,t=[];JSON.parse(window.localStorage.getItem("dict")).forEach(function(e){"奖罚类型"==e.desc&&t.push(e)}),this.awardType=t,this.getRequest("/personnel/award/emps").then(function(t){if(t&&200==t.status){var a=t.data;e.emps=a.emps}}).then(function(){e.loadAwardsCfg()})}},mounted:function(){this.initData()},filters:{awardFilter:function(e){for(var t=JSON.parse(window.localStorage.getItem("dict")),a=0;t.length;a++)if("奖罚类型"==t[a].desc&&t[a].dictValue==e)return t[a].dictName}}},n={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("el-container",[a("el-header",{staticStyle:{display:"flex","justify-content":"space-between","align-items":"center","padding-left":"0px"}},[a("el-button",{attrs:{icon:"el-icon-plus",type:"primary",size:"mini"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("添加奖惩")]),e._v(" "),a("div",{staticStyle:{display:"inline"}},[a("el-input",{staticStyle:{width:"300px",margin:"0px",padding:"0px"},attrs:{placeholder:"通过员工名搜索员工,记得回车哦...",clearable:"",size:"mini",disabled:e.advanceSearchViewVisible,"prefix-icon":"el-icon-search"},on:{change:e.keywordsChange},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchEmp(t)}},model:{value:e.keywords,callback:function(t){e.keywords=t},expression:"keywords"}}),e._v(" "),a("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"primary",size:"mini",icon:"el-icon-search"},on:{click:e.searchEmp}},[e._v("搜索\n        ")])],1),e._v(" "),a("div",{staticStyle:{"margin-left":"5px","margin-right":"20px",display:"inline"}},[a("el-upload",{staticStyle:{display:"inline"},attrs:{"show-file-list":!1,accept:"application/vnd.ms-excel",action:"/personnel/award/importAward","on-success":e.fileUploadSuccess,"on-error":e.fileUploadError,disabled:"正在导入"==e.fileUploadBtnText,"before-upload":e.beforeFileUpload}},[a("el-button",{attrs:{size:"mini",type:"success",loading:"正在导入"==e.fileUploadBtnText}},[a("i",{staticClass:"fa fa-lg fa-level-up",staticStyle:{"margin-right":"5px"}}),e._v(e._s(e.fileUploadBtnText)+"\n          ")])],1),e._v(" "),a("el-button",{attrs:{type:"success",size:"mini"},on:{click:e.exportEmps}},[a("i",{staticClass:"fa fa-lg fa-level-down",staticStyle:{"margin-right":"5px"}}),e._v("导出数据\n        ")])],1),e._v(" "),a("el-button",{attrs:{size:"mini",type:"success",icon:"el-icon-refresh"},on:{click:e.loadAwardsCfg}})],1),e._v(" "),a("el-main",{staticStyle:{"padding-left":"0px","padding-top":"0px"}},[a("div",[a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.tableLoading,expression:"tableLoading"}],staticStyle:{width:"100%"},attrs:{data:e.awards,stripe:"",size:"mini"},on:{"selection-change":e.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection",width:"30"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"员工姓名"}}),e._v(" "),a("el-table-column",{attrs:{label:"奖罚日期"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e._f("formatDate")(t.row.ecDate)))]}}])}),e._v(" "),a("el-table-column",{attrs:{width:"200",prop:"ecReason",label:"奖罚原因"}}),e._v(" "),a("el-table-column",{attrs:{prop:"ecPoint",label:"奖罚分"}}),e._v(" "),a("el-table-column",{attrs:{label:"奖罚类别"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e._f("awardFilter")(t.row.ecType)))]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"remark",label:"备注"}}),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"}},[a("el-table-column",{attrs:{label:"编辑",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini"},on:{click:function(a){return e.handleEdit(t.$index,t.row)}}},[e._v("编辑\n                ")])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"删除",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){return e.handleDelete(t.$index,t.row)}}},[e._v("删除\n                ")])]}}])})],1)],1)],1),e._v(" "),0!=e.awards?a("div",{staticStyle:{display:"flex","justify-content":"space-between",margin:"2px"}},[a("el-button",{attrs:{type:"danger",round:"",size:"mini",disabled:0==e.multipleSelection.length},on:{click:e.deleteAll}},[e._v("批量删除\n        ")]),e._v(" "),a("el-pagination",{attrs:{background:"","page-size":10,"current-page":e.currentPage,layout:"prev, pager, next",total:e.totalCount},on:{"current-change":e.currentChange}})],1):e._e()])],1),e._v(" "),a("div",{staticStyle:{"text-align":"left"}},[a("el-form",{ref:"addEmpForm",staticStyle:{margin:"0px",padding:"0px"},attrs:{model:e.award,rules:e.rules}},[a("div",{staticStyle:{"text-align":"left"}},[a("el-dialog",{staticStyle:{padding:"0px"},attrs:{title:e.dialogTitle,"close-on-click-modal":!1,visible:e.dialogVisible,width:"77%"},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("el-row",[a("el-col",{attrs:{span:7}},[a("div",[a("el-form-item",{attrs:{label:"姓名:",prop:"eid"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入员工姓名"},model:{value:e.award.eid,callback:function(t){e.$set(e.award,"eid",t)},expression:"award.eid"}},e._l(e.emps,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"奖罚日期:",prop:"ecDate"}},[a("el-date-picker",{staticStyle:{width:"135px"},attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",size:"mini",type:"date",placeholder:"请输入奖罚日期"},model:{value:e.award.ecDate,callback:function(t){e.$set(e.award,"ecDate",t)},expression:"award.ecDate"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"奖罚原因:",prop:"ecReason"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入奖罚原因"},model:{value:e.award.ecReason,callback:function(t){e.$set(e.award,"ecReason",t)},expression:"award.ecReason"}})],1)],1)])],1),e._v(" "),a("el-row",[a("el-col",{attrs:{span:7}},[a("div",[a("el-form-item",{attrs:{label:"奖罚类型:",prop:"ecType"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入奖罚类型"},model:{value:e.award.ecType,callback:function(t){e.$set(e.award,"ecType",t)},expression:"award.ecType"}},e._l(e.awardType,function(e){return a("el-option",{key:e.id,attrs:{label:e.dictName,value:e.dictValue}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"奖罚分:",prop:"ecPoint"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入奖罚分"},model:{value:e.award.ecPoint,callback:function(t){e.$set(e.award,"ecPoint",t)},expression:"award.ecPoint"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"备注:",prop:"remark"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入备注"},model:{value:e.award.remark,callback:function(t){e.$set(e.award,"remark",t)},expression:"award.remark"}})],1)],1)])],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{attrs:{size:"mini"},on:{click:e.cancelEidt}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(t){return e.addEmp("addEmpForm")}}},[e._v("确 定")])],1)],1)],1)])],1)],1)},staticRenderFns:[]};var l=a("C7Lr")(i,n,!1,function(e){a("6zLp")},null,null);t.default=l.exports},K5YU:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("el-container",[a("el-header",{staticStyle:{display:"flex","justify-content":"space-between","align-items":"center","padding-left":"0px"}},[a("el-button",{attrs:{icon:"el-icon-plus",type:"primary",size:"mini"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("添加培训")]),e._v(" "),a("div",{staticStyle:{display:"inline"}},[a("el-input",{staticStyle:{width:"300px",margin:"0px",padding:"0px"},attrs:{placeholder:"通过员工名搜索员工,记得回车哦...",clearable:"",size:"mini",disabled:e.advanceSearchViewVisible,"prefix-icon":"el-icon-search"},on:{change:e.keywordsChange},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchEmp(t)}},model:{value:e.keywords,callback:function(t){e.keywords=t},expression:"keywords"}}),e._v(" "),a("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"primary",size:"mini",icon:"el-icon-search"},on:{click:e.searchEmp}},[e._v("搜索\n        ")])],1),e._v(" "),a("el-button",{attrs:{size:"mini",type:"success",icon:"el-icon-refresh"},on:{click:e.loadTrainsCfg}})],1),e._v(" "),a("el-main",{staticStyle:{"padding-left":"0px","padding-top":"0px"}},[a("div",[a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.tableLoading,expression:"tableLoading"}],staticStyle:{width:"100%"},attrs:{data:e.trains,stripe:"",size:"mini"},on:{"selection-change":e.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection",width:"30"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"员工姓名"}}),e._v(" "),a("el-table-column",{attrs:{label:"培训日期"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e._f("formatDate")(t.row.trainDate)))]}}])}),e._v(" "),a("el-table-column",{attrs:{width:"200",prop:"trainContent",label:"培训内容"}}),e._v(" "),a("el-table-column",{attrs:{prop:"remark",label:"备注"}}),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"}},[a("el-table-column",{attrs:{label:"编辑",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini"},on:{click:function(a){return e.handleEdit(t.$index,t.row)}}},[e._v("编辑\n                ")])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"删除",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){return e.handleDelete(t.$index,t.row)}}},[e._v("删除\n                ")])]}}])})],1)],1)],1),e._v(" "),0!=e.trains?a("div",{staticStyle:{display:"flex","justify-content":"space-between",margin:"2px"}},[a("el-button",{attrs:{type:"danger",round:"",size:"mini",disabled:0==e.multipleSelection.length},on:{click:e.deleteAll}},[e._v("批量删除\n        ")]),e._v(" "),a("el-pagination",{attrs:{background:"","page-size":10,"current-page":e.currentPage,layout:"prev, pager, next",total:e.totalCount},on:{"current-change":e.currentChange}})],1):e._e()])],1),e._v(" "),a("div",{staticStyle:{"text-align":"left"}},[a("el-form",{ref:"addEmpForm",staticStyle:{margin:"0px",padding:"0px"},attrs:{model:e.train,rules:e.rules}},[a("div",{staticStyle:{"text-align":"left"}},[a("el-dialog",{staticStyle:{padding:"0px"},attrs:{title:e.dialogTitle,"close-on-click-modal":!1,visible:e.dialogVisible,width:"77%"},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("el-row",[a("el-col",{attrs:{span:7}},[a("div",[a("el-form-item",{attrs:{label:"姓名:",prop:"eid"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入员工姓名"},model:{value:e.train.eid,callback:function(t){e.$set(e.train,"eid",t)},expression:"train.eid"}},e._l(e.emps,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"培训日期:",prop:"ecDate"}},[a("el-date-picker",{staticStyle:{width:"135px"},attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",size:"mini",type:"date",placeholder:"请输入培训日期"},model:{value:e.train.trainDate,callback:function(t){e.$set(e.train,"trainDate",t)},expression:"train.trainDate"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"培训内容:",prop:"trainContent"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入培训内容"},model:{value:e.train.trainContent,callback:function(t){e.$set(e.train,"trainContent",t)},expression:"train.trainContent"}})],1)],1)])],1),e._v(" "),a("el-row",[a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"备注:",prop:"remark"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入备注"},model:{value:e.train.remark,callback:function(t){e.$set(e.train,"remark",t)},expression:"train.remark"}})],1)],1)])],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{attrs:{size:"mini"},on:{click:e.cancelEidt}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(t){return e.addEmp("addEmpForm")}}},[e._v("确 定")])],1)],1)],1)])],1)],1)},staticRenderFns:[]};var n=a("C7Lr")({data:function(){return{dialogVisible:!1,dialogTitle:"新增培训",tableLoading:!1,keywords:"",advanceSearchViewVisible:!1,index:0,totalCount:-1,currentPage:1,trains:[],emps:[],multipleSelection:[],train:{id:"",eid:"",trainDate:"",trainContent:"",remark:"",name:""},rules:{eid:[{required:!0,message:"必填:姓名",trigger:"blur"}],trainDate:[{required:!0,message:"必填:培训日期",trigger:"blur"}],trainContent:[{required:!0,message:"必填:培训内容",trigger:"blur"}]}}},methods:{keywordsChange:function(e){""==e&&this.loadTrainsCfg()},searchEmp:function(){this.loadTrainsCfg()},currentChange:function(e){this.currentPage=e,this.loadTrainsCfg()},deleteAll:function(){var e=this;this.$confirm("删除["+this.multipleSelection.length+"]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t="";e.multipleSelection.forEach(function(e){t=t+e.id+","}),e.doDelete(t)}).catch(function(){e.$message({type:"info",message:"已取消删除"})})},handleSelectionChange:function(e){this.multipleSelection=e},handleEdit:function(e,t){this.dialogVisible=!0,this.train=t},handleDelete:function(e,t){var a=this;this.$confirm("删除[1]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){a.doDelete(t.id)}).catch(function(){a.$message({type:"info",message:"已取消删除"})})},doDelete:function(e){var t=this;t.tableLoading=!0,this.deleteRequest("/personnel/train/"+e).then(function(e){t.tableLoading=!1,e&&200==e.status&&(e.data,t.loadTrainsCfg())})},loadTrainsCfg:function(){this.tableLoading=!0;var e=this;this.getRequest("/personnel/train?keywords="+e.keywords+"&page="+this.currentPage).then(function(t){e.tableLoading=!1,t&&200==t.status&&(e.trains=t.data.trainsList,e.totalCount=t.data.count);var a=e.trains;a.forEach(function(t){e.emps.forEach(function(e){t.eid==e.id&&(t.name=e.name)})}),e.trains=a})},emptyTrain:function(){this.train={id:"",eid:"",trainDate:"",trainContent:"",remark:"",name:""},this.index=0},cancelEidt:function(){this.dialogVisible=!1,this.emptyTrain()},addEmp:function(e){var t=this,a=this;this.$refs[e].validate(function(e){if(!e)return!1;t.train.id?(t.tableLoading=!0,t.putRequest("/personnel/train",t.train).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyTrain(),a.loadTrainsCfg())})):(t.tableLoading=!0,t.postRequest("/personnel/train",t.train).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyTrain(),a.loadTrainsCfg())}))})},initData:function(){var e=this;this.getRequest("/personnel/award/emps").then(function(t){if(t&&200==t.status){var a=t.data;e.emps=a.emps}}).then(function(){e.loadTrainsCfg()})}},mounted:function(){this.initData()}},i,!1,function(e){a("UlXe")},null,null);t.default=n.exports},UlXe:function(e,t){},XGB5:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={render:function(){this.$createElement;this._self._c;return this._m(0)},staticRenderFns:[function(){var e=this.$createElement,t=this._self._c||e;return t("div",[t("h1",[this._v("员工资料")])])}]},n=a("C7Lr")(null,i,!1,null,null,null);t.default=n.exports},nSLl:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("el-container",[a("el-header",{staticStyle:{display:"flex","justify-content":"space-between","align-items":"center","padding-left":"0px"}},[a("el-button",{attrs:{icon:"el-icon-plus",type:"primary",size:"mini"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("添加调薪")]),e._v(" "),a("div",{staticStyle:{display:"inline"}},[a("el-input",{staticStyle:{width:"300px",margin:"0px",padding:"0px"},attrs:{placeholder:"通过员工名搜索员工,记得回车哦...",clearable:"",size:"mini",disabled:e.advanceSearchViewVisible,"prefix-icon":"el-icon-search"},on:{change:e.keywordsChange},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchEmp(t)}},model:{value:e.keywords,callback:function(t){e.keywords=t},expression:"keywords"}}),e._v(" "),a("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"primary",size:"mini",icon:"el-icon-search"},on:{click:e.searchEmp}},[e._v("搜索\n        ")])],1),e._v(" "),a("el-button",{attrs:{size:"mini",type:"success",icon:"el-icon-refresh"},on:{click:e.loadAdjustsalarysCfg}})],1),e._v(" "),a("el-main",{staticStyle:{"padding-left":"0px","padding-top":"0px"}},[a("div",[a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.tableLoading,expression:"tableLoading"}],staticStyle:{width:"100%"},attrs:{data:e.adjustsalarys,stripe:"",size:"mini"},on:{"selection-change":e.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection",width:"30"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"员工姓名"}}),e._v(" "),a("el-table-column",{attrs:{label:"调薪日期"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e._f("formatDate")(t.row.asDate)))]}}])}),e._v(" "),a("el-table-column",{attrs:{width:"200",prop:"beforeSalary",label:"调前薪资"}}),e._v(" "),a("el-table-column",{attrs:{prop:"afterSalary",label:"调后薪资"}}),e._v(" "),a("el-table-column",{attrs:{prop:"reason",label:"调薪原因"}}),e._v(" "),a("el-table-column",{attrs:{prop:"remark",label:"备注"}}),e._v(" "),a("el-table-column",{attrs:{label:"操作",align:"center"}},[a("el-table-column",{attrs:{label:"编辑",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini"},on:{click:function(a){return e.handleEdit(t.$index,t.row)}}},[e._v("编辑\n                ")])]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"删除",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){return e.handleDelete(t.$index,t.row)}}},[e._v("删除\n                ")])]}}])})],1)],1)],1),e._v(" "),0!=e.adjustsalarys?a("div",{staticStyle:{display:"flex","justify-content":"space-between",margin:"2px"}},[a("el-button",{attrs:{type:"danger",round:"",size:"mini",disabled:0==e.multipleSelection.length},on:{click:e.deleteAll}},[e._v("批量删除\n        ")]),e._v(" "),a("el-pagination",{attrs:{background:"","page-size":10,"current-page":e.currentPage,layout:"prev, pager, next",total:e.totalCount},on:{"current-change":e.currentChange}})],1):e._e()])],1),e._v(" "),a("div",{staticStyle:{"text-align":"left"}},[a("el-form",{ref:"addEmpForm",staticStyle:{margin:"0px",padding:"0px"},attrs:{model:e.adjustsalary,rules:e.rules}},[a("div",{staticStyle:{"text-align":"left"}},[a("el-dialog",{staticStyle:{padding:"0px"},attrs:{title:e.dialogTitle,"close-on-click-modal":!1,visible:e.dialogVisible,width:"77%"},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("el-row",[a("el-col",{attrs:{span:7}},[a("div",[a("el-form-item",{attrs:{label:"姓名:",prop:"eid"}},[a("el-select",{staticStyle:{width:"200px"},attrs:{size:"mini",placeholder:"请输入员工姓名"},model:{value:e.adjustsalary.eid,callback:function(t){e.$set(e.adjustsalary,"eid",t)},expression:"adjustsalary.eid"}},e._l(e.emps,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})}),1)],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调薪日期:",prop:"ecDate"}},[a("el-date-picker",{staticStyle:{width:"135px"},attrs:{"value-format":"yyyy-MM-dd HH:mm:ss",size:"mini",type:"date",placeholder:"请输入培训日期"},model:{value:e.adjustsalary.asDate,callback:function(t){e.$set(e.adjustsalary,"asDate",t)},expression:"adjustsalary.asDate"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调薪原因:",prop:"adjustsalaryContent"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入调薪原因"},model:{value:e.adjustsalary.reason,callback:function(t){e.$set(e.adjustsalary,"reason",t)},expression:"adjustsalary.reason"}})],1)],1)])],1),e._v(" "),a("el-row",[a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调前薪资:",prop:"ecPoint"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入调前薪资"},model:{value:e.adjustsalary.beforeSalary,callback:function(t){e.$set(e.adjustsalary,"beforeSalary",t)},expression:"adjustsalary.beforeSalary"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"调后薪资:",prop:"ecPoint"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入调后薪资"},model:{value:e.adjustsalary.afterSalary,callback:function(t){e.$set(e.adjustsalary,"afterSalary",t)},expression:"adjustsalary.afterSalary"}})],1)],1)]),e._v(" "),a("el-col",{attrs:{span:6}},[a("div",[a("el-form-item",{attrs:{label:"备注:",prop:"remark"}},[a("el-input",{staticStyle:{width:"150px"},attrs:{"prefix-icon":"el-icon-edit",size:"mini",placeholder:"请输入备注"},model:{value:e.adjustsalary.remark,callback:function(t){e.$set(e.adjustsalary,"remark",t)},expression:"adjustsalary.remark"}})],1)],1)])],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{attrs:{size:"mini"},on:{click:e.cancelEidt}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:function(t){return e.addEmp("addEmpForm")}}},[e._v("确 定")])],1)],1)],1)])],1)],1)},staticRenderFns:[]};var n=a("C7Lr")({data:function(){return{keywords:"",advanceSearchViewVisible:!1,totalCount:-1,currentPage:1,dialogVisible:!1,dialogTitle:"新增培训",tableLoading:!1,index:0,adjustsalarys:[],emps:[],multipleSelection:[],adjustsalary:{id:"",eid:"",asDate:"",beforeSalary:"",afterSalary:"",reason:"",remark:"",name:""},rules:{eid:[{required:!0,message:"必填:姓名",trigger:"blur"}],asDate:[{required:!0,message:"必填:调薪日期",trigger:"blur"}],beforeSalary:[{required:!0,message:"必填:调前薪资",trigger:"blur"}],afterSalary:[{required:!0,message:"必填:调后薪资",trigger:"blur"}],reason:[{required:!0,message:"必填:调薪原因",trigger:"blur"}]}}},methods:{keywordsChange:function(e){""==e&&this.loadAdjustsalarysCfg()},searchEmp:function(){this.loadAdjustsalarysCfg()},currentChange:function(e){this.currentPage=e,this.loadAdjustsalarysCfg()},deleteAll:function(){var e=this;this.$confirm("删除["+this.multipleSelection.length+"]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t="";e.multipleSelection.forEach(function(e){t=t+e.id+","}),e.doDelete(t)}).catch(function(){e.$message({type:"info",message:"已取消删除"})})},handleSelectionChange:function(e){this.multipleSelection=e},handleEdit:function(e,t){this.dialogVisible=!0,this.adjustsalary=t},handleDelete:function(e,t){var a=this;this.$confirm("删除[1]条记录, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){a.doDelete(t.id)}).catch(function(){a.$message({type:"info",message:"已取消删除"})})},doDelete:function(e){var t=this;t.tableLoading=!0,this.deleteRequest("/personnel/adjustsalary/"+e).then(function(e){t.tableLoading=!1,e&&200==e.status&&(e.data,t.loadAdjustsalarysCfg())})},loadAdjustsalarysCfg:function(){this.tableLoading=!0;var e=this;this.getRequest("/personnel/adjustsalary?keywords="+e.keywords+"&page="+this.currentPage).then(function(t){e.tableLoading=!1,t&&200==t.status&&(e.adjustsalarys=t.data.adjustsalaryList,e.totalCount=t.data.count);var a=e.adjustsalarys;a.forEach(function(t){e.emps.forEach(function(e){t.eid==e.id&&(t.name=e.name)})}),e.adjustsalarys=a})},emptyAdjustsalary:function(){this.adjustsalary={id:"",eid:"",asDate:"",beforeSalary:"",afterSalary:"",reason:"",remark:"",name:""},this.index=0},cancelEidt:function(){this.dialogVisible=!1,this.emptyAdjustsalary()},addEmp:function(e){var t=this,a=this;this.$refs[e].validate(function(e){if(!e)return!1;t.adjustsalary.id?(t.tableLoading=!0,t.putRequest("/personnel/adjustsalary",t.adjustsalary).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyAdjustsalary(),a.loadAdjustsalarysCfg())})):(t.tableLoading=!0,t.postRequest("/personnel/adjustsalary",t.adjustsalary).then(function(e){a.tableLoading=!1,e&&200==e.status&&(e.data,a.dialogVisible=!1,a.emptyAdjustsalary(),a.loadAdjustsalarysCfg())}))})},initData:function(){var e=this;this.getRequest("/personnel/award/emps").then(function(t){if(t&&200==t.status){var a=t.data;e.emps=a.emps}}).then(function(){e.loadAdjustsalarysCfg()})}},mounted:function(){this.initData()}},i,!1,function(e){a("CRWC")},null,null);t.default=n.exports},sALK:function(e,t,a){var i={"./PerEc.vue":"GZY3","./PerEmp.vue":"XGB5","./PerMv.vue":"F1RE","./PerSalary.vue":"nSLl","./PerTrain.vue":"K5YU"};function n(e){return a(l(e))}function l(e){var t=i[e];if(!(t+1))throw new Error("Cannot find module '"+e+"'.");return t}n.keys=function(){return Object.keys(i)},n.resolve=l,e.exports=n,n.id="sALK"}});
//# sourceMappingURL=2.7f8d421c18f832813940.js.map