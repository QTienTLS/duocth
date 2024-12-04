<template>
  <div>
    <div class="page-title flex gap-2">
      <Icon icon="la:shipping-fast" width="2em" height="2em" />
      Nhập hàng
    </div>
    <ul class="top-button-list">
      <li @click="openModalSelectType">
        <Icon icon="fluent-mdl2:relationship" />
        Chọn ngành hàng
      </li>
    </ul>
    <div class="page-content">
      <div class="grid grid-cols-4 gap-4 p-4 pb-0">
        <div class="col-span-3">
          <FormSelect
          :options="distributorOptions" icon="material-symbols:local-shipping-outline-sharp"
          v-model="distributor" mode="multiple" label="Nhà cung cấp" />
          <ProductSearch v-model="selectedProductID" />
          <div class="box-form !ml-0 !mb-0">
            <div class="h-[calc(100vh-21.3rem)] w-full overflow-y-auto"></div>
          </div>
        </div>
        <div class="shadow-box4 h-[calc(100vh-178px)] rounded-lg">
        </div>
      </div>
<SelectType 
v-model="selectTypeValue"
ref="modalSelectType" />
    </div>
  </div>
</template>

<script setup>
import SelectType from './modal/SelectType.vue';
import ProductSearch from '@/components/ProductSearch.vue';
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();

import { computed, onMounted, ref, watch } from 'vue';
const modalSelectType = ref(null);
const distributorOptions = ref([]);
const distributor = ref([]);
const getDistributors = async () => {
  const res = await axios.get('/system/get-distributors');
  distributorOptions.value = res.data.data.map(item => {
    return {
      id: item.id,
      text: item.name
    }
  });
}
const openModalSelectType = () => {
  modalSelectType.value.show();
}
const selectTypeValue = ref([]);
const selectedProductID = ref([]);
const idwatch = computed(() => {
  return JSON.stringify(selectedProductID.value);
})
const selectedProduct = ref([]);
watch(idwatch, async (newVal) => {
  if (selectedProductID.value.length > 0) {
    systemStore.setGlobalLoading(true);
    const res = await axios.post('/storage/get-products-import',{
      productID: JSON.stringify(selectedProductID.value)
    });
    systemStore.setGlobalLoading(false);
    if (res.data.code === 'dth-200') {
      selectedProduct.value = res.data.data.map(item =>{
        return {
          ...item,
          image:  `${import.meta.env.VITE_API_URL}/images/${item.img_desc}`
        }
      });
    }
  }
})
onMounted(() => {
  getDistributors();
})
</script>

<style lang="scss" scoped>

</style>