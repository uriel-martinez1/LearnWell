<template>
  <div id="login">
    <div class="header">
      <register-login-nav-bar></register-login-nav-bar>
    </div>
    <form class="box" v-on:submit.prevent="login">
      <h1 class="title is-4">Please Log In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please log in.
      </div>
      <div class="field">
        <label for="username"></label>
        <input class="input is-success" type="text" id="username" placeholder="Enter your username"
          v-model="user.username" required autofocus />
      </div>
      <div class="field">
        <label for="password"></label>
        <input class="input is-success" type="password" id="password" placeholder="Enter your password"
          v-model="user.password" required autofocus />
      </div>
      <button class="button is-link is-outlined" type="submit"><strong>Log in</strong></button>
      <p>
        <router-link v-bind:to="{ name: 'register' }">Need an account? Register here!</router-link>
      </p>
    </form>
  </div>
  <div class="footer">
    <footer>Created by Learn Well. © 2023</footer>
  </div>
  
</template>

<script>
import authService from "../services/AuthService";
import RegisterLoginNavBar from '../components/RegisterLoginNavBar.vue';
import footer from '../components/Footer.vue';


export default {
  components: {
    RegisterLoginNavBar,
    footer,
    
  },
  data() {
    return {
      user: {
        username: "",
        password: "",

      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            if (response.data.user.role === "student") {
              this.$router.push("/student");
            } else {
              this.$router.push("/teacher");
            }
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        })
    },

  }
};
</script>

<style scoped>
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

.field {
  padding: 10px;
}

.box {
  max-width: 50%;

  margin: 0 auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 10px 8px rgba(107, 6, 154, 0.1);
}
</style>