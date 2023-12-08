<template>
  <div id="capstone-app">
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
   </div> 
  <router-view />
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
