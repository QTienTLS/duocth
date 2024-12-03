<template>
  <TModal v-model="openModal" modalWidth="90vw" modalHeight="90vh">
    <template #header>
        <div class="text-xl font-bold text-left">
            Chọn loại hàng hóa
        </div>
      </template>
      <template #body>
        <div class="p-2">
          <div class="grid grid-cols-3 gap-4">
          <div class="type-wrapper"
          v-for="type in treeType"
          :key="type.id"
          >
            <div class="border-b border-primary flex gap-4 items-center pb-2">
              <Icon :icon="type.icon" width="2em" height="2em" />
              <div class="font-bold">{{ type.name }}</div>
            </div>
            <div class="type-content gap-2 grid grid-cols-3">
              <div class="shadow-box2 text-[0.7rem] cursor-pointer h-16 rounded-full px-2 flex justify-between items-center
              hover:border border-primary
              "
              :class="selectedType.includes(child.id)?'border-primary-200 text-primary-200 border':''"
              @click="toggleSelectType(child.id)"
              v-for="child in type.children"
              :key="child.id"
              >
                <Icon :icon="child.icon" width="2em" height="2em" />
                <div class="font-normal truncate ">{{ child.name }}</div>
                <Icon icon="fluent:checkmark-32-regular" class="text-primary-200"
                :class="{
                  'visible': selectedType.includes(child.id),
                  'invisible': !selectedType.includes(child.id)
                }"
                width="2em" height="2em" />
              </div>
            </div>
          </div>
        </div>
        </div>
      </template>
      <template #footer>
        <button class="mr-4 !bg-danger-500" @click="openModal = false">
          Đóng
        </button>
      </template>
  </TModal>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import axios from '@/plugins/axiosPlugin';
import { useSystemStore } from '@/stores/system';
const systemStore = useSystemStore();
const openModal = ref(false);
const show = () => {
  openModal.value = true;
}
const treeType = ref([]);
const selectedType = defineModel();
const toggleSelectType = (id) => {
  if (selectedType.value.includes(id)) {
    selectedType.value = selectedType.value.filter(item => item !== id);
  } else {
    selectedType.value.push(id);
  }
}
onMounted( async () => {
  treeType.value = [];
  systemStore.setGlobalLoading(true);
  const res = await axios.get('/storage/get-types-tree');
  systemStore.setGlobalLoading(false);
  if (res.data.code === 'dth-200') {
    treeType.value = res.data.data;
    treeType.value.forEach(item => {
      item.children.forEach(child => {
        selectedType.value.push(child.id);
      })
    })
  }
})
defineExpose({
  show
})
</script>

<style lang="scss" scoped>
.type-wrapper{
  box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
  border-radius: 0.5rem;
  padding: 1rem;
  height: 20rem;
  .type-content{
    overflow-y: auto;
    padding: 1rem;
    max-height: 16rem;
  }
}
</style>