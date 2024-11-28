<template>
  <div>
    <div class="page-title">Quản lý sản phẩm</div>
    <ul class="top-button-list">
      <li @click="addItem(null,null)">
        <Icon icon="mdi:add-bold" />
        Thêm mới
      </li>
      <li @click="goto('listproduct')">
        <Icon icon="fluent-mdl2:product-list" />
        Danh sách mặt hàng
      </li>
    </ul>
    <div class="page-content">
      <div class="grid grid-cols-5 gap-8">
        <div
          v-for="(item, index) in treeList"
          class="card"
          :key="index"
          :style="{ backgroundColor: lightColor[index % lightColor.length] }"
        >
          <div
            class="card__icon"
            :style="{ backgroundColor: listColor[index % listColor.length] }"
          >
            <Icon :icon="item.icon" height="1.6rem" width="1.6rem" />
          </div>
          <div class="card__name">{{ item.name }}</div>
          <div class="card__number">
            <span class="text">Số loại mặt hàng:</span>
            <span
              class="number"
              :style="{ color: listColor[index % listColor.length] }"
              >{{ item.children.length }}</span
            >
          </div>
        </div>
      </div>

      <div class="grid grid-cols-2 gap-8 mt-12 mb-12">
        <TypeGroup
          v-for="(item, index) in treeList"
          :treeList="item"
          :key="index"
          @itemClick="addItem"
        ></TypeGroup>
      </div>
      <div class="box-form" id="listproduct">
        <div class="info-row">
          <div class="key">Danh sách sản phẩm</div>
          <div class="value">
            <DataGrid />
          </div>
        </div>
      </div>
    </div>
    <TModal v-model="openModal" modalWidth="70vw" modalHeight="80vh">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div>
          <div class="grid grid-cols-3 gap-4 gap-y-0 mt-4">
          <FormInput v-model="productName"  label="Tên sản phẩm" icon="fluent-mdl2:product" />
          <FormTextArea v-model="productDescription"  label="Mô tả sản phẩm" :rows="5" icon="fluent:text-description-16-filled" />
          <FormSelect v-model="productParentType"   label="Danh mục sản phẩm" icon="grommet-icons:catalog-option" />
          <FormSelect v-model="productType"   label="Loại sản phẩm" icon="tdesign:catalog" />
          <FormSelect v-model="company"   label="Nhà sản xuất" icon="mdi:drugs" />
          <FormSelect v-model="distributor"   label="Nhà phân phối" icon="material-symbols:local-shipping-outline-sharp" />
          <div class="info-row">
            <div class="key">Hình ảnh sản phẩm</div>
            <div class="value">
              <ImageInput v-model="productImg" />
            </div>
          </div>
          <div class="info-row">
            <div class="key">Hình ảnh mô tả</div>
            <div class="value">
              <ImageInput v-model="productImgDesc" />
            </div>
          </div>
        </div>
        </div>

      </template>
      <template #footer>
        <button class="mr-4 !bg-danger-500" @click="openModal = false">
          Hủy
        </button>
        <button @click="saveClick" class="mr-4">Lưu lại</button>
      </template>
    </TModal>
  </div>
</template>

<script setup>
import { inject, onMounted, ref } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
import TypeGroup from './TypeGroup.vue';
const toast = useToast();
const listColor = ['#488BF6', '#EB5B00', '#50B04E', '#CA7373', '#7E60BF'];
const lightColor = ['#E6F0FF', '#FEEFEB', '#E9F4E8', '#FCECEC', '#F4F0FF'];

const goto = (id) => {
  const element = document.getElementById(id);
  element.scrollIntoView({ behavior: 'smooth' });
};
const treeList = ref([]);
const getTreeList = async () => {
  treeList.value = [];
  const res = await axios.get('/storage/get-types-tree');
  if (res.data.code === 'dth-200') {
    treeList.value = res.data.data;
  } else toast.error(res.data.message);
};
// modal
const openModal = ref(false);
const modalTitle = ref('');
const productName = ref('');
const productDescription = ref('');
const productParentType = ref('');
const productType = ref('');
const company = ref('');
const distributor = ref('');
const addItem = (p_id, id) => {
  modalTitle.value = 'Thêm mới sản phẩm';
  productParentType.value = p_id;
  productType.value = id;
  openModal.value = true;
};
onMounted(() => {
  getTreeList();
});
</script>

<style lang="scss" scoped>
html {
  scroll-behavior: smooth;
}
.card {
  position: relative;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
  border-radius: 6px;
  height: 9rem;
  padding: 0 1rem;
  &__icon {
    position: absolute;
    left: -1rem;
    top: -1rem;
    height: 4rem;
    width: 4rem;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 6px;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
  }
  &__name {
    font-size: 1.2rem;
    font-weight: 500;
    margin-top: 1rem;
    text-align: right;
  }
  &__number {
    position: absolute;
    bottom: 0rem;
    right: 1rem;
    display: flex;
    align-items: center;
    span.number {
      font-size: 2rem;
      font-weight: 900;
    }
    span.text {
      margin-right: 10px;
      margin-bottom: -6px;
    }
  }
}
</style>
