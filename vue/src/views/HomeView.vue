<template>
  <div class="header">
    <home-nav-bar></home-nav-bar>
  </div>
  <div class="box">
    <div class="tile is-ancestor">

      <div class="tile is-4 is-vertical is-parent">
        <h1 class="title is-1">Lets make learning easier for all</h1>
        <P class="subtitle is-5">LearnWell streamlines course organization and assignment management for teachers, while
          providing students with
          easy access to homework, submission, and teacher communication.</P>
        <p></p>
        <div class="buttons">
          <a class="button is-link is-outlined"><router-link v-bind:to="{ name: 'register' }"><strong>Get
                Started</strong></router-link></a>
        </div>

        <div class="tile">
          <div class="content">
            <span class="subtitle is-5">{{ this.message.text }}</span>
          </div>
        </div>
      </div>
      <div class="tile is-parent">
        <img class="home-image" src="../icon/LearnWellHomeimg.jpg">
      </div>
    </div>
  </div>
  <div class="footer">
    <footer>
      <p>
        Created by Learn Well. © 2023
      </p>
    </footer>
  </div>
</template>

<script>
import HomeNavBar from '../components/HomeNavBar.vue'
import Footer from '../components/Footer.vue'

export default {
  components: {
    HomeNavBar,
  },
  data() {
    return {
      isLoading: true,
      message: {
        text: '',
        author: '',
      }
    }
  },
  created(){
    try {
        fetch("https://type.fit/api/quotes")
          .then((response) => {
            return response.json();
          })
          .then((data) => {
            console.log(data)
            let randomQuote = data[Math.floor(Math.random() * data.length)]
            this.message.text = randomQuote.text;
            this.message.author = randomQuote.author.split(",")[0];
            this.isLoading = false;
          });
      }
      catch (error){
        console.error('Something went wrong', error)
      }
  },
  
}
</script>

<style>
.home-image {
  height: 60%;
}
</style>

