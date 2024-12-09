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
      <li @click="reloadProduct">
        <Icon icon="flowbite:refresh-outline" />
        Lấy lại dữ liệu sản phẩm
      </li>
    </ul>
    <div class="page-content tablet:!pt-0">
      <div class="grid grid-cols-4 gap-4 p-4 pb-0">
        <div class="col-span-3 tablet:col-span-4">
          <div class="grid grid-cols-1 tablet:grid-cols-2 gap-2">
            <FormSelect
            :options="distributorOptions"
            icon="material-symbols:local-shipping-outline-sharp"
            v-model="distributor"
            mode="multiple"
            label="Nhà cung cấp"
          />
          <ProductSearch ref="productsearch" v-model="selectedProductID" />
          </div>
          <div class="box-form !ml-0 !mb-0">
            <div class="h-[calc(100vh-21.7rem)] tablet:h-[calc(100vh-32rem)] w-full overflow-y-auto
            grid grid-cols-[repeat(auto-fill,minmax(350px,1fr))] gap-2 p-2
            
            ">
              <ProductCard
                v-for="(item, index) in listProduct"
                :key="item.id"
                v-model="listProduct[index]"
                @removeProduct="selectedProductID.splice(selectedProductID.indexOf(item.id), 1)"
              />
            </div>
          </div>
        </div>
        <div class="tablet:col-span-4 shadow-box4 h-[calc(100vh-178px)] tablet:h-[15rem] rounded-lg"></div>
      </div>
      <SelectType v-model="selectTypeValue" ref="modalSelectType" />
    </div>
  </div>
</template>

<script setup>
import SelectType from './modal/SelectType.vue';
import ProductSearch from '@/components/ProductSearch.vue';
import ProductCard from './part/ProdcutCard.vue';
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();

import { computed, onMounted, ref, watch } from 'vue';
const modalSelectType = ref(null);
const distributorOptions = ref([]);
const distributor = ref([]);
const getDistributors = async () => {
  const res = await axios.get('/system/get-distributors');
  distributorOptions.value = res.data.data.map((item) => {
    return {
      id: item.id,
      text: item.name,
    };
  });
};
const openModalSelectType = () => {
  modalSelectType.value.show();
};
const selectTypeValue = ref([]);
const selectedProductID = ref([]);
const idwatch = computed(() => {
  return JSON.stringify(selectedProductID.value);
});
const listProduct = ref([]);
watch(idwatch, async (newVal) => {
  const idJustAdd = selectedProductID.value.filter(
    (item) => !listProduct.value.map((i) => i.id).includes(item),
  );
  if (idJustAdd.length > 0) {
    systemStore.setGlobalLoading(true);
    const res = await axios.post('/storage/get-product-import', {
      id: idJustAdd[0],
    });
    systemStore.setGlobalLoading(false);
    if (res.data.code === 'dth-200') {
      listProduct.value = listProduct.value.concat(res.data.data);
    }
  }
  listProduct.value = listProduct.value.filter((item) =>
    selectedProductID.value.includes(item.id),
  );
});
onMounted(() => {
  getDistributors();
});
const productsearch = ref(null);
const reloadProduct = () => {
  productsearch.value.getListProduct();
};
</script>

<style lang="scss" scoped></style>
