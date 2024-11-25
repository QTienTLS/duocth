<template>
  <div>
    <div class="page-title">Đơn vị</div>
    <div class="page-content">
      <div class="box-form">
        <div class="info-row">
          <div class="key">
            Đơn vị
            <ul class="listButton">
              <li @click="openAdd">
                <Icon icon="material-symbols:add" /> Thêm mới
              </li>
            </ul>
          </div>
          <div class="value">
            <DataGrid
        :dataSource="listDonVi"
        :columns="grid_columns"
        panelDataHeight="500px"
        :showSTT="true"
        />
          </div>
        </div>
      </div>

    </div>
    <Loading v-model="loadingModal">
      <TModal v-model="openModal" modalWidth="300px" modalHeight="300px">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div class="p-4">
          <FormInput
            icon="ph:unite-duotone"
            v-model="unitName"
            label="Tên đơn vị"
          />
        </div>
      </template>
      <template #footer>
        <button class="mr-4" @click="openModal = false">Hủy</button>
          <button 
          @click="saveClick"
          class="mr-4">Lưu lại</button>
      </template>
    </TModal>
    </Loading>
  </div>
</template>

<script setup>
import { ref, onMounted, getCurrentInstance, createApp } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
import useConfirm from '../../plugins/confirm';
import { useSystemStore } from '../../stores/system';
// const confirm = useConfirm();
const toast = useToast();
const systemStore = useSystemStore();
const { ctx } = getCurrentInstance();
const app = createApp();

const actionTemplate = (parent) => {
  return function () {
    return {
      template: app.component('action-template',{
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
    })
    }
  };
};
const listDonVi = ref([]);
const openModal = ref(false);
const modalTitle = ref('');
const moddalMode = ref(1);
const unitName = ref('');
const loadingModal = ref(false);
const grid_columns = ref([
  {
    fieldName: 'id',
    headerText: 'ID',
    width: '50px',
    textAlign: 'center',
  },
  {
    fieldName: 'name',
    headerText: 'Tên đơn vị',
    width: '200px',
  },
  {
    fieldName: 'action',
    headerText: 'Thao tác',
    width: '100px',
    textAlign: 'center',
    template: actionTemplate(ctx),
  },
]);
const openAdd = () => {
  modalTitle.value = 'Thêm mới đơn vị';
  moddalMode.value = 1;
  openModal.value = true;
  unitName.value = '';
};
const editRow = (data) => {
  modalTitle.value = 'Chỉnh sửa đơn vị';
  moddalMode.value = 2;
  openModal.value = true;
  unitName.value = data.name;
  unitId.value = data.id;
};
const deleteRow = async(data) => {
  
  const result = await useConfirm({
    title: 'Xác nhận xóa',
    message: 'Bạn có chắc chắn muốn xóa đơn vị này không?',
  });
  if(result){
    systemStore.setGlobalLoading(true);
    let res = await axios.post('/system/delete-unit', {
      id: data.id,
    });
    systemStore.setGlobalLoading(false);
    if (res.data.code === 'dth-200') {
      toast.success('Xóa thành công');
      getUnitList();
    }
  }
};
const unitId = ref(0);
const saveClick = async() => {
  if (moddalMode.value === 1) {
    loadingModal.value = true;
    let res = await axios.post('/system/add-unit', {
      name: unitName.value,
    });
    loadingModal.value = false;
    if (res.data.code === 'dth-200') {
      toast.success('Thêm mới thành công');
      getUnitList();
      openModal.value = false;
    }
  } else {
    loadingModal.value = true;
    let res = await axios.post('/system/edit-unit', {
      id: unitId.value,
      name: unitName.value,
    });
    loadingModal.value = false;
    if (res.data.code === 'dth-200') {
      toast.success('Chỉnh sửa thành công');
      getUnitList();
      openModal.value = false;
    }
  }
};
const getUnitList = async() => {
  let res = await axios.get('/system/get-unit-list');
  listDonVi.value = res.data.data;
};
onMounted(() => {
  getUnitList();
});
</script>

<style lang="scss" scoped>

</style>