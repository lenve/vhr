<template>
    <div id="message" v-scroll-bottom="sessions">
        <ul v-if="currentSession">
            <li v-for="entry in sessions[user.username+'#'+currentSession.username]">
                <p class="time">
                    <span>{{entry.date | time}}</span>
                </p>
                <div class="main" :class="{self:entry.self}">
                    <img class="avatar" :src="entry.self ? user.userface : currentSession.userface" alt="">
                    <p class="text">{{entry.content}}</p>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import {mapState} from 'vuex'

    export default {
        name: 'message',
        data() {
            return {
                user: JSON.parse(window.sessionStorage.getItem("user"))
            }
        },
        computed: mapState([
            'sessions',
            'currentSession'
        ]),
        filters: {
            time(date) {
                if (date) {
                    date = new Date(date);
                }
                return `${date.getHours()}:${date.getMinutes()}`;
            }
        },
        directives: {/*这个是vue的自定义指令,官方文档有详细说明*/
            // 发送消息后滚动到底部,这里无法使用原作者的方法，也未找到合理的方法解决，暂用setTimeout的方法模拟
            'scroll-bottom'(el) {
                //console.log(el.scrollTop);
                setTimeout(function () {
                    el.scrollTop += 9999;
                }, 1)
            }
        }
    }
</script>

<style lang="scss" scoped>
    #message {
        padding: 15px;
        max-height: 68%;
        overflow-y: scroll;

        ul {
            list-style-type: none;
            padding-left: 0px;

            li {
                margin-bottom: 15px;
            }
        }

        .time {
            text-align: center;
            margin: 7px 0;

            > span {
                display: inline-block;
                padding: 0 18px;
                font-size: 12px;
                color: #FFF;
                background-color: #dcdcdc;
                border-radius: 2px;
            }
        }

        .main {
            .avatar {
                float: left;
                margin: 0 10px 0 0;
                border-radius: 3px;
                width: 30px;
                height: 30px;

            }

            .text {
                display: inline-block;
                padding: 0 10px;
                max-width: 80%;
                background-color: #fafafa;
                border-radius: 4px;
                line-height: 30px;
            }
        }

        .self {
            text-align: right;

            .avatar {
                float: right;
                margin: 0 0 0 10px;
                border-radius: 3px;
                width: 30px;
                height: 30px;
            }

            .text {
                display: inline-block;
                padding: 0 10px;
                max-width: 80%;
                background-color: #b2e281;
                border-radius: 4px;
                line-height: 30px;
            }
        }
    }
</style>
