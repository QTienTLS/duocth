<template>
    <div
    class="bg-primary mobile:fixed h-[100vh] mobile:left-0 mobile:z-[9999] flex flex-col fixed top-0 p-4 text-white  transition-all duration-300"
    :class="open ? 'w-64' : 'w-24 mobile:-translate-x-full mobile:w-64'"
  >
    <div class="hidden mobile:block mobile:fixed mobile:top-0 mobile:right-0 bg-black bg-opacity-50
    h-full w-[calc(100vw-256px)] transition-all duration-200"
    @click="open=false"
    :class="open?'visible opacity-1':'invisible opacity-0'"
    ></div>
    <div class="fixed -right-[calc(100vw-1rem)] rounded-full mobile:flex hidden items-center
    transition-all duration-200
    justify-center bottom-8 shadow-box3 h-16 w-16 text-active bg-primary"
    :class="!open?'visible opacity-1':'invisible opacity-0'"
    @click="toggleSidebar"
    >
      <Icon icon="basil:menu-outline" width="2rem" height="2rem" />
    </div>
    <div
      @click="toggleSidebar"
      class="h-24 gap-2 flex items-center w-full cursor-pointer relative overflow-x-hidden"
      :class="
        open
          ? 'hover:bg-black justify-evenly rounded-xl'
          : 'mx-auto justify-center'
      "
    >
      <img
        :src="logo"
        alt="logo"
        class="w-16 h-16 absolute left-0 top-1/2 -translate-y-1/2"
      />
      <span
        class="absolute right-8 transition-all duration-300 text-nowrap"
        :class="open ? 'opacity-1' : 'opacity-0'"
        >TH Pharmacy</span
      >
    </div>
    
    <div class="flex-1 overflow-y-auto">
      <MenuItem v-for="item in menu" :key="item.id" :menu="item"
      v-model:open="item.open"
      v-model:sidebarOpen="open" />
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch, watchEffect } from 'vue';
import logo from '@/assets/image/logo-active.png';
import axios from '@/plugins/axiosPlugin';
import MenuItem from './MenuItem.vue';
import { useSystemStore } from '../stores/system';
const menu = ref([]);
const systemStore = useSystemStore();
const getMenuTree = async () => {
  const res = await axios.get('/system/get-menu-tree');
  menu.value = res.data.data.map((item) => {
    return {
      ...item,
      open: false,
    };
  });
};

onMounted(() => {
  getMenuTree();
});


const open = computed({
  get: () => systemStore.sidebarOpen,
  set: (value) => {
    systemStore.setSidebarOpen(value);
  },
});
const toggleSidebar = () => {
  open.value = !open.value;
  console.log(systemStore.sidebarOpen);
  
};
</script>
     
