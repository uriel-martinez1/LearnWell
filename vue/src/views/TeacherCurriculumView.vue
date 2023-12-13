<template>
    <curriculum-element class="content" v-bind:elementId="this.$route.params.elementId"></curriculum-element>
    
</template>

<script>
import CurriculumElement from '../components/CurriculumElement.vue'


export default {
    components: {
        CurriculumElement,
       
    }
}
</script>

<style >
.content{
    position: absolute;
    left: 200px;

}
</style>