<template>
  <div class="relative">
    <input ref="fileInput" class="hidden" :id="randomId" type="file" @change="onFileChange" accept="image/*" />
    <img :src="imageURL" class="h-[200px] mx-auto" v-if="imageURL" alt="Image preview" />
      <Icon icon="ei:close"
      class="absolute top-0 right-0 cursor-pointer" v-show="imageURL"
      width="2em" height="2em"
      @click="removeFile"
      />
    <div
    class="flex flex-col items-center justify-center h-[200px] border border-[#C1C1C1] rounded-md text-gray-400 cursor-pointer"
    @click="openFileInput"
    v-if="!imageURL">
      <Icon icon="octicon:device-camera-16" width="2em" height="2em" />
      <p>Click to upload an image</p>
    </div>
  </div>
</template>

<script setup>

import { computed, ref } from 'vue';

const fileModel = defineModel();
const imageURL = computed(() => {
  if (fileModel.value) {
    return URL.createObjectURL(fileModel.value);
  }
  return null;
});
const randomId = Math.random().toString(36).substring(7);
const fileInput = ref(null);

const openFileInput = () => {
  fileInput.value.click();
};

const onFileChange = (e) => {
  const file = e.target.files[0];
  fileModel.value = file;
};

const removeFile = () => {
  fileModel.value = null;
};

</script>

<style lang="scss" scoped>
</style>
