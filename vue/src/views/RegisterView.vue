<template>
  <div id="register" class="text-center">
    <form v-on:submit.prevent="register">
      <h1>Create Account</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="field">
        <label for="first-name"></label>
        <input class="input" type="text" id="first-name" placeholder="First Name" v-model="user.firstName" required
          autofocus />
      </div>
      <div class="field">
        <label for="last-name"></label>
        <input class="input" type="text" id="last-name" placeholder="Last Name" v-model="user.lastName" required
          autofocus />
      </div>
      <div class="field">
        <label for="email"></label>
        <input class="input is-success" type="email" id="email" placeholder="Email Address" v-model="user.email" required
          autofocus />
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </div>
      <div class="field">
        <label for="username"></label>
        <input class="input is-success" type="text" id="username" placeholder="Create your username"
          v-model="user.username" required autofocus />
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </div>
      <div class="field">
        <label for="password"></label>
        <input type="password" id="password" placeholder="Create your password" v-model="user.password" required />
        <span class="icon is-small is-left">
          <i class="fas fa-key"></i>
        </span>
      </div>
      <div class="field">
        <label for="confirmPassword"></label>
        <input type="password" id="confirmPassword" placeholder="Confirm your password" v-model="user.confirmPassword"
          required />
        <span class="icon is-small is-left">
          <i class="fas fa-key"></i>
        </span>
      </div>
      <input name="isTeacher" type="radio" id="teacher-yes" v-model="user.teacher" v-bind:value="true" />
      <label for="teacher-yes">Teacher</label>
      <input name="isTeacher" type="radio" id="teacher-no" v-model="user.teacher" v-bind:value="false" />
      <label for="teacher-no">Student</label>
      <div v-show="user.teacher" class="field">
        <label class="label"></label>
        <div class="control">
          <input class="input" type="text" placeholder="Enter your teacher key">
        </div>
      </div>
      <button class="button is-link" type="submit">Register Account</button>
      <p><router-link v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        password: '',
        confirmPassword: '',
        teacher: false,
        teacherKey: ''
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  computed: {
    userRole() {
      if (!this.user.teacher) {
        return 'student'
      }
      return 'teacher'
    }
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        this.user.role = this.userRole
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}
</style>
