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
            <DataGrid
              :dataSource="listMenu"
              :columns="grid_columns"
              panelDataHeight="200px"
            />
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
            v-model="menuName"
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
import { createApp, ref, getCurrentInstance, computed } from 'vue';
import { useToast } from 'vue-toast-notification';
const { ctx } = getCurrentInstance();
const toast = useToast();
const app = createApp();
const listMenu = ref([{ icon: 'ic:baseline-delete' }]);

const iconTemplate = (parent) => {
  return function () {
    return {
      template: app.component('iconTemplate', {
        template: `<Icon :icon="data.icon" class="mx-auto" height="1rem" width="1rem" />`,
        data() {
          return {
            parent: parent,
          };
        },
      }),
    };
  };
};
const grid_columns = [
  {
    fieldName: 'stt',
    headerText: 'STT',
    width: '50px',
    textAlign: 'center',
  },
  // {
  //   fieldName: 'parent',
  //   headerText: 'Danh mục cha',
  //   isGroupedColumn: true,
  // },
  {
    fieldName: 'id',
    headerText: 'ID',
    width: '50px',
    textAlign: 'center',
  },
  {
    fieldName: 'name',
    headerText: 'Tên danh mục',
    width: '120px',
  },
  {
    fieldName: 'icon',
    headerText: 'Icon',
    width: '70px',
    template: iconTemplate(ctx),
  },
  {
    headerText: 'Hành động',
    width: '100px',
  },
];

const openModal = ref(false);
// ---1: thêm mới, 2: sửa
const modalMode = ref(1);
const modalTitle = computed(() => {
  return modalMode.value === 1 ? 'Thêm mới danh mục' : 'Sửa danh mục';
});
const addMenu = () => {
  modalMode.value = 1;
  menuName.value = '';
  menuType.value = '';
  parentMenu.value = '';
  menuURL.value = '';
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
};
const checkInputMenu = () => {
  if(!menuName.value) {
    toast.error('Vui lòng nhập tên danh mục');
    return false;
  }
}
const addSaveMenu = async () => {
  if(!checkInputMenu()) return;
}
</script>

<style lang="scss" scoped></style>
