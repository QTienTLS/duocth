<template>
  <div class="input-row">
    <input 
    :value="modelValue"
    @input="$emit('update:modelValue', $event.target.value)"
    @enter="$emit('enter')"
    @focus="$emit('focus')"
    @blur="$emit('blur')"
    :type="type" :id="id" placeholder=" " />
    <label :for="id">
      <Icon v-if="icon" :icon="icon" />
      {{ label }}</label>
  </div>
</template>

<script setup>
const props = defineProps({
  label: String,
  type: {
    type: String,
    default: 'text'
  },
  default: '',
  icon: String
})
defineEmits(['update:modelValue', 'enter', 'focus', 'blur'])
const modelValue = defineModel();
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
