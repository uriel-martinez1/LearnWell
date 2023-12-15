<template>
  <div class="box">
    <br/>
    <h1 class="title is-3 has-text-centered">
      {{ curriculumElement.description }}
    </h1>
    <div class="box has-background-link-light">
      <h2 class="subtitle is-4 has-text-weight-medium">Todays Lecture:</h2>
      <p>
        {{ curriculumElement.lectureContent }}
      </p>
    </div>
    <div class="box has-background-link-light">
      <h2 class="subtitle is-4 has-text-weight-medium">Lecture Sources:</h2>
      <a v-bind:href="source.sourceUrl" v-for="source in sources" :key="source.sourceId">
        {{ source.sourceUrl }}
        <br />
      </a>
    </div>
  </div>
</template>

<script>
export default {
  props: ["curriculumElement", "sources"],
};
</script>

<style></style>
