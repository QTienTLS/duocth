<template>
  <e-tooltip :content="title">
    <div class="h-12 w-12 gridbutton flex justify-center items-center cursor-pointer
  
  rounded-full"
  :class="type"
  >
    <Icon :icon="icon" class="mx-auto" height="1.3rem" width="1.3rem" />
  </div>
  </e-tooltip>
</template>

<script setup>

const props = defineProps({
  icon: String,
  type: String,
  title: String,
});
</script>

<style lang="scss" scoped>
.gridbutton{
  box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
  &.primary{
    background-color: #022213;
    color: #BDF036;
    &:hover{
      background-color: white;
      border: 1px solid #022213;
      color: #022213;
    }
  }
  &.danger{
    background-color: #F56C6C;
    color: #fff;
    &:hover{
      background-color: white;
      border: 1px solid #F56C6C;
      color: #F56C6C;
    }
  }
}
</style>