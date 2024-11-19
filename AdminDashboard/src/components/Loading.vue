<template>
  <div class="relative w-fit h-fit">
    <div
    class=" left-0 top-0 z-50
    flex flex-col items-center justify-center bg-white bg-opacity-50 backdrop-blur-sm"
    :class="fullMode?'fixed w-[100vw] h-[100vh]':'absolute w-full h-full'"
    v-show="modelValue">
      <LottieAnimation 
    :animationData="loading"
    :height="iconSize" :width="iconSize"
    />
    <span>{{ text }}</span>
    </div>
    <div class="relative w-fit h-fit">
      <slot></slot>
    </div>
  </div>
</template>

<script setup>
import loading from '@/assets/json/loading.json'
import {ref} from 'vue'
import {useVModel} from '@vueuse/core'

const props = defineProps({
  modelValue: {
    type: Boolean,
    default: false
  },
  text: {
    type: String,
    default: 'Loading...'
  },
  fullMode: {
    type: Boolean,
    default: false
  },
  iconSize: {
    type: Number,
    default: 150
  }
})
const modelValue = useVModel(props, 'modelValue')
</script>

<style lang="scss" scoped>

</style>