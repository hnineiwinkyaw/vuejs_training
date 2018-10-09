<template lang="pug">

  div.top_nav
    div.nav_menu
      nav
        div.nav.toggle
          a#menu_toggle(v-on:click="onMenuToggleChanged")
            i.fa.fa-bars
        ul.nav.navbar-nav.navbar-right
          li
            a.user-profile.dropdown-toggle(href='javascript:;', data-toggle='dropdown', aria-expanded='false')
              img(src='images/img.jpg', alt='')
              label(v-cloak v-text="user.name" v-if="user")
              span.fa.fa-angle-down
            ul.dropdown-menu.dropdown-usermenu.pull-right
              //- li
                a(href='javascript:;')  Profile
              //- li
                a(href='javascript:;')
                  span.badge.bg-red.pull-right 50%
                  |                         
                  span Settings
              //- li
                a(href='javascript:;') Help
              li
                a(v-on:click="onLogout")
                  i.fa.fa-sign-out.pull-right
                  |  Log Out
          //- li.dropdown(role='presentation')
            a.dropdown-toggle.info-number(href='javascript:;', data-toggle='dropdown', aria-expanded='false')
              i.fa.fa-envelope-o
              |                     
              span.badge.bg-green 6
            ul#menu1.dropdown-menu.list-unstyled.msg_list(role='menu')
              li
                a
                  span.image
                    img(src='images/img.jpg', alt='Profile Image')
                  span
                    span John Smith
                    span.time 3 mins ago
                  span.message
                    | Film festivals used to be do-or-die moments for movie makers. They were where...
              li
                a
                  span.image
                    img(src='images/img.jpg', alt='Profile Image')
                  span
                    span John Smith
                    span.time 3 mins ago
                  span.message
                    | Film festivals used to be do-or-die moments for movie makers. They were where...
              li
                a
                  span.image
                    img(src='images/img.jpg', alt='Profile Image')
                  span
                    span John Smith
                    span.time 3 mins ago
                  span.message
                    | Film festivals used to be do-or-die moments for movie makers. They were where...
              li
                a
                  span.image
                    img(src='images/img.jpg', alt='Profile Image')
                  span
                    span John Smith
                    span.time 3 mins ago
                  span.message
                    | Film festivals used to be do-or-die moments for movie makers. They were where...
              li
                .text-center
                  a
                    strong See All Alerts
                    i.fa.fa-angle-right
</template>

<script>
import { EventBus } from '../../assets/js/event-bus.js';

export default {

  name: 'TopNavigation',
  //-props: [ 'title', 'caption' ],
  data: function() {
    return {
      menuToggle: {
        isCollapased: false,
      },
      user: false
    };
  },
  mounted: function() {
    this.user = this.$session.get('logginedUser');
    // let menuToggle = $('#menu_toggle');

    // $MENU_TOGGLE.on('click', function() {
    // console.log('clicked - menu toggle');
    
    // if ($BODY.hasClass('nav-md')) {
    //   $SIDEBAR_MENU.find('li.active ul').hide();
    //   $SIDEBAR_MENU.find('li.active').addClass('active-sm').removeClass('active');
    // } else {
    //   $SIDEBAR_MENU.find('li.active-sm ul').show();
    //   $SIDEBAR_MENU.find('li.active-sm').addClass('active').removeClass('active-sm');
    // }
  },
  methods: {
    onMenuToggleChanged: function() {
      this.menuToggle.isCollapased = !this.menuToggle.isCollapased;
      // EventBus.$emit(this.name + ':on-menu-toggle-changed', this.menuToggle.isCollapased);
      EventBus.$emit('TopNavigation:on-menu-toggle-changed', this.menuToggle.isCollapased);
    },
    onLogout: function() {
      this.$session.remove("logginedUser");
      this.$router.push({ name: 'default' });
    }
  }
}
</script>

<style scoped>

</style>