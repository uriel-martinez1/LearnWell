<template>
    <div id="app">
        <form @submit.prevent="registerUser">
            <div class="field">
                <label class="label"></label>
                <div class="control">
                    <input class="input" type="text" placeholder="First name">
                </div>
            </div>

            <div class="field">
                <label class="label"></label>
                <div class="control">
                    <input class="input" type="text" placeholder="Last name">
                </div>
            </div>

            <div class="field">
                <label class="label"></label>
                <div class="control">
                    <input class="input" type="text" placeholder="Pronouns">
                </div>
            </div>

            <div class="field">
                <label class="label"></label>
                <div class="control has-icons-left has-icons-right">
                    <input class="input is-success" type="text" placeholder="Username" value="bulma">
                    <span class="icon is-small is-left">
                        <i class="fas fa-user"></i>
                    </span>
                    <!-- <span class="icon is-small is-right">
      <i class="fas fa-check"></i>
    </span>
  </div>
  <p class="help is-success">This username is available</p> -->
                </div>
            </div>

            <div class="field">
                <label class="label"></label>
                <div class="control has-icons-left has-icons-right">
                    <input class="input is-danger" type="email" placeholder="Email input" value="hello@">
                    <span class="icon is-small is-left">
                        <i class="fas fa-envelope"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                </div>
                <p class="help is-danger">This email is invalid</p>
            </div>

            <div class="field">
                <label class="label">I am a</label>
                <div class="control">
                    <div class="select">
                        <select>
                            <option>Student</option>
                            <option>Teacher</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label"></label>
                <div class="control">
                    <input class="input" type="text" placeholder="Enter your teacher key">
                </div>
            </div>
            <!-- this will be hidden unless teacher is selected from above drop down. 
if teacher key == teacher key... -->


            <div class="field">
                <label class="label">Password</label>
                <div class="control has-icons-left 
                      has-icons-right">
                    <input class="input is-danger" type="password" placeholder="Enter your password" />
                    <span class="icon is-small is-left">
                        <i class="fas fa-key"></i>
                    </span>
                </div>
            </div>
            <div class="field">
                <label class="label">Re-Type Password</label>
                <div class="control has-icons-left 
                      has-icons-right">
                    <input class="input is-danger" type="password" placeholder="Re-type your password" />
                    <span class="icon is-small is-left">
                        <i class="fas fa-key"></i>
                    </span>
                </div>
            </div>
            <!-- method to check re-type=initial -->

            <div class="field is-grouped">
                <div class="control">
                    <button class="button is-link">Register</button>
                </div>
            </div>
        </form>

        <div v-if="!isUserRegistered">
            <!-- success || welcome message? navigate to login? prompt to login? -->

        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            firstName: "",
            lastName: "",
            pronouns: "",
            username: "",
            emailAddress: "",
            isTeacher: false,
            teacherKey: "",
            isUserRegistered: false,
            isUserActive: false,


        };

    },
    methods: {
        registerUser() {
            return this.firstName, this.lastName, this.pronouns,
                this.username, this.emailAddress,
                this.isUserRegistered = true, this.isUserActive = true;
        }


    }
}

</script> 