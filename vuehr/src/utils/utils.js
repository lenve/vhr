import {getRequest} from './api'
import {Message} from 'element-ui'

export const isNotNullORBlank = (...args)=> {
  for (var i = 0; i < args.length; i++) {
    var argument = args[i];
    if (argument == null || argument == '' || argument == undefined) {
      Message.warning({message: '数据不能为空!'})
      return false;
    }
  }
  return true;
}
// 根据用户权限 初始化左边菜单栏
export const initMenu = (router, store)=> {

  // 如果vuex中的routes数组的长度 大于 0 如果vuex中已经缓存则return
  if (store.state.routes.length > 0) {
    return;
  }


  // 请求获取用户的左边菜单栏
  getRequest("/config/sysmenu").then(resp=> {
    // 如果请求的响应不为空 并且 响应码为200
    if (resp && resp.status == 200) {
      // 把获取到的路由信息格式化为组件信息和组件对象
      var fmtRoutes = formatRoutes(resp.data);
      // 将路由数组动态添加到router中
      router.addRoutes(fmtRoutes);
      // commit initMenu 并传值
      store.commit('initMenu', fmtRoutes);
      store.dispatch('connect');
    }
  })
}

// routes 为权限数组
export const formatRoutes = (routes)=> {
  // 定义一个
  let fmRoutes = [];
  routes.forEach(router=> {
    // console.log(router)
    let {
      path,
      component,
      name,
      meta,
      iconCls,
      children
    } = router;
    
    // 如果children不为空 并且 children 属于 数组 并且 children长度 大于 0
    if (children && children instanceof Array && children.length > 0) {
      // 如果当前组件有children 则先处理子组件
      children = formatRoutes(children);
    }
    let fmRouter = {
      path: path,
      // 将组件名称转换特定组件对象
      // component: 对象
      component(resolve){
        if (component.startsWith("Home")) {
          require(['../components/' + component + '.vue'], resolve)
        } else if (component.startsWith("Emp")) {
          require(['../components/emp/' + component + '.vue'], resolve)
        } else if (component.startsWith("Per")) {
          require(['../components/personnel/' + component + '.vue'], resolve)
        } else if (component.startsWith("Sal")) {
          require(['../components/salary/' + component + '.vue'], resolve)
        } else if (component.startsWith("Sta")) {
          require(['../components/statistics/' + component + '.vue'], resolve)
        } else if (component.startsWith("Sys")) {
          require(['../components/system/' + component + '.vue'], resolve)
        }
      },
      name: name,
      iconCls: iconCls,
      meta: meta,
      children: children
    };
    fmRoutes.push(fmRouter);
  })
  return fmRoutes;
}
