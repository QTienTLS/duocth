<template>
  <div class="">
    <div class="page-title">Nhà phân phối </div>
    <div class="page-content">
      <div class="box-form">
        <div class="info-row">
          <div class="key">
            Danh mục nhà phân phối
            <ul>
              <li @click="addCom">
                <Icon icon="material-symbols:add" /> Thêm mới
              </li>
            </ul>
          </div>
          <div class="value">
            <DataGrid
              :dataSource="listCongTy"
              :columns="grid_columns"
              panelDataHeight="500px"
              :showSTT="true"
            >
            </DataGrid>
          </div>
        </div>
      </div>
    </div>
    <TModal v-model="openModal">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div class="p-4">
          <FormInput
            icon="material-symbols:local-shipping-outline-sharp"
            v-model="fullName"
            label="Tên nhà phân phối"
          />
          <FormInput
            icon="material-symbols:local-shipping-outline-sharp"
            v-model="name"
            label="Tên rút gọn"
          />
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
import { getCurrentInstance, onMounted, ref, createApp } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
const toast = useToast();
import useConfirm from '../../plugins/confirm';
const app = createApp();
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();

const { ctx } = getCurrentInstance();
const openModal = ref(false);
const modalTitle = ref('Thêm mới nhà phân phối');
const image = ref(null);
const fullName = ref('');
const name = ref('');
const listCongTy = ref([]);
const modalMode = ref('add');
const addCom = () => {
  modalMode.value = 'add';
  modalTitle.value = 'Thêm mới nhà phân phối';
  image.value = null;
  fullName.value = '';
  name.value = '';
  openModal.value = true;
};
const actionTemplate = (parent) => {
  return function () {
    return {
      template: app.component('', {
        template: `
        <div class="flex justify-center gap-4">
          <GridButton title="Chỉnh sửa" icon="ri:edit-2-line" type="primary" @click="editRow(data)"></GridButton>
          <GridButton title="Xóa" icon="material-symbols:delete-sharp" type="danger" @click="deleteRow(data)"></GridButton>
        </div>
      `,
        data() {
          return {
            parent: parent,
          };
        },
        methods: {
          editRow(data) {
            editRow(data);
          },
          deleteRow(data) {
            deleteRow(data);
          },
        },
      }),
    };
  };
};
const deleteRow = async (data) => {
  const confirm = await useConfirm({
    title: 'Xác nhận xóa',
    message: 'Bạn có chắc chắn muốn xóa nhà phân phối này không?',
  });
  if (confirm) {
    systemStore.setGlobalLoading(true);
    const res = await axios.post('/system/delete-distributor', { id: data.id });
    systemStore.setGlobalLoading(false);
    if (res.data.code == 'dth-200') {
      toast.success('Xóa nhà phân phối thành công');
      getCongTy();
    }
  }
};
const selectId = ref('');
const editRow = (data) => {
  modalMode.value = 'edit';
  selectId.value = data.id;
  modalTitle.value = 'Chỉnh sửa nhà phân phối';
  image.value = null;
  fullName.value = data.fullName;
  name.value = data.name;
  openModal.value = true;
};
const saveClick = async () => {
  if (modalMode.value === 'add') {
    systemStore.setGlobalLoading(true);
    const res = await axios.post(
      '/system/add-distributor',
      {
        fullName: fullName.value,
        name: name.value,
      },
    );
    systemStore.setGlobalLoading(false);
    if (res.data.code == 'dth-200') {
      toast.success('Thêm mới nhà phân phối thành công');
      openModal.value = false;
      getCongTy();
    }
  }
  else {
    systemStore.setGlobalLoading(true);
    const res = await axios.post(
      '/system/edit-distributor',
      {
        id: selectId.value,
        fullName: fullName.value,
        name: name.value,
      },
    );
    systemStore.setGlobalLoading(false);
    if(res.data.code == 'dth-200'){
      toast.success('Chỉnh sửa nhà phân phối thành công');
      openModal.value = false;
      getCongTy();
    }
  }
};
const getCongTy = async () => {
  listCongTy.value = [];
  systemStore.setGlobalLoading(true);
  const res = await axios.get('/system/get-distributors');
  systemStore.setGlobalLoading(false);
  listCongTy.value = res.data.data;
};
onMounted(() => {
  getCongTy();
});
const grid_columns = [
  { headerText: 'Tên nhà phân phối', fieldName: 'fullName', width: 400 },
  { headerText: 'Tên rút gọn', fieldName: 'name', width: 300 },
  { headerText: 'Hành động', width: 200, template: actionTemplate(ctx) },
];
</script>

<style lang="scss" scoped></style>
