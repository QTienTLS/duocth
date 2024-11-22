<template>
  <ul class="flex fixed top-[3rem] list w-full">
    <li v-for="(button,index) in buttons" :key="index"
    @click="buttonClick(button.code)"
    class="flex text-primary 
    cursor-pointer
    justify-between items-center gap-1 h-12 px-4 border-r-[1px] hover:text-white hover:bg-primary-700">
      <Icon :icon="button.icon" height="1.3rem" width="1.3rem"/>
      <button >{{ button.name }}</button>
    </li>
  </ul>
</template>

<script setup>

const props = defineProps({
  buttons: {
    type: Array,
    default: () => []
  }
})
const emit = defineEmits()
const buttonClick = (code) => {
  emit('buttonClick', code);
}
</script>

<style lang="scss" scoped>
.list{
  box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
}
</style>