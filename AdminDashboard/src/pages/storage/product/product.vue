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
            <DataGrid
            :columns="gridAllProduct_columns"
            :dataSource="listProductAll"
            panelDataHeight="500px"
            :showSTT="true"
            :allowTextWrap="true"
            />
          </div>
        </div>
      </div>
    </div>
    <TModal v-model="openModal" modalWidth="70vw" modalHeight="80vh">
      <template #header>
        <div class="text-xl font-bold text-left">{{ modalTitle }}</div>
      </template>
      <template #body>
        <div class="overflow-y-auto h-full">
          <div class="grid grid-cols-8 gap-4 gap-y-0 mt-4 ">
          <FormInput v-model="productName" class="col-span-3"  label="Tên sản phẩm" icon="fluent-mdl2:product" />
          <FormTextArea v-model="productDescription" class="col-span-5"  label="Mô tả sản phẩm" :rows="5" icon="fluent:text-description-16-filled" />
          <FormSelect v-model="productParentType" :options="listParentType" class="col-span-2"  label="Danh mục sản phẩm" icon="grommet-icons:catalog-option" />
          <FormSelect v-model="productType" :options="listTypeComputed" class="col-span-2"  label="Loại sản phẩm" icon="tdesign:catalog" />
          <FormSelect v-model="company" :options="listCompany" class="col-span-2"  label="Nhà sản xuất" icon="mdi:drugs" />
          <FormSelect v-model="distributor" :options="listDistributor" class="col-span-2"  label="Nhà phân phối" icon="material-symbols:local-shipping-outline-sharp" />
          <div class="info-row col-span-4 mt-2">
            <div class="key">Hình ảnh sản phẩm</div>
            <div class="value">
              <ImageInput v-model="productImg" />
            </div>
          </div>
          <div class="info-row col-span-4 mt-2">
            <div class="key">Hình ảnh mô tả</div>
            <div class="value">
              <ImageInput v-model="productImgDesc" />
            </div>
          </div>
          <div class="col-span-8 gap-2 flex items-center" v-for="(item,index) in productUnit"
          :key="index"
          >
              <div class="grid grid-cols-2 gap-2 flex-1">
                <FormInput v-model="item.quantityFrom" label="Số lượng" />
                <FormSelect v-model="item.idFrom"  :options="listUnit" label="Đơn vị" />
              </div>
            <span>=</span>
              <div class="grid grid-cols-2 gap-2 flex-1">
                <FormInput v-model="item.quantityTo" label="Số lượng" />
                <FormSelect v-model="item.idTo"  :options="listUnit" label="Đơn vị" />
              </div>
              <div
              @click="productUnit.push({idFrom: 1, quantityFrom: 1, quantityTo: 1, idTo: 1})"
              class="h-[50px] w-[50px] flex items-center justify-center rounded-lg text-primary 
              border cursor-pointer border-primary hover:bg-primary hover:text-white">
                <Icon icon="ic:outline-save" class="h-8 w-8" />
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
import { computed, createApp, getCurrentInstance, onMounted, ref } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
import TypeGroup from './TypeGroup.vue';
import { useSystemStore } from '@/stores/system';
import useConfirm from '@/plugins/confirm';
const systemStore = useSystemStore();
const toast = useToast();
const listColor = ['#488BF6', '#EB5B00', '#50B04E', '#CA7373', '#7E60BF'];
const lightColor = ['#E6F0FF', '#FEEFEB', '#E9F4E8', '#FCECEC', '#F4F0FF'];

