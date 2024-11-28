<template>
  <div>
    <div class="page-title">
      Ghi chú hệ thống
    </div>
    <ul class="top-button-list">
      <li>
        <Icon icon="lets-icons:search-light" />
        Tra cứu
      </li>
    </ul>
    <div class="page-content">
      <div class="box-form">
        <div class="info-row">
          <div class="key">
            Tiêu chí tìm kiếm
          </div>
          <div class="value">
            <div class="grid grid-cols-3">
              <div class="px-4">
                <FormInput v-model="searchKey" label="Từ khóa" icon="fa-solid:search" />
              </div>
              <div class="px-4">
                <FormInput v-model="user" label="Người thực hiện" icon="line-md:account" />
              </div>
              <div class="px-4">
                <FormSelect mode="multiple" v-model="loggingType" label="Loại ghi chú" icon="simple-line-icons:note" :options="loggingType_options" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>

</style>