<template>
    <div class="flex">
      <SideNav/>
      <div class="body-content flex-1">
      <router-view v-slot="{Component}">
      <transition name="zoom" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
    </div>
    </div>
</template>

<script setup>
import router from '../router';
import SideNav from '../components/SideNav.vue';
import { onMounted } from 'vue';

onMounted(() => {
  if(router.currentRoute.value.name === 'Home'){
    router.push({name: 'Dashboard'})
  }
})

</script>

<style lang="scss" scoped>
.zoom-enter-active, .zoom-leave-active 
{ transition: transform 0.3s; }
.zoom-enter-from, .zoom-leave-to 
{ transform: scale(0.1); }
.zoom-enter-to, .zoom-leave-from 
{ transform: scale(1); }
</style>