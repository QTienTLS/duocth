<template>
  <div class="h-16 bg-primary-700"
  :class="{'hidden': isLogin}"
  >
    <div class="container mx-24 flex items-center justify-between h-full">
      <router-link to="/dashboard"><img :src="logo" alt="logo" class="h-20"></router-link>
    </div>
  </div>
</template>

<script setup>
import router from '@/router'
import {ref} from 'vue'
import logo from '@/assets/image/logo-white.png'

const isLogin = ref(false)
if(router.currentRoute.value.path === '/login') {
  isLogin.value = true
}
</script>

<style lang="scss" scoped>

</style>