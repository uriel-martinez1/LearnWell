<template>
  <div id="app" class="text-center">
    <div class="header">
      <register-login-nav-bar></register-login-nav-bar>
    </div>
    <form class="box" v-on:submit.prevent="register">
      <h1 class="title is-4">Create Account</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="field">
        <label for="first-name"></label>
        <div class="control has-icons-left">
          <input class="input is-success" type="text" id="first-name" placeholder="First Name" v-model="user.firstName"
            required autofocus />
          <span class="icon is-small is-left">
            <i class="fa-regular fa-user"></i>
          </span>
        </div>
      </div>

      <div class="field">
        <label for="last-name"></label>
        <div class="control has-icons-left">
          <input class="input is-success" type="text" id="last-name" placeholder="Last Name" v-model="user.lastName"
            required autofocus />
          <span class="icon is-small is-left">
            <i class="fa-regular fa-user"></i>
          </span>
        </div>
      </div>

      <div class="field">
        <label for="email"></label>
        <div class="control has-icons-left">
          <input class="input is-success" type="email" id="email" placeholder="Email Address" v-model="user.email"
            required autofocus />
          <span class="icon is-small is-left">
            <i class="fas fa-envelope"></i>
          </span>
        </div>
      </div>
      <div class="field">
        <label for="username"></label>
        <div class="control has-icons-left">
          <input class="input is-success" type="text" id="username" placeholder="Create your username"
            v-model="user.username" required autofocus />
          <span class="icon is-small is-left">
            <i class="fas fa-user"></i>
          </span>
        </div>
      </div>

      <label class="label"></label>
      <div class="field has-addons">
        <div class="control is-expanded">
          <input v-if="showPassword" type="text" class="input" v-model="user.password" />
          <input v-else type="password" class="input" placeholder="Create your password" v-model="user.password">
        </div>
        <div class="control">
          <button class="button" @click.prevent="toggleShow"><span class="icon is-small is-right">
              <i class="fas" :class="{ 'fa-eye-slash': showPassword, 'fa-eye': !showPassword }"></i>
            </span>
          </button>
        </div>
      </div>
      <label class="label"></label>
      <div class="field has-addons">
        <div class="control is-expanded">
          <input v-if="showPassword" type="text" class="input" v-model="user.confirmPassword" />
          <input v-else type="password" class="input" placeholder="Confirm your password" v-model="user.confirmPassword">
        </div>
        <div class="control">
          <button class="button" @click.prevent="toggleShow"><span class="icon is-small is-right">
              <i class="fas" :class="{ 'fa-eye-slash': showPassword, 'fa-eye': !showPassword }"></i>
            </span>
          </button>
        </div>
      </div>

      <input name="isTeacher" type="radio" id="teacher-yes" v-model="user.teacher" v-bind:value="true" />
      <label for="teacher-yes">Teacher</label>
      <input name="isTeacher" type="radio" id="teacher-no" v-model="user.teacher" v-bind:value="false" />
      <label for="teacher-no">Student</label>
      <div v-show="user.teacher" class="field">
        <label class="label"></label>
        <div class="control">
          <div class="control has-icons-right">
            <input class="input" type="text" placeholder="Enter your teacher key" v-model="user.teacherKey">
            <span class="icon is-small is-right">
              <i class="fas fa-key"></i>
            </span>
          </div>
        </div>
      </div>
      <div>
        <button class="button is-link is-outlined" type="submit" v-if="!user.teacher"><strong>Register</strong></button>
        <button class="button is-link is-outlined" type="submit" v-else
          v-bind:disabled="!user.teacherKey"><strong>Register</strong></button>
        <div>

        </div>
      </div>
      <p class="mt-6"><router-link v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';
import RegisterLoginNavBar from '../components/RegisterLoginNavBar.vue';

export default {

  components: {
    RegisterLoginNavBar,
  },
  created() {
    if (this.$store.state.token != '') {
      if (this.$store.state.user.role === "student") {
        this.$router.push(`/student/${this.$store.state.user.userId}`);
      } else {
        this.$router.push(`/teacher/${this.$store.state.user.userId}`);
      }

    }
  },
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
      showPassword: false,
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
    },
    buttonLabel() {
      return (this.showPassword) ? "Hide" : "Show";
    },

  },
  methods: {
    buttonAccess(tKey) {
      return tKey.length === 0
    },
    register() {
      if (this.user.role == 'teacher' && this.user.teacherKey == '') {
        this.registrationErrors = true;
        // alert('Please enter a valid teacher key')
      }
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        // alert('Password & Confirm Password do not match.');
      }

      else {
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
              this.registrationErrors = 'Invalid information entered';
            } else if (response.status === 500) {
              this.registrationErrors = 'Invalid teacher key entered';
            }

          });

        this.user = {
          firstName: '',
          lastName: '',
          email: '',
          username: '',
          password: '',
          confirmPassword: '',
          teacher: false,
          teacherKey: ''
        }

        setTimeout(() => {
          this.clearErrors();
        }, 5000);
      }
    },
    clearErrors() {
      this.registrationErrorMsg = '';
      this.registrationErrors = false;
    },
    toggleShow() {
      this.showPassword = !this.showPassword;
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

#app {
  margin-left: 10px;
}

.field {
  width: 55%;
}



.button-is-link-is-outlined-my-5 {
  accent-color: rgb(15, 167, 15);
}

button:disabled {
  opacity: 50%;
}
</style>
