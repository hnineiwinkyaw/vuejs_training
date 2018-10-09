<template lang="pug">

  div.component-container
    div.component-wrapper
      div.login_wrapper
        div.animate.form.login_form
        section.login_content
          form
            h1 Login
            div
              input.form-control(type='email', v-model="form.email", placeholder='Email')
            div
              input.form-control#password(type='password', v-model="form.password", placeholder='Password')
            div
              button.btn.btn-primary.submit#submit(type="button" v-on:click="login") Log in
              
            .clearfix
            .separator
             
              br
              
      div#loadingModal.modal.fade(role="dialog")
        div.modal-dialog.modal-dialog-loader
          pulse-loader(:loading="loading")
</template>

<script>
import PulseLoader from 'vue-spinner/src/PulseLoader.vue';
export default {

  name: 'Login',
  data: function() {
    return {
      loading: true,
      isCollapsed: false,
      form: {
        email: 'admin@gmail.com',
        password: 'password'
      }
    };
  },
  components: {
    PulseLoader,
  },
  methods: {
    
    login: function(e) {
     
            this.$router.push({ name: 'user' });
         
        }
      
    }
  }

</script>

<style scoped>

</style>