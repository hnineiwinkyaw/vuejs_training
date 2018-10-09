<template lang="pug">

div.left_col.scroll-view
  div.navbar.nav_title(style='border: 0;')
    a.site_title(href="javascript:void(0)")
      i.fa.fa-paw        
      span &nbsp;UTYCC
    div.clearfix
    div.profile.clearfix
      div.profile_info
        span Welcome,
        h2(v-cloak v-text="user.name" v-if="user")
  br
  div#sidebar-menu.main_menu_side.hidden-print.main_menu
    div.menu_section
      ul.nav.side-menu
        li(:class="{ active: $route.name == 'user' }")
          router-link(:to="{ name: 'user' }")
            i.fa.fa-user
            | User
            span.fa.fa-chevron-right

        

</template>

<script>
import { EventBus } from '../../assets/js/event-bus.js';
export default {

  name: 'Sidebar',
  //-props: [ 'title', 'caption' ],
  data: function() {
    return {
      
    };
  },
  


  }

</script>

<style scoped>

</style>