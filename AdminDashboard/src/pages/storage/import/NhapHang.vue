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
        </div>
        <div class="shadow-box2 h-[calc(100vh-176px)]">

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
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();

import { onMounted, ref } from 'vue';
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
onMounted(() => {
  getDistributors();
})
</script>

<style lang="scss" scoped>

</style>