<template>
    <div class="">
      <SideNav/>
      <div ref="contentBody" class="transition-all transition-300 absolute right-0 top-0"
      :class="open?'w-[calc(100%-256px)]':'w-[calc(100%-96px)]'">
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
import { computed, onMounted, ref, watch } from 'vue';
import { useSystemStore } from '../stores/system';
const systemStore = useSystemStore();


const globalLoading = computed({
  get: () => systemStore.globalLoading,
  set: (value) => {
    systemStore.setGlobalLoading(value);
  },
});
onMounted(() => {
  if(router.currentRoute.value.name === 'Home'){
    router.push({name: 'Dashboard'})
  }
})
const contentBody = ref(null);
const open = computed({
  get: () => systemStore.sidebarOpen,
  set: (value) => {
    systemStore.setSidebarOpen(value);
  },
});

</script>

<style lang="scss" scoped>
.zoom-enter-active, .zoom-leave-active 
{ transition: transform 0.2s; }
.zoom-enter-from, .zoom-leave-to 
{ transform: scale(0.1); }
.zoom-enter-to, .zoom-leave-from 
{ transform: scale(1); }
</style>