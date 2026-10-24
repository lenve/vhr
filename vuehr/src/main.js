import {createApp} from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import {ElMessage, ElMessageBox, ElNotification} from 'element-plus'
import 'element-plus/dist/index.css'
import 'font-awesome/css/font-awesome.min.css'
import {deleteRequest, getRequest, postKeyValueRequest, postRequest, putRequest} from "./utils/api";
import {initMenu} from "./utils/menus";

const app = createApp(App)

//注册 Element Plus 图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

app.use(ElementPlus, {locale: zhCn})
app.use(router)
app.use(store)

app.config.globalProperties.$ELEMENT = {size: 'small', zIndex: 3000}
app.config.globalProperties.postRequest = postRequest;
app.config.globalProperties.postKeyValueRequest = postKeyValueRequest;
app.config.globalProperties.putRequest = putRequest;
app.config.globalProperties.deleteRequest = deleteRequest;
app.config.globalProperties.getRequest = getRequest;
//Element Plus 不再自动挂载全局方法，这里手动挂载，兼容原有写法
app.config.globalProperties.$message = ElMessage;
app.config.globalProperties.$alert = ElMessageBox.alert;
app.config.globalProperties.$confirm = ElMessageBox.confirm;
app.config.globalProperties.$prompt = ElMessageBox.prompt;
app.config.globalProperties.$notify = ElNotification;

//全页加载时记录原始地址：动态路由注册前，catch-all 会在解析阶段把未注册的
//动态地址（如 /emp/basic）重定向到 /home，导致原始地址丢失，需要事后恢复
window.sessionStorage.setItem('vhr_init_path', location.pathname + location.search);

//Vue Router 5 起导航守卫不再推荐使用 next()，直接返回结果即可
router.beforeEach(async (to) => {
    if (to.path == '/') {
        return true;
    }
    const initPath = window.sessionStorage.getItem('vhr_init_path');
    if (!window.sessionStorage.getItem("user")) {
        window.sessionStorage.removeItem('vhr_init_path');
        return '/?redirect=' + (initPath && initPath.startsWith('/') ? initPath : to.fullPath);
    }
    //首次导航时动态路由还未注册，等菜单加载完成并重新触发一次导航
    if (store.state.routes.length === 0) {
        await initMenu(router, store);
        window.sessionStorage.removeItem('vhr_init_path');
        if (initPath && initPath.startsWith('/') && initPath !== '/') {
            return initPath;
        }
        return to.fullPath;
    }
    return true;
})

app.mount('#app')
