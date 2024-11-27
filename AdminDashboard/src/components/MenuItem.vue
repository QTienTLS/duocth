<template>
  <div>
    <div
          class="flex items-center overflow-x-hidden gap-4 h-16 relative pl-2 select-none cursor-pointer hover:bg-[#005F39] hover:bg-opacity-50"
          @click="toggleOpen()"
        >
        <Icon
            :icon="menu.icon"
            class="left-4"
            :class="sidebarOpen ? 'h-6 w-6' : 'h-8 w-8 ml-4'"
          />
          <span
            class="left-12 transition-all text-[14px] duration-300"
            :class="sidebarOpen ? 'opacity-1 visible' : 'opacity-0 invisible w-0'"
            >{{ menu.name }}</span
          >
          <Icon
            class="absolute top-1/2 transform -translate-y-1/2 right-2 transition-transform transition-300"
            :class="{
              'rotate-90': open,
              'opacity-0': !sidebarOpen,
              'opacity-1': sidebarOpen,
            }"
            icon="tabler:chevron-right"
            width="1.5em"
            height="1.5em"
          />
      </div>
      <div
      ref="panelChildren"
      class=" box-border  border-active w-full transition-all transition-300 h-0"
      :class="open?'border-b py-4':'py-0'"
      >
      <router-link 
      v-for="child in menu.children"
      :key="child.id"
      :to="child.url"
      class="flex items-center transition-all transition-200 overflow-x-hidden gap-4
      border-gray-700 hover:border-b
      link-div
      h-12 relative select-none cursor-pointer hover:bg-opacity-50"
      :class="{
        'translate-y-0 opacity-1 visible': open,
        '-translate-y-4 opacity-0 invisible': !open,
        'pl-4': sidebarOpen,
        'pl-2': !sidebarOpen,
      }"
      >
      <Icon
            :icon="child.icon"
            class="left-4"
            :class="sidebarOpen ? 'h-6 w-6' : 'h-6 w-6 ml-4'"
          />
          <span
            class="left-12 text-[14px] transition-all duration-300"
            :class="sidebarOpen ? 'opacity-1 visible' : 'opacity-0 invisible w-0'"
            >{{ child.name }}</span
          >
    </router-link>
      </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue';
import router from '../router';
const props = defineProps({
  menu: Object,
})
const sidebarOpen = defineModel('sidebarOpen');
const open = defineModel('open');
const toggleOpen = () => {
  open.value = !open.value;
}
const fullHeight = props.menu.children?props.menu.children.length * 48 + 32:0;
const panelChildren = ref(null);
watch(open, (value) => {
  if (value) {
    panelChildren.value.style.height = `${fullHeight}px`;
  } else {
    setTimeout(() => {
      panelChildren.value.style.height = '0px';
    }, 200);
  }
})
const isContainActiveMenu = () => {
  if(!props.menu.children) return false;
  return props.menu.children.some((item) => item.url === router.currentRoute.value.path);
}
onMounted(() => { 
  if (isContainActiveMenu()) {
    open.value = true;
  }
})
</script>

<style lang="scss" scoped>
.router-link-active{
  position: relative;
  &::after{
    content: '';
    position: absolute;
    left: 0px;
    bottom: 0;
    width: 6px;
    border-radius: 0 999px 999px 0;
    height: 100%;
    background-color: #BDF036;
  }
}
.link-div{
  &:hover ~ &::before{
    transform: scaleX(1);
  }
}
</style>