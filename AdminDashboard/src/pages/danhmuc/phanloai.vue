<template>
  <div class="">
    <div class="page-title">Phân loại mặt hàng</div>
    <div class="page-content">
      <div class="box-form">
        <div class="info-row">
          <div class="key">
            Danh mục loại
            <ul>
              <li @click="addCom">
                <Icon icon="material-symbols:add" /> Thêm mới
              </li>
            </ul>
          </div>
          <div class="value">
            <DataGrid
              :dataSource="listType"
              :columns="grid_columns"
              panelDataHeight="500px"
              :showSTT="true"
            >
            </DataGrid>
          </div>
        </div>
      </div>
    </div>
    <TModal v-model="openModal" modalHeight="800px">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div class="p-4">
          <FormInput
            icon="game-icons:medicines"
            v-model="typeName"
            label="Tên loại"
          />
          <FormSelect
            label="Cấp loại"
            icon="solar:ranking-line-duotone"
            v-model="typeLevel"
            :options="[ { id: 1, text: 'Cấp 1' }, { id: 2, text: 'Cấp 2' }]"
          />
          <FormSelect
            label="Loại cha"
            icon="solar:ranking-line-duotone"
            v-show="typeLevel === 2"
            v-model="parentType"
            :options="listParentType"
          />
          <FormInput v-model="typeIcon" label="Icon" icon="mdi:pill" />
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
const modalTitle = ref('Thêm mới');
const typeName = ref('');
const typeLevel = ref(1);
const parentType = ref('');
const typeIcon = ref('');
const modalMode = ref('add');
const addCom = () => {
  modalMode.value = 'add';
  typeLevel.value = 1;
  typeName.value = '';
  typeIcon.value = '';
  parentType.value = '';
  modalTitle.value = 'Thêm mới';
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
const iconTemplate = (parent) => {
  return function () {
    return {
      template: app.component('',{
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
const deleteRow = async (data) => {
  const confirm = await useConfirm({
    title: 'Xác nhận xóa',
    message: 'Bạn có chắc chắn muốn xóa loại này không?',
  });
  if (confirm) {
    systemStore.setGlobalLoading(true);
    const res = await axios.post('/system/delete-type', { id: data.id });
    systemStore.setGlobalLoading(false);
    if (res.data.code == 'dth-200') {
      toast.success('Xóa loại thành công');
      getType();
    }
  }
};
const selectId = ref('');
const editRow = (data) => {
  modalMode.value = 'edit';
  selectId.value = data.id;
  typeName.value = data.name;
  typeLevel.value = data.level;
  parentType.value = data.p_id;
  typeIcon.value = data.icon;
  modalTitle.value = 'Chỉnh sửa loại';
  openModal.value = true;
};
const saveClick = async () => {
  if (modalMode.value === 'add') {
    systemStore.setGlobalLoading(true);
    const res = await axios.post(
      '/system/add-type',
      {
        name: typeName.value,
        level: typeLevel.value,
        parentId: parentType.value,
        icon: typeIcon.value,
      },
    );
    systemStore.setGlobalLoading(false);
    if (res.data.code == 'dth-200') {
      toast.success('Thêm mới loại thành công');
      openModal.value = false;
      getType();
      getParentList();
    }
    else
    {
      openModal.value = false;
      toast.error(res.data.message.split('-')[1]);
    }
  }
  else {
    systemStore.setGlobalLoading(true);
    const res = await axios.post(
      '/system/edit-type',
      {
        id: selectId.value,
        name: typeName.value,
        level: typeLevel.value,
        parentId: parentType.value,
        icon: typeIcon.value,
      },
    );
    systemStore.setGlobalLoading(false);
    if(res.data.code == 'dth-200'){
      toast.success('Chỉnh sửa loại thành công');
      openModal.value = false;
      getType();
      getParentList();
    }
  }
};
const listType = ref([]);
const getType = async () => {
  listType.value = [];
  systemStore.setGlobalLoading(true);
  const res = await axios.get('/system/get-types-tree');
  systemStore.setGlobalLoading(false);
  listType.value = res.data.data;
};
const listParentType = ref([]);
const getParentList = async () => {
  const res = await axios.post('/system/get-types',{level: 1});
  listParentType.value = res.data.data.map(item => {
    return {
      id: item.id,
      text: item.name,
    };
  });
};
onMounted(() => {
  getParentList();
  getType();
});
const grid_columns = [
  { headerText: 'Tên loại', fieldName: 'name', width: 400 },
  { headerText: '', fieldName: 'p_name', isGroupedColumn: true },
  { headerText: 'Icon', fieldName: 'icon', width: 200, template:iconTemplate(ctx) },
  { headerText: 'Hành động', width: 200, template: actionTemplate(ctx) },
];
</script>

<style lang="scss" scoped></style>
