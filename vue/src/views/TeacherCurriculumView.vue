<template>
    <curriculum-element class="content" v-bind:elementId="this.$route.params.elementId"></curriculum-element>
    <website-footer></website-footer>
</template>

<script>
import CurriculumElement from '../components/CurriculumElement.vue'
import WebsiteFooter from '../components/WebsiteFooter.vue'

export default {
    components: {
        CurriculumElement,
        WebsiteFooter,
    }
}
</script>

<style>
.content{
    position: absolute;
    left: 200px;

}
</style>