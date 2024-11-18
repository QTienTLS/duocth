<template>
  <div>
    <Header></Header>
    <router-link to="/danh-muc/cong-ty">
      <FormButton text="test" />
    </router-link>
    <router-link to="/danh-muc/trinh-duoc">
      <FormButton text="home" />
    </router-link>
    <div class="body-content">
      <router-view v-slot="{Component}">
      <transition name="zoom" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
    </div>
  </div>
</template>

<script setup>
import Header from '@/components/Header.vue'

</script>

<style lang="scss" scoped>
.zoom-enter-active, .zoom-leave-active 
{ transition: transform 0.3s; }
.zoom-enter-from, .zoom-leave-to 
{ transform: scale(0.3); }
.zoom-enter-to, .zoom-leave-from 
{ transform: scale(1); }
.body-content{
  height: calc(100vh - 4rem);
}
</style>