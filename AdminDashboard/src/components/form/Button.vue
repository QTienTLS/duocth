<template>
  <button
  ref="button"
  class="flex items-center h-[40px] w-fit relative px-4 rounded-md"
  :class="{'bg-primary-500 text-gray-700 hover:bg-primary-700 hover:text-white': variant === 'primary' && type === 'default',
    'border-[2px] bg-white text-primary border-primary hover:bg-primary hover:text-white':variant === 'primary' && type === 'outline'
  }"
  >
    <Icon v-if="icon" :icon="icon" />
    {{ text }}
  </button>
</template>

<script setup>
import { defineProps,onMounted,ref } from 'vue'
const props = defineProps({
  text: String,
  icon: String,
  variant: {
    type: String,
    default: 'primary'
  },
  type:{
    type: String,
    default: 'default'
  }
})


</script>

<style lang="scss" scoped>

</style>