const app = createApp();
const { ctx } = getCurrentInstance();

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
const listUnit = ref([]);
const productImg = ref('');
const productImgDesc = ref('');
const listParentType = ref([]);
const listType = ref([]);
const listCompany = ref([]);
const listDistributor = ref([]);
const listTypeComputed = computed(() => {
  return listType.value.filter(item => item.p_id === productParentType.value);
});
const productUnit = ref([{ idFrom: 1, quantityFrom: 1, quantityTo: 1, idTo: 1 }]);
const getDataCombo = async () => {
  try {
    systemStore.setGlobalLoading(true);
    let res = await axios.get('/storage/get-data-combo-product');
    if (res.data.code === 'dth-200') {
      listUnit.value = res.data.data.units;
      listParentType.value = res.data.data.parent_types;
      listType.value = res.data.data.types;
      listCompany.value = res.data.data.companies;
      listDistributor.value = res.data.data.distributors;
    } else {
      toast.error(res.data.message);
    }
  } catch (error) {
    
  } finally {
    systemStore.setGlobalLoading(false);
  }
}
const modalMode = ref('add');
const addItem = (p_id, id) => {
  modalTitle.value = 'Thêm mới sản phẩm';
  productName.value = '';
  productDescription.value = '';
  productImg.value = '';
  productImgDesc.value = '';
  productUnit.value = [{ idFrom: 1, quantityFrom: 1, quantityTo: 1, idTo: 1 }];
  company.value = '';
  distributor.value = '';
  modalMode.value = 'add';
  productParentType.value = p_id;
  productType.value = id;
  openModal.value = true;
};
const saveClick = () => {
  if(modalMode.value === 'add')
    createNewProduct();
}
const createNewProduct = async () => {
  try {
    systemStore.setGlobalLoading(true);
    let res = await axios.post('/storage/add-product', {
      name: productName.value,
      description: productDescription.value,
      img: productImg.value,
      img_desc: productImgDesc.value,
      company_id: company.value,
      distributor_id: distributor.value,
      type_id: productType.value,
      units: JSON.stringify(productUnit.value)
    },
  {
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
    if (res.data.code === 'dth-201') {
      toast.success('Thêm mới sản phẩm thành công');
      openModal.value = false;
    } else {
      toast.error(res.data.message);
    }
  } catch (error) {
    toast.error(error.message);
  } finally {
    systemStore.setGlobalLoading(false);
  }
}
const getProducts = async (type_id, name, c_id, d_id) => {
  try {
    systemStore.setGlobalLoading(true);
    let res = await axios.post('/storage/get-products', {
        type_id: type_id,
        name: name,
        c_id: c_id,
        d_id: d_id
      });
    if (res.data.code === 'dth-200') {
      return res.data.data;
    } else {
      toast.error(res.data.message);
    }
  } catch (error) {
    toast.error(error.message);
  } finally {
    systemStore.setGlobalLoading(false);
  }
}
const listProductAll = ref([]);
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
        <img :src="mode==1?data.img:data.img_desc" alt="image" class="w-full mx-auto object-cover" />
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
const gridAllProduct_columns = computed(() => {
  if(listProductAll.value.length === 0) return [
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
  }
]
  else return [
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

]
});
const deleteRow = async(data) =>{
  const confirm = await useConfirm({
    title: 'Xác nhận xóa',
    message: 'Bạn có chắc chắn muốn xóa sản phẩm này không?',
  })
  if(!confirm) return;
  try {
    systemStore.setGlobalLoading(true);
    let res = await axios.post('/storage/delete-product', {
      id: data.id
    });
    if (res.data.code === 'dth-200') {
      toast.success('Xóa sản phẩm thành công');
      getAllProduct();
    } else {
      toast.error(res.data.message);
    }
  } catch (error) {
    toast.error(error.message);
  } finally {
    systemStore.setGlobalLoading(false);
  }
}
const getAllProduct = async() =>{
  listProductAll.value = [];
  const list = await getProducts()
  if(!list) return;
  listProductAll.value = list.map((item, index) => {
    return {
      ...item,
      type_name: listType.value.find(type => type.id === item.type_id)?.text,
      img: item.img ? `${import.meta.env.VITE_API_URL}/images/${item.img}` : '',
      img_desc: item.img_desc ? `${import.meta.env.VITE_API_URL}/images/${item.img_desc}` : '',
    };
  });
}
onMounted(async() => {
  await getTreeList();
  await getDataCombo();
  await getAllProduct();
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
