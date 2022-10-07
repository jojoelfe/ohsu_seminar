<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps({
  link: {
    default: '',
  },
  title: {
    default: '',
  },
  authors: {
    default: '',
  },
  img_link: {
    default: '',
  },
})

</script>

<template>
<a :href=link>
<div class="mx-4 bg-white rounded-lg shadow-xl flex flex-col">
    <img :src=img_link
        class="w-1/1  rounded-lg">
    <div class="p-4">
        <p class="mb-1 text-sm font-bold text-gray-900 ">{{ title }}</p>
        <p class="text-sm text-gray-600">{{ authors }}</p>
    </div>
</div>
</a>

</template>
