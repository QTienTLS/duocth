<template>
  <div class="shadow-box2 grid grid-cols-1 relative gap-2 p-2 h-[30rem] border border-gray-200">
    <div class="absolute top-4 right-4 flex select-none cursor-pointer items-center bg-danger p-4
    hover:bg-danger-900 gap-2 text-[1.3rem]
    text-white rounded-full"
    @click="removeProduct"
    >
      <Icon icon="pajamas:remove" />
    </div>
    <ImageView :src="imgURL" class="h-[15rem] border border-gray-200 mx-auto" fitHeight />
  </div>
</template>

<script setup>

const product = defineModel();
const imgURL = import.meta.env.VITE_API_URL + '/images/' + product.value.image;
const emit = defineEmits(['removeProduct']);
const removeProduct = () => {
  emit('removeProduct',product.value.id);
}
</script>

<style lang="scss" scoped>

</style>