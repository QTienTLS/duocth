<template>
  <div>
    <div class="page-title flex gap-2">
      <Icon icon="la:shipping-fast" width="2em" height="2em" />
      Nhập hàng
    </div>
    <ul class="top-button-list">
      <li @click="importProduct">
        <Icon icon="mingcute:check-2-fill" />
        Nhập lô hàng
      </li>
      <li @click="reloadProduct">
        <Icon icon="flowbite:refresh-outline" />
        Lấy lại dữ liệu sản phẩm
      </li>
      <li @click="deleteMockData">
        <Icon icon="pajamas:remove" />
        Xóa dữ liệu nhập thử
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
              label="Nhà cung cấp"
            />
            <ProductSearch ref="productsearch" v-model="selectedProductID" />
          </div>
          <div class="box-form !ml-0 !mb-0">
            <div
              class="h-[calc(100vh-21.7rem)] tablet:h-[calc(100vh-32rem)] w-full overflow-y-auto grid grid-cols-[repeat(auto-fill,minmax(200px,1fr))] gap-2 p-2"
            >
              <ProductCard
                v-for="(item, index) in listProduct"
                :key="item.id"
                v-model="listProduct[index]"
                @removeProduct="
                  selectedProductID.splice(
                    selectedProductID.indexOf(item.id),
                    1,
                  )
                "
              />
            </div>
          </div>
        </div>
        <div
          class="tablet:col-span-4 shadow-box4 h-[calc(100vh-178px)] tablet:h-[12rem] rounded-lg"
        >
          <div class="grid grid-cols-1 gap-4 tablet:grid-cols-2">
            <div class="p-4 h-16">
              Tổng số mặt hàng:
              <span class="text-danger">{{ statics.numberProduct }}</span>
            </div>
            <div class="p-4 h-16">
              Tổng giá trị hàng:
              <span class="text-danger">{{ statics.totalMoney }}</span> vnđ
            </div>
          </div>
        </div>
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
import { useToast } from 'vue-toast-notification';
const toast = useToast();

import { computed, onMounted, ref, watch } from 'vue';
const modalSelectType = ref(null);
const distributorOptions = ref([]);
const distributor = ref('');
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
const importProduct = async () => {
  if (!distributor.value) {
    toast.error('Vui lòng chọn nhà cung cấp');
    return;
  }
  const listImport = [];
  listProduct.value.forEach((item) => {
    if (item.quantity === 0) {
      toast.error('Vui lòng nhập số lượng sản phẩm');
      return;
    }
    listImport.push({
      product_id: item.id,
      quantity: item.quantity,
      unit: item.unit,
      price: item.price,
    });
  });
  if (listImport.length === 0) {
    toast.error('Vui lòng chọn sản phẩm');
    return;
  }
  systemStore.setGlobalLoading(true);
  const res = await axios.post('/storage/import-product', {
    distributor_id: distributor.value,
    listImport: JSON.stringify(listImport),
  });
  systemStore.setGlobalLoading(false);
  if (res.data.code === 'dth-200') {
    toast.success('Nhập hàng thành công');
    listProduct.value = [];
    selectedProductID.value = [];
  } else {
    toast.error('Nhập hàng thất bại:' + res.data.message);
  }
};
const deleteMockData = async () => {
  systemStore.setGlobalLoading(true);
  const res = await axios.get('/storage/delete-import-data');
  systemStore.setGlobalLoading(false);
  if (res.data.code === 'dth-200') {
    toast.success('Xóa dữ liệu nhập thử thành công');
  } else {
    toast.error('Xóa dữ liệu nhập thử thất bại:' + res.data.message);
  }
};
const statics = computed(() => {
  const numberProduct = listProduct.value.length;
  const totalMoney = listProduct.value.reduce((total, item) => {
    return total + item.price * 1;
  }, 0);
  return {
    numberProduct,
    totalMoney: (totalMoney + '').replace(/\B(?=(\d{3})+(?!\d))/g, ','),
  };
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
