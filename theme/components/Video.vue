<script>
// Add src prop
export default {
  // watch changes on $slidev.nav.clicks
  watch: {
    // from
    from() {
      // Play video from
      console.log("Play video from",this.from," to ",this.to)
      const that = this
      function checkTime() {
        if (that.$refs.video.currentTime >= that.to) {
          that.$refs.video.pause();
        } else {
           /* call checkTime every 1/10th 
              second until endTime */
           setTimeout(checkTime, 10);
        }
    }
      this.$refs.video.currentTime = this.from
      this.$refs.video.play()
      checkTime()
    },
    to() {
    },
  },
  // run when component is mounted
  mounted() {
    //restart video when slide is changed
     
  },
  // run when component is unmounted
  unmounted() {

  },
  props: {
    src: {
      type: String,
      required: true
    },
    loop: {
      type: Boolean,
      default: false
    },
    autoplay: {
      type: Boolean,
      default: false
    },
    clicked: {
      type: Boolean,
      default: false
    },
    from: {
      type: Number,
      default: -1
    },
    to: {
      type: Number,
      default: -1
    }
  }
}
</script>

<template>
<video ref="video" muted :autoplay="autoplay" :loop="loop" id="myVideo" class="abs-bl w-full" >
  <source :src="src" >
</video>
</template>