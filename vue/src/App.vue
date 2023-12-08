<template>
  <div id="capstone-app">
      <router-link class="logoutButton" type="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
   </div> 
  <router-view />
  
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
<style>

 .logoutButton {
  position: fixed;
  margin-left: 0;
  margin-bottom: 10px;
  bottom: 0;
  color: white;
  text-align: center;
  z-index: 2;
}
.logoutButton{
  background-color: rgb(184, 179, 179);
  border: none;
  color: black;
  padding: 5px 5px;
  text-align: center;
  width: 100px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
}
</style>
