import {createRouter, createWebHistory} from 'vue-router'
import Login from './views/Login.vue'
import Home from './views/Home.vue'
import FriendChat from './views/chat/FriendChat.vue'
import HrInfo from './views/HrInfo.vue'

const routes = [
    {
        path: '/',
        name: 'Login',
        component: Login,
        hidden: true
    }, {
        path: '/home',
        name: 'Home',
        component: Home,
        hidden: true,
        meta: {
            roles: ['admin', 'user']
        },
        children: [
            {
                path: '/chat',
                name: '在线聊天',
                component: FriendChat,
                hidden: true
            }, {
                path: '/hrinfo',
                name: '个人中心',
                component: HrInfo,
                hidden: true
            }
        ]
    }, {
        //Vue Router 4 之后通配符路由的写法
        path: '/:pathMatch(.*)*',
        redirect: '/home'
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
