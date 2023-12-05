<template>
  <div class="home">
    <home-nav-bar></home-nav-bar>
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
  </div>
</template>

<script>
import HomeNavBar from '../components/HomeNavBar.vue'
export default {
  components: {
    HomeNavBar,
  }
};
</script>
