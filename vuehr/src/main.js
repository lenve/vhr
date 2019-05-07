// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import store from './store'
import {getRequest} from './utils/api'
import {postRequest} from './utils/api'
import {deleteRequest} from './utils/api'
import {putRequest} from './utils/api'
import {initMenu} from './utils/utils'
import {isNotNullORBlank} from './utils/utils'
import './utils/filter_utils'
import 'font-awesome/css/font-awesome.min.css'

Vue.config.productionTip = false
Vue.use(ElementUI)

Vue.prototype.getRequest = getRequest;
Vue.prototype.postRequest = postRequest;
Vue.prototype.deleteRequest = deleteRequest;
Vue.prototype.putRequest = putRequest;
Vue.prototype.isNotNullORBlank = isNotNullORBlank;

// to: Route: 即将要进入的目标 路由对象
// from: Route: 当前导航正要离开的路由
// next: Function: 一定要调用该方法来 resolve 这个钩子。执行效果依赖 next 方法的调用参数。
// 必须调用next方法
router.beforeEach((to, from, next)=> {
    // 如果要进入的路由页面为Login 登录页面
    
    if (to.name == 'Login') {
      // console.log(to.name);
      // 继续执行
      next();
      return;
    }
    // 如果要进入的路由页面为其他页面则获取vuex中的用户名
    var name = store.state.user.name;
    // 如果用户为 ‘未登录’
    if (name == '未登录') {
     
      // 如果要进入的路由页面要鉴权 或者 路由地址名称为null
      if (to.meta.requireAuth || to.name == null) {
        // 则跳转到 / 页面，query 为 /  url后面添加 条件 效果为 ?redirect=%2F123
        next({path: '/', query: {redirect: to.path}})
      } else {
        // 继续执行
        next();
      }
    } else { // 如果已经登录
      // 初始化左边菜单栏
      initMenu(router, store);
      // 如果要跳转到 /chat 页面
      if(to.path=='/chat'){
        // 设置vuex中 updateMsgList 为 []
        store.commit("updateMsgList", []);
      }
      // 继续执行
      next();
    }
  }
)

new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: {App}
})
