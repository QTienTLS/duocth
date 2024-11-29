<template>
  <div class="input-row">
    <textarea class="h-full"
    :value="modelValue"
    @input="$emit('update:modelValue', $event.target.value)"
    @enter="$emit('enter')" :id="id" placeholder=" " />
    <label :for="id">
      <Icon v-if="icon" :icon="icon" />
      {{ label }}</label>
  </div>
</template>

<script setup>
const props = defineProps({
  label: String,
  rows: {
    type: Number,
    default: 4
  },
  modelValue: String,
  default: '',
  icon: String
})
//random id
const id = `input-${new Date().getTime()}-${Math.floor(Math.random() * 1000)}`;
</script>

<style lang="scss" scoped>
input:-webkit-autofill {
  background-color: #f0f8ff !important; /* Change this to your desired color */
  color: #000 !important; /* Adjust text color */
  transition: background-color 5000s ease-in-out 0s; /* Prevent sudden style changes */
}

input:-webkit-autofill:focus {
  background-color: #e6f7ff !important; /* Optional: Different style when focused */
}
</style>
