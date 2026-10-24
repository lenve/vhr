import {createStore} from 'vuex'
import {ElNotification} from 'element-plus';
import {getRequest} from "../utils/api";
import {Client} from '@stomp/stompjs'
import SockJS from 'sockjs-client'

const store = createStore({
    state: {
        routes: [],
        sessions: {},
        hrs: [],
        currentSession: null,
        currentHr: JSON.parse(window.sessionStorage.getItem("user")),
        filterKey: '',
        stomp: null,
        isDot: {}
    },
    mutations: {
        INIT_CURRENTHR(state, hr) {
            state.currentHr = hr;
        },
        initRoutes(state, data) {
            state.routes = data;
        },
        changeCurrentSession(state, currentSession) {
            //Vue 3 的响应式可以直接新增属性，不再需要 Vue.set
            state.isDot[state.currentHr.username + '#' + currentSession.username] = false;
            state.currentSession = currentSession;
        },
        addMessage(state, msg) {
            let key = state.currentHr.username + '#' + msg.to;
            if (!state.sessions[key]) {
                state.sessions[key] = [];
            }
            state.sessions[key].push({
                content: msg.content,
                date: new Date(),
                self: !msg.notSelf
            })
        },
        INIT_DATA(state) {
            //浏览器本地的历史聊天记录可以在这里完成
            let data = localStorage.getItem('vue-chat-session');
            if (data) {
                state.sessions = JSON.parse(data);
            }
        },
        INIT_HR(state, data) {
            state.hrs = data;
        }
    },
    actions: {
        connect(context) {
            //@stomp/stompjs 新版 API：用 Client 替代 Stomp.over
            const client = new Client({
                webSocketFactory: () => new SockJS('/ws/ep'),
                reconnectDelay: 5000,
                debug: () => {
                }
            });
            client.onConnect = () => {
                client.subscribe('/user/queue/chat', msg => {
                    let receiveMsg = JSON.parse(msg.body);
                    if (!context.state.currentSession || receiveMsg.from != context.state.currentSession.username) {
                        ElNotification.info({
                            title: '【' + receiveMsg.fromNickname + '】发来一条消息',
                            message: receiveMsg.content.length > 10 ? receiveMsg.content.substr(0, 10) : receiveMsg.content,
                            position: 'bottom-right'
                        })
                        context.state.isDot[context.state.currentHr.username + '#' + receiveMsg.from] = true;
                    }
                    receiveMsg.notSelf = true;
                    receiveMsg.to = receiveMsg.from;
                    context.commit('addMessage', receiveMsg);
                })
            };
            client.activate();
            context.state.stomp = client;
        },
        initData(context) {
            context.commit('INIT_DATA')
            getRequest("/chat/hrs").then(resp => {
                if (resp) {
                    context.commit('INIT_HR', resp);
                }
            })
        }
    }
})

store.watch(function (state) {
    return state.sessions
}, function (val) {
    localStorage.setItem('vue-chat-session', JSON.stringify(val));
}, {
    deep: true
})

export default store;
