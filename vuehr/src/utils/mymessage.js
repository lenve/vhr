import {
    Message
} from 'element-ui';
const showMessage = Symbol('showMessage')
class JavaboyMessage {
    [showMessage](type, options, single) {
        if (single) {
            if (document.getElementsByClassName('el-message').length === 0) {
                Message[type](options)
            }
        } else {
            Message[type](options)
        }
    }
    info(options, single = true) {
        this[showMessage]('info', options, single)
    }
    warning(options, single = true) {
        this[showMessage]('warning', options, single)
    }
    error(options, single = true) {
        this[showMessage]('error', options, single)
    }
    success(options, single = true) {
        this[showMessage]('success', options, single)
    }
}
export const mymessage = new JavaboyMessage();
