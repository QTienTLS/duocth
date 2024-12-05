<template>
  <div class="w-full">
    <div class="grid grid-cols-4 mobile:grid-cols-1">
      <div class="col-span-3 mobile:hidden"></div>
      <div class="col-span-1 my-4">
        <el-input v-model="search" size="large" placeholder="Tìm kiếm..." />
      </div>
    </div>
    <el-table
      :data="dataComputed"
      border
      stripe
      :height="height"
      style="width: 100%"
    >
    <el-table-column type="index" width="50"></el-table-column>
      <slot></slot>
    </el-table>
    <el-pagination
      class="mt-4 overflow-x-auto"
      background
      layout="prev, pager, next, jumper, sizes, ->, total"
      :total="dataSource.length"
      :page-sizes="[10, 100, 200, 300, 400]"
      v-model:current-page="currentPage"
      v-model:page-size="pageSize"
      @current-change="handleCurrentChangePage"
      @size-change="handleSizeChange"
    />
  </div>
</template>

<script setup>
import { computed, ref } from 'vue';

const props = defineProps({
  height: {
    type: String,
    default: '600',
  },
});
const search = ref('');
const dataSource = defineModel();
const pageSize = ref(10);
const currentPage = ref(1);
const handleCurrentChangePage = (val) => {
  currentPage.value = val;
};
const handleSizeChange = (val) => {
  pageSize.value = val;
};
const dataComputed = computed(() => {
  return dataSource.value.slice(
    (currentPage.value - 1) * pageSize.value,
    currentPage.value * pageSize.value,
  )
  .filter((item) => {
    return Object.values(item).some((value) => {
      return String(value).toLowerCase().includes(search.value.toLowerCase());
    });
  });
});
</script>

<style lang="scss" scoped></style>
