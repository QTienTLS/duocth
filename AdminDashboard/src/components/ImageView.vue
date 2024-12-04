<template>
  <div class="">
    <img ref="image" 
    :src="props.src" alt="Image"
    :class="{
      'w-full': props.fitWidth,
      'h-full': props.fitHeight,
      'cursor-pointer': true
    }"
    @error="onError" />
  </div>
</template>

<script setup>
import defaultImage from '@/assets/image/default-img.jpg';

import { ref } from 'vue';
const props = defineProps({
  src: String,
  fitWidth: Boolean,
  fitHeight: Boolean,
});
const image = ref(null);
const onError = () => {
  image.value.src = defaultImage;
};
</script>

<style lang="scss" scoped>

</style>