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
            class="left-12 transition-all duration-300"
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
      class=" box-border  border-active w-full transition-all transition-300"
      :class="open?'border-t border-b':''"
      >
      
      </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue';
const props = defineProps({
  menu: Object,
})
const sidebarOpen = defineModel('sidebarOpen');
const open = defineModel('open');
const toggleOpen = () => {
  open.value = !open.value;
}
const fullHeight = props.menu.children.length * 40 + 32;
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
</script>

<style lang="scss" scoped>

</style>