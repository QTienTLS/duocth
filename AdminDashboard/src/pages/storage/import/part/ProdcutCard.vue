<template>
  <div class="shadow-box2 grid grid-cols-1 relative gap-2 p-2 h-[25rem] border border-gray-200">
    <div class="absolute top-4 right-4 flex select-none cursor-pointer items-center bg-danger p-4
    hover:bg-danger-900 gap-2 text-[1.3rem]
    text-white rounded-full"
    @click="removeProduct"
    >
      <Icon icon="pajamas:remove" />
    </div>
    <ImageView :src="imgURL" class="h-[15rem] border border-gray-200 mx-auto" fitHeight />
    <span class="italic text-gray-500 text-[.9rem] absolute top-[16rem] right-2">{{ textQuantityInstorage }}</span>
    <div class="grid grid-cols-2 gap-2 pt-4">
      <FormInput v-model="product.quantity" type="number" />
      <FormSelect v-model="product.unit" :options="product.units" />
    </div>
    <el-input
    v-model="product.price"
    placeholder="Tổng tiền"
    :formatter="(value) => `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
    :parser="(value) => value.replace(/\$\s?|(,*)/g, '').replace(/^0+/, '')"
  >
  <template #append>
    VNĐ
  </template>
  </el-input>
  </div>
</template>

<script setup>

import { onMounted } from 'vue';

const product = defineModel();
const imgURL = import.meta.env.VITE_API_URL + '/images/' + product.value.image;
const emit = defineEmits(['removeProduct']);
const removeProduct = () => {
  emit('removeProduct',product.value.id);
}
onMounted(() => {
  product.value.quantity = 0;
  product.value.units = product.value.units.map((unit) => {
    return {
      id: unit.id,
      text: unit.name,
    };
  }); 
  product.value.unit = product.value.units[0].id;
  product.value.price = null;
});
const quantity_by_unit = product.value.quantity_by_unit[0];
const textQuantityInstorage = 'Kho: ' + quantity_by_unit.base_quantity + ' ' + quantity_by_unit.from_name;
</script>

<style lang="scss" scoped>

</style>