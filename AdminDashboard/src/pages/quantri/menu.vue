<template>
  <div class="p-24 ">
    <DataGrid
    :columns="columns"
    :dataSource="[{id: 1, name: 'A'}, {id: 2, name: 'B'}, {id: 2, name: 'B'}, {id: 2, name: 'B'} ,{id: 2, name: 'B'},{id: 2, name: 'B'},{id: 2, name: 'B'}]"
    panelDataHeight="200px"
    />
  </div>
</template>

<script setup>
const columns = [
  {fieldName: 'id', headerText: 'ID'},
  {fieldName: 'name', headerText: 'Name'},
  {fieldName: 'action', headerText: 'Action'},
  {fieldName: 'action', headerText: 'Action'}
]
</script>

<style lang="scss" scoped>

</style>