<script>
// Add src prop
export default {
  props: {
    src: {
      type: String,
      required: true
    },
    loop: {
      type: Boolean,
      default: false
    },
  }
}
</script>

<template>

<video muted autoplay id="myVideo" class="abs-bl w-full -z-1" >
  <source :src="src" :loop="loop">
</video>
</template>