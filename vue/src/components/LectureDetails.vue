<template>
  <h1 class="title is-5 has-text-centered">
    <strong>{{ curriculumElement.description }}</strong>
  </h1>
  <div class="box has-background-white-ter">
    <h2><strong>Todays Lecture:</strong></h2>
    <p>
      {{ curriculumElement.lectureContent }}
    </p>
  </div>
  <div class="box has-background-white-ter">
    <h2><strong>Lecture Sources:</strong></h2>
    <a v-for="source in sources" :key="source.sourceId">
      {{ source.sourceUrl }}
    </a>
  </div>
</template>

<script>
export default {
  props: ["curriculumElement", "sources"],
};
</script>

<style></style>
