<template>
  <div class="shadow-box2 h-[30rem] flex flex-col p-2 border border-gray-200">
    <ImageView
      :src="product.image"
      fitHeight
      class="flex justify-center border border-gray-200 h-[10rem] w-full"
    />
    <div class="text-right text-gray-500 italic">{{ storage }}</div>
    <div
      class="text-[1rem] font-[800] text-primary h-[4rem] truncate text-wrap"
    >
      {{ product.name }}
    </div>
    <div class="h-32 relative flex justify-center"
    :class="!product.price || !product.price.length ? 'items-center' : 'items-start'"
    >
      <div v-if="!product.price || !product.price.length">
        <Icon
          icon="line-md:cancel"
          class="absolute opacity-30 text-danger h-28 w-28 left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2"
        />
        <div class="text-danger">Chưa đặt giá bán</div>
      </div>
      <div v-else class="w-full pl-4 pt-4">
        <div>Giá bán:</div>
        <div v-for="(price,index) in product.price"
        :key="index"
        class="w-full"
        >
          <div class="flex gap-2 items-center justify-start w-full pl-2">
            <Icon icon="icon-park:dot" />
            <div class="text-active-700 font-bold">{{ formatMoney(price.price) }}</div> VNĐ/
            <div class="text-gray-500">{{ price.unit_name }}</div>
          </div>
      </div>
      </div>
    </div>
    <div class="italic text-[.9rem]">
      Giá nhập mới nhất: <br /><span class="text-danger font-bold">{{
        importPrice
      }}</span>
      VNĐ/ {{ product.average_import_price.unit_name }}
    </div>
    <div
      class="flex gap-2 flex-1 items-center justify-center border border-gray-300 mt-2 text-primary cursor-pointer select-none hover:bg-primary hover:text-white"
      @click="openSetPrice = true"
    >
      <Icon icon="ion:pricetag" />
      Đặt giá bán
    </div>
    <TModal v-model="openSetPrice" modalWidth="90vw">
      <template #header>
        <div class="text-primary text-[1.5rem] font-[800]">Đặt giá bán</div>
      </template>
      <template #body>
        <qt-table v-model="listPrice">
          <el-table-column label="Giá">
            <template #default="scope">
              <el-input
                v-model="listPrice[scope.$index].price"
                placeholder="Giá tiền"
                :formatter="
                  (value) => `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')
                "
                :parser="
                  (value) => value.replace(/\$\s?|(,*)/g, '').replace(/^0+/, '')
                "
              >
                <template #append> VNĐ </template>
              </el-input>
            </template>
          </el-table-column>
          <el-table-column label="Đơn vị">
            <template #default="scope">
              <FormSelect v-model="listPrice[scope.$index].unit"
              :options="unitOptions" class="mt-0"
              />
            </template>
          </el-table-column>
          <el-table-column label="Hành động">
            <template #default="scope">
              <div class="flex gap-2 justify-center items-center">
                <div
                class="flex justify-center items-center cursor-pointer p-4 shadow-box2 bg-active text-primary rounded-full"
                @click="listPrice.push({ price: null, unit: unitOptions[0].id })"
              >
              <Icon icon="ic:baseline-save" class="h-4 w-4" />
              </div>
              <div
                class="flex justify-center items-center cursor-pointer p-4 shadow-box2 bg-danger text-primary rounded-full"
                @click="listPrice.splice(scope.$index, 1)"
              >
                <Icon icon="line-md:cancel" class="h-4 w-4" />
              </div>
              </div>
            </template>
          </el-table-column>
        </qt-table>
      </template>
      <template #footer>
        <div class="flex justify-end gap-2">
          <button class="mr-4 !bg-danger-500" @click="openSetPrice = false">
            Hủy
          </button>
          <button @click="saveClick" class="mr-4">Lưu lại</button>
        </div>
      </template>
    </TModal>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue';
import { useToast } from 'vue-toast-notification';
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();


const toast = useToast();

const product = defineModel();
const storage = computed(() => {
  let r = 'Kho: ';
  const quantity = product.value.unit.forEach((unit) => {
    r += unit.quantity + ' ' + unit.name + ', ';
  });
  return r.slice(0, -2);
});
const importPrice = computed(() => {
  const price = (
    product.value.average_import_price.average_import_price + ''
  ).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  return price;
});
const openSetPrice = ref(false);
const listPrice = ref([]);
const unitOptions = product.value.unit.map((unit) => {
  return {
    id: unit.id,
    text: unit.name,
  };
});
const saveClick = async() => {
  if(listPrice.value.length == 0){
    toast.error('Vui lòng nhập giá');
    return;
  }
  // check if unit duplicate
  const unitDuplicate = listPrice.value.some((price, index) => {
    return listPrice.value.some((price2, index2) => {
      return index != index2 && price.unit == price2.unit;
    });
  });
  if (unitDuplicate) {
    toast.error('Đơn vị trùng nhau');
    return;
  }
  systemStore.setGlobalLoading(true);
  const res = await axios.post('/storage/set-product-price', {
    product_id: product.value.id,
    prices: listPrice.value,
  });
  systemStore.setGlobalLoading(false);
  if (res.data.code == 'dth-200') {
    toast.success('Đặt giá thành công');
    openSetPrice.value = false;
    emit('reloadProducts');
  } else {
    toast.error(res.data.message);
  }
};
const formatMoney = (value) => {
  return `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};
const emit = defineEmits(['reloadProducts']);
onMounted(() => {
  if (product.value.price) {
    listPrice.value = product.value.price.map((price) => {
      return {
        price: price.price,
        unit: price.unit_id,
      };
    });
  }
  listPrice.value.push({
    price: null,
    unit: unitOptions[0].id,
  });
});
</script>

<style lang="scss">
.el-table{
  .cell{
    overflow: visible !important;
  }
}
</style>
