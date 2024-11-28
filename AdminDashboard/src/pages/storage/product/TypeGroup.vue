<template>
  <div class="border border-t-0 border-primary text-white h-[20rem] flex flex-col">
    <div class="w-full h-8 bg-gradient-to-r flex items-center gap-4 pl-4 from-primary to-primary-500">
      <Icon :icon="computedList.icon" class="w-6 h-6" />
      <span>{{ computedList.name }}</span>
    </div>
    <div class="p-4 flex-1 ">
      <div class="grid grid-cols-3 gap-4"
    v-if="computedList.children.length > 0"
    >
      <div
      v-for="(item, index) in computedList.children"
      class="text-black bg-transparent px-2 h-16  rounded-lg text-[.8rem] flex items-center gap-2
      border hover:border-primary-500 border-gray-200 cursor-pointer select-none relative shadow-box2"
      :key="index"
      @click="() => $emit('itemClick', computedList.id, item.id)"
      >
      <div ref="colored" class="absolute bg-[#89F8C3] h-full left-0 rounded-lg z-[-1]"
      :style="{width: item.percent + '%'}"
      ></div>
      <Icon :icon="item.icon" height="1.7rem" width="1.7rem"/>
      <span class="flex-1">{{ item.name }}:  <span>{{ item.quantity }}</span></span>
    </div>
    </div>
    </div>
  </div>
</template>

<script setup>
import {  computed } from 'vue';

const props = defineProps({
  treeList: Object,
})
const maxQuantity = Math.max(...props.treeList.children.map(item => item.quantity));
const computedList = computed(() => {
  return {
    ...props.treeList,
    children: props.treeList.children.map(item => {
      return {
        ...item,
        percent: item.quantity&&maxQuantity?item.quantity / maxQuantity * 100:0
      }
    })
  };
})
</script>

<style lang="scss" scoped>

</style>