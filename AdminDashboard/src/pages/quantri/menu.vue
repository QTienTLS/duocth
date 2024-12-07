<template>
  <div>
    <div class="page-title">Quản lý danh mục</div>
    <div class="page-content">
      <div class="box-form">
        <div class="info-row">
          <div class="key relative">
            Danh sách menu
            <div
              class="absolute right-4 -top-2 text-sm bg-[#005F39] text-white px-2 py-[5px] rounded-md hover:bg-white hover:text-[#005F39] cursor-pointer hover:border border-[#005F39] flex items-center"
              @click="addMenu"
            >
              <Icon icon="material-symbols:add" /> Thêm mới
            </div>
          </div>
          <div class="value">
            <qt-table v-model="listMenu">
                <el-table-column prop="id" label="ID" width="50"></el-table-column>
                <el-table-column prop="name" label="Tên danh mục"></el-table-column>
                <el-table-column prop="url" label="URL"></el-table-column>
                <el-table-column prop="p_name" label="Danh mục cha"></el-table-column>
                <el-table-column label="Icon " width="100">
                  <template #default="scope">
                    <Icon :icon="scope.row.icon" class="mx-auto" height="1.5rem" width="1.5rem" />
                  </template>
                </el-table-column>
                <el-table-column label="Hành động" width="200" fixed="right">
                  <template #default="scope">
                    <div class="flex justify-center gap-4">
                      <GridButton title="Chỉnh sửa" icon="ri:edit-2-line" type="primary" @click="editRow(scope.row)"></GridButton>
                      <GridButton title="Xóa" icon="material-symbols:delete-sharp" type="danger" @click="deleteRow(scope.row)"></GridButton>
                    </div>
                  </template>
                </el-table-column>
            </qt-table>
          </div>
        </div>
      </div>
    </div>
    <TModal v-model="openModal" modalWidth="800px" modalHeight="80%">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div class="p-4">
          <FormInput
            icon="gg:menu-grid-o"
            v-model="menuName"
            label="Tên danh mục"
          />
          <FormInput
            icon="mdi:emoticon-happy-outline"
            v-model="menuIcon"
            label="Icon"
          />
          <FormSelect
            label="Loại danh mục"
            icon="solar:ranking-line-duotone"
            v-model="menuType"
            :options="menuTypeOptions"
          />
          <FormSelect
            label="Danh mục cha"
            v-show="menuType === 2"
            icon="carbon:parent-child"
            v-model="parentMenu"
            :options="listParentMenu"
          />
          <FormInput v-model="menuURL" label="URL" icon="line-md:link" />
        </div>
      </template>
      <template #footer>
          <button class="mr-4" @click="openModal = false">Hủy</button>
          <button 
          @click="saveClick"
          class="mr-4">Lưu lại</button>
      </template>
    </TModal>
  </div>
</template>

<script setup>
import { createApp, ref, getCurrentInstance, computed, onMounted, onUnmounted } from 'vue';
import { useToast } from 'vue-toast-notification';
import axios from '@/plugins/axiosPlugin';
const { ctx } = getCurrentInstance();
const toast = useToast();
const app = createApp();
const listMenu = ref([]);

const openModal = ref(false);
// ---1: thêm mới, 2: sửa
const modalMode = ref(1);
const menuIcon = ref('');
const modalTitle = computed(() => {
  return modalMode.value === 1 ? 'Thêm mới danh mục' : 'Sửa danh mục';
});
const addMenu = () => {
  modalMode.value = 1;
  menuName.value = '';
  menuType.value = '';
  parentMenu.value = '';
  menuURL.value = '';
  menuIcon.value = '';
  openModal.value = true;
};
const selectId = ref('');
const editRow = (data) => {
  modalMode.value = 2;
  selectId.value = data.id;
  menuName.value = data.name;
  menuType.value = data.p_id? 2 : 1;
  parentMenu.value = data.p_id;
  menuURL.value = data.url;
  menuIcon.value = data.icon;
  openModal.value = true;
};
const menuTypeOptions = [
  { id: 1, text: 'Danh mục cha' },
  { id: 2, text: 'Danh mục con' },
];
const menuType = ref('');
const menuName = ref('');
const parentMenu = ref('');
const listParentMenu = ref([]);
const menuURL = ref('');
const saveClick = () => {
  if(modalMode.value === 1)
  addSaveMenu();
  else editSaveMenu();
};
onUnmounted(() => {
  console.log('unmount');
  
});
const editSaveMenu = async () => {
  if(!checkInputMenu()) return;
  const data = {
    id: selectId.value,
    name: menuName.value,
    type: menuType.value,
    parent: parentMenu.value,
    url: menuURL.value,
    icon: menuIcon.value,
  };
  let res = await axios.post('/system/edit-menu', data);
  if(res.data.code == 'dth-200'){
    toast.success('Chỉnh sửa danh mục thành công');
    openModal.value = false;
    getListMenu();
  }
}
const checkInputMenu = () => {
  if(!menuName.value) {
    toast.error('Vui lòng nhập tên danh mục');
    return false;
  }
  return true;
}
const getListMenu = async () => {
  let res = await axios.get('/system/get-menus');
  listMenu.value = res.data.data.map((item, index) => {
    return {
      ...item,
      p_name: item.p_name || 'Không có',
      stt: index + 1,
    };
  });
};
const getParentMenus = async () => {
  let res = await axios.get('/system/get-parent-menus');
  listParentMenu.value = res.data.data.map((item) => {
    return {
      id: item.id,
      text: item.name,
    };
  });
};
onMounted(() => {
  getListMenu();
  getParentMenus();
});
const addSaveMenu = async () => {
  if(!checkInputMenu()) return;
  const data = {
    name: menuName.value,
    type: menuType.value,
    parent: parentMenu.value,
    url: menuURL.value,
    icon: menuIcon.value,
  };
  let res = await axios.post('/system/add-menu', data);
  if(res.data.code == 'dth-200'){
    toast.success('Thêm mới danh mục thành công');
    openModal.value = false;
    getListMenu();
  }
}
</script>

<style lang="scss" scoped></style>
