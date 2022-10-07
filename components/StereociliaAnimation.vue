<template>
  <div class="anim-container">
    <current-graphic :angle="angle">
    </current-graphic>
    <stereocilia-graphic v-on:angle="angle=$event">
    </stereocilia-graphic>  
  </div>
</template>

<script>
import StereociliaGraphic_svgVue from './StereociliaGraphic_svg.vue';
import CurrentGraphic from './CurrentGraphic.vue'
export default {
  components: {
    "stereocilia-graphic": StereociliaGraphic_svgVue,
    "current-graphic": CurrentGraphic
  },
  props: {
    playing: false
  },
  data: function() {
    return {
      angle: 0
    };
  },
  mounted: function() {
    var that = this;
    
   
  }

  
};
</script>

<style scoped>
.anim-container {
  grid-column: 1/ span 6;
  grid-row: 2/ span 2;
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: 100%;
  max-width:100%; 
  max-height:100%;
}
</style>
