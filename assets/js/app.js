__webpack_public_path__ = baseUrl + 'js/';

window.appcfg = {
  pnotify: {
    delay: 1000
  }
};

import Vue from 'vue';
import VueRouter from 'vue-router';
import VueResource from 'vue-resource';
import VeeValidate from 'vee-validate';
import VueSession from 'vue-session';
import { Validator } from 'vee-validate';

Vue.use(VueRouter);
Vue.use(VueResource);
Vue.use(VeeValidate);
Vue.use(VueSession);


 // -------------- To Fix ------------------------
 Vue.http.options.root = 'http://localhost:8000/api/v1';

Vue.http.headers.common['Access-Control-Allow-Origin'] = '*';

const Login = resolve => {  
  require([ "../../html/components/login.vue" ], () => {
    resolve(require("../../html/components/login.vue"));
  });
};



const ControlPanel = resolve => {  
  require([ "../../html/components/control-panel.vue" ], () => {
    resolve(require("../../html/components/control-panel.vue"));
  });
};

const User = resolve => {  
  require([ "../../html/components/user.vue" ], () => {
    resolve(require("../../html/components/user.vue"));
  });
};



const router = new VueRouter({
  mode: 'history',
  // base: __dirname,
  routes: [
    {
      name: 'default',
      path: '',
      component: Login
    },
    {
      name: 'login',
      path: '/login',
      component: Login    },
    
    { 
      name: 'control-panel',
      path: '/control-panel',
      component: ControlPanel,
      children: [
        {
          name: 'user',
          path: 'user',
          component: User
        }

      ]
    }
  ]
});

const app = new Vue({
  router,
  data: {
    app_loading: false,
    isMenuCollapsed: false
  }
}).$mount('#app');

router.beforeEach((to, from, next) => {
  app.app_loading = true;
  next()
})

router.afterEach((to, from) => {
  app.app_loading = false;
});
