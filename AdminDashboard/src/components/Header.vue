<template>
  <div class="h-16 bg-primary-700"
  :class="{'hidden': isLogin}"
  >

  </div>
</template>

<script setup>
import router from '@/router'
import {ref} from 'vue'

const isLogin = ref(false)
if(router.currentRoute.value.path === '/login') {
  isLogin.value = true
}
</script>

<style lang="scss" scoped>

</style>