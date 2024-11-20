<template>
  <div 
  @click="open = !open"
  ref="qtSelect"
  class="h-[40px] w-full relative  px-[10px] text-[14px] font-[400] border "
  :class="open ? 'border-[#005F39] rounded-t-[5px]' : 'border-[#c1c1c1] rounded-[5px]'">
    <Icon
    class="absolute top-1/2 transform -translate-y-1/2 right-2 transition-transform transition-300"
    :class="open ? 'rotate-90' : ''"
    icon="tabler:chevron-right" width="1.5em" height="1.5em" />
    <div class="flex flex-col absolute border border-[#c1c1c1]
    transition-all transition-300
    border-t-0 -left-[1px] top-[39px] w-[calc(100%+2px)] z-10"
    :class="open ? 'min-h-24 border' : 'h-0 border-0'"
    ></div>
  </div>
</template>

<script setup>
import { defineProps, defineModel, ref } from 'vue';
import { onClickOutside } from '@vueuse/core';

const props = defineProps({
  mode: {
    type: String,
    default: 'single',
  },
  options: {
    type: Array,
    default: () => [],
  },
})
const model = defineModel();
const open = ref(false);
const qtSelect = ref(null);
onClickOutside(qtSelect, e => {
  open.value = false;
})
</script>

<style lang="scss" scoped>

</style>