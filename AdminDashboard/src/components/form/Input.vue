<template>
  <div class="input-row mb-4">
    <input 
    :value="modelValue"
    @input="$emit('update:modelValue', $event.target.value)"
    @enter="$emit('enter')"
    :type="type" :id="id" placeholder=" " />
    <label :for="id">
      <Icon v-if="icon" :icon="icon" />
      {{ label }}</label>
  </div>
</template>

<script setup>
import { defineProps } from 'vue'
const props = defineProps({
  label: String,
  type: {
    type: String,
    default: 'text'
  },
  modelValue: String,
  default: '',
  icon: String
})
//random id
const id = `input-${new Date().getTime()}-${Math.floor(Math.random() * 1000)}`;
</script>

<style lang="scss" scoped></style>
