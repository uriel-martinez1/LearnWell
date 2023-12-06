<template>
  <div id="capstone-app">
    <div id="nav">
      <!--<router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;-->
      <nav class="navbar" role="navigation" aria-label="main navigation"></nav>
  <div class="navbar-brand">
    <a class="navbar-item" href="http://127.0.0.1:5173/login">
      <!-- <img src="our logo link here" alt="" 
      width="112" height="28"> -->
    </a>

    
  </div>
      
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
