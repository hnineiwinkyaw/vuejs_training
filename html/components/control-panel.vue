<template lang="pug">
extends ../layouts/secured

block sidebar
  Sidebar
block top-navigation
  TopNavigation
block content
  div.loading(v-if="$root.app_loading")
    pulse-loader(:loading="$root.app_loading",:color="'#cc181e'",:size="'20px'")
  router-view(v-else)

</template>

<script>
import PulseLoader from 'vue-spinner/src/PulseLoader.vue'
import Sidebar from './sidebar.vue';
import TopNavigation from './top-navigation.vue';

export default {

  name: 'ControlPanel',
  beforeCreate: function () {
    
  },
  components: {
    Sidebar,
    TopNavigation,
    PulseLoader
  },
  data: function() {
    return {
      isCollapsed: false,
    };
  },
}
</script>

<style scoped>

</style>