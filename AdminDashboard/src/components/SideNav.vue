<template>
  <div class="bg-primary h-[100vh]
  flex flex-col p-4 text-white relative transition-all duration-300"
  :class="open?'w-64':'w-24'"
  >
  <div @click="open=!open" class="h-24 gap-2  flex  items-center  w-full cursor-pointer relative overflow-x-hidden"
  :class="open?'hover:bg-black justify-evenly rounded-xl':'mx-auto justify-center'"
  >
    <img :src="logo" alt="logo" class="w-16 h-16 absolute left-0 top-1/2 -translate-y-1/2  " />
    <span class="absolute right-8 transition-all duration-300 text-nowrap"
    :class="open?'opacity-1':'opacity-0'"
    >TH Pharmacy</span>
  </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import logo from '@/assets/image/logo-active.png'

const open = ref(true);
</script>

<style lang="scss" scoped>

</style>