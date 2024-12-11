<template>
  <div class="">
    <div class="page-title flex gap-2">
      <Icon icon="vaadin:storage" width="2em" height="2em" />
      Kho hàng
    </div>
    <ul class="top-button-list">
      <li>
        <router-link to="/storage/import">
          <Icon icon="la:shipping-fast" />
          Nhập hàng
        </router-link>
      </li>
    </ul>
    <div class="page-content">
      <div class="box-form h-[calc(100vh-11.5rem)] w-full">
        <div class="h-full flex flex-col gap-2">
          <div class="overflow-y-auto flex-1 border p-2 border-gray-200
          grid grid-cols-[repeat(auto-fill,minmax(250px,1fr))] gap-4
          ">
            <ProductCard v-for="(product, index) in listProducts" :key="product.id" v-model="listProducts[index]"
            @reloadProducts="getProducts"
            />
          </div>
          <!-- phân trang -->
          <el-pagination
            class="overflow-x-auto"
            background
            layout="prev, pager, next, jumper, sizes, ->, total"
            :total="totalProducts"
            :page-sizes="[10, 100, 200, 300, 400]"
            v-model:current-page="currentPage"
            v-model:page-size="pageSize"
            @current-change="handleCurrentChangePage"
            @size-change="handleSizeChange"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();
import { useToast } from 'vue-toast-notification';
import ProductCard from './ProductCard.vue';
const toast = useToast();

const currentPage = ref(1);
const pageSize = ref(10);
const totalProducts = ref(0);
const listProducts = ref([]);
const getProducts = async () => {
  systemStore.setGlobalLoading(true);
  const res = await axios.post('/storage/get-storage-products',{
    page_num: currentPage.value,
    page_size: pageSize.value,
  });
  systemStore.setGlobalLoading(false);
  if (res.data.code == 'dth-200') {
    listProducts.value = res.data.data.products;
    totalProducts.value = res.data.data.total;
  } else {
    toast.error(res.data.message);
  }
}

const handleCurrentChangePage = (val) => {
  currentPage.value = val;
  getProducts();
}
const handleSizeChange = (val) => {
  pageSize.value = val;
  getProducts();
}

onMounted(() => {
  getProducts();
});
</script>

<style lang="scss" scoped></style>
