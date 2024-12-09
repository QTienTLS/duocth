<template>
  <div 
  ref="productListPanel"
  class="relative">
    <FormInput
    @focus="inputFocus"
    v-model="search" label="Tìm sản phẩm" icon="fluent-mdl2:product" />
    <div
    class="tablet:block hidden bg-black opacity-30 fixed inset-0 z-[99999]"
    :class="open?'visible':'invisible'"
    @click="open = false"
    ></div>
    <ul
    class="product-list
    tablet:fixed tablet:w-[90vw] tablet:max-h-[80vh] tablet:z-[999999] bg-white tablet:top-[10vh] tablet:left-[5vw]
    absolute border shadow-box2 z-[999999] border-gray-200 transition-all transition-200 w-full max-h-[500px] overflow-y-auto"
    :class="{
      'visible opacity-1': open,
      'invisible opacity-0': !open
    }"
    >
      <li v-for="item in showingList" :key="item.id"
      class="flex items-center gap-2 p-2 hover:bg-gray-100 cursor-pointer border-b h-44 border-gray-200"
      @click="toggleSelect(item)"
      :class="selectedList.includes(item.id)?'border-primary-100':''"
      >
        <ImageView :src="item.image" class="h-full overflow-x-hidden w-44 shadow-box3 flex justify-center" fitHeight />
        <div class="flex flex-1 flex-col items-start pl-4 h-full gap-4">
          <div class="font-bold text-xl">{{ item.name }}</div>
          <div class="text-[1rem] flex-1 w-full truncate">{{ item.description }}</div>
        </div>
        <Icon icon="fluent:checkmark-32-regular" class="text-primary-200 translate-x-[-1rem]"
                :class="{
                  'visible': selectedList.includes(item.id),
                  'invisible': !selectedList.includes(item.id)
                }"
                width="2em" height="2em" />
      </li>
    </ul>
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue';
const search = ref('');
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
import { onClickOutside } from '@vueuse/core';
const systemStore = useSystemStore();

const listProduct = ref([]);
const selectedList = defineModel();
const open = ref(false);
const productListPanel = ref(null);
onClickOutside(productListPanel, () => {
  open.value = false;
});
const getListProduct = async() => {
  systemStore.setGlobalLoading(true);
  const res = await axios.post('/storage/get-products',{});
  systemStore.setGlobalLoading(false);
  if (res.data.code === 'dth-200') {
    listProduct.value = res.data.data.map(item =>{
      return {
        ...item,
        image:  `${import.meta.env.VITE_API_URL}/images/${item.img_desc}`
      }
    });
  }
}
const inputFocus = () => {
  open.value = true;
}
const toggleSelect = (item) => {
  if (selectedList.value.includes(item.id)) {
    selectedList.value = selectedList.value.filter(id => id !== item.id);
  } else {
    selectedList.value.push(item.id);
  }
}
onMounted(() => {
  getListProduct();
})
const showingList = computed(() => {
  return listProduct.value.filter(item => item.name.toLowerCase().includes(search.value.toLowerCase()));
})
defineExpose({
  getListProduct
})
</script>

<style lang="scss" scoped>

</style>