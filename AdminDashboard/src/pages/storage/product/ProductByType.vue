<template>
  <TModal v-model="isShow" modalWidth="90vw" modalHeight="90vh">
    <template #header>
      <div class="flex items-center gap-4">
        <Icon :icon="picon" class="w-8 h-8" />
        <span>{{ pname }}</span>
        <Icon icon="ion:chevron-forward" />
        <Icon :icon="typeicon" class="w-8 h-8" />
        <span>{{ typename }}</span>
      </div>
    </template>
    <template #body>
      <div class="info-row mt-4">
        <div class="key">
          Danh sách sản phẩm
        </div>
        <div class="value">
          <qt-table v-model="listProductAll" height="520">
            <el-table-column label="Hình ảnh sản phẩm">
                <template #default="scope">
                  <ImageView :src="scope.row.img_desc" alt="image" class="w-full mx-auto object-cover" />
                </template>
              </el-table-column>
              <el-table-column prop="name" label="Tên sản phẩm" width="200"></el-table-column>
              <el-table-column prop="type_name" label="Loại sản phẩm" width="150"></el-table-column>
              <el-table-column prop="company_name" label="Nhà sản xuất" width="150"></el-table-column>
              <el-table-column prop="distributor_name" label="Nhà phân phối" width="150"></el-table-column>
              <el-table-column prop="description" label="Mô tả sản phẩm" width="300"></el-table-column>
              <el-table-column label="Hành động" width="150">
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
    </template>
    <template #footer>
        <button class="mr-4 !bg-danger-500" @click="isShow = false">
          Hủy
        </button>
        <button @click="addProduct" class="mr-4">Thêm sản phẩm</button>
      </template>
  </TModal>
</template>

<script setup>
import { ref, getCurrentInstance, createApp } from 'vue';
const app = createApp();

const { ctx } = getCurrentInstance();
const isShow = ref(false);
const picon = ref('');
const pname = ref('');
const typeicon = ref('');
const typename = ref('');
const pid = ref('');
const type_id = ref('');
const listProductAll = ref([]);
const show = (p_id,id,p_icon,type_icon,p_name,type_name) => {
  pid.value = p_id;
  type_id.value = id;
  picon.value = p_icon;
  typeicon.value = type_icon;
  pname.value = p_name;
  typename.value = type_name;
  isShow.value = true;
}
const emit = defineEmits(['addProduct']);
const addProduct = () => {
  isShow.value = false;
  emit('addProduct',pid.value,type_id.value);
}
const actionTemplate = (parent) => {
  return function () {
    return {
      template: app.component(``, {
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
const imageTemplate = (ctx,mode) => {
  return function () {
    return {
      template: app.component(``, {
        template: `
        <ImageView :src="mode==1?data.img:data.img_desc" alt="image" class="w-full mx-auto object-cover" />
      `,
      data(){
        return{
          parent: ctx,
          mode: mode
        }
      }
      }),
    };
  };
};
const gridAllProduct_columns = [
  {
    fieldName: 'name',
    headerText: 'Tên sản phẩm',
    width: 200
  },
  {
    fieldName: 'type_name',
    headerText: 'Loại sản phẩm',
    width: 200
  },
  {
    fieldName: 'company_name',
    headerText: 'Nhà sản xuất',
    width: 200
  },
  {
    fieldName: 'distributor_name',
    headerText: 'Nhà phân phối',
    width: 200
  },
  {
    fieldName: 'description',
    headerText: 'Mô tả sản phẩm',
    width: 200
  },
  {
    fieldName: 'img',
    headerText: 'Hình ảnh sản phẩm',
    width: 200,
    template: imageTemplate(ctx,1)
  },
  {
    fieldName: 'img_desc',
    headerText: 'Hình ảnh mô tả',
    width: 200,
    template: imageTemplate(ctx,2)
  },
  {
    headerText: 'Hành động',
    width: 200,
    template: actionTemplate(ctx),
    freeze: 'Right'
  }
];


defineExpose({
  show,
  listProductAll
})
</script>
