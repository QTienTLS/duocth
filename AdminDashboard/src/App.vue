<script setup>
import { computed } from 'vue';
import { useSystemStore } from './stores/system';
import vi from 'element-plus/es/locale/lang/vi';
import { ElConfigProvider } from 'element-plus';
const systemStore = useSystemStore();

const openModalConfirm = computed(() => systemStore.openModalConfirm);
const confirmOption = computed(() => systemStore.confirmOption);
const globalLoading = computed({
  get: () => systemStore.globalLoading,
  set: (value) => {
    systemStore.setGlobalLoading(value);
  },
});
</script>

<template>
  <el-config-provider :locale="vi">
    <div>
    <Loading fullMode v-model="globalLoading">
    </Loading>
      <router-view></router-view>
      <TModal v-model="openModalConfirm">
        <template #header>
          <h3 class="text-xl font-bold text-left">{{ confirmOption.title }}</h3>
        </template>
        <template #body>
          <p class="p-8 text-left italic">{{ confirmOption.message }}</p>
        </template>
        <template #footer>
          <button class="mr-4 !bg-danger-500" @click="systemStore.cancelConfirm">Hủy</button>
          <button @click="systemStore.acceptConfirm" class="mr-4 !bg-primary">Xác nhận</button>
        </template>
      </TModal>
    </div>
  </el-config-provider>
</template>

<style lang="scss" scoped>
</style>
