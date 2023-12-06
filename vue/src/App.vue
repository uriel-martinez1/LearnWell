<template>
  <div id="capstone-app">
    <div id="nav">
<<<<<<< HEAD
=======
      <!--<router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;-->
      <nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="http://127.0.0.1:5173/login">
      <!-- <img src="our logo link here" alt="" 
      width="112" height="28"> -->
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>
>>>>>>> 17e273c6d2adb560b337b67b71b418c79381a188
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
