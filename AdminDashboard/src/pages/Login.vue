<template>
  <div class="login h-[100vh] w-[100vw] flex justify-center items-center">
    <div class="h-[20rem] w-1/3 text-center
    bg-white shadow-lg rounded-lg py-4 px-32 flex flex-col
    ">
      <h2 class="mb-12">Đăng nhập hệ thống</h2>
      <FormInput v-model="username" icon="fa6-solid:user-tie" label="Tên đăng nhập" />
      <FormInput class="mt-2" icon="tabler:lock-password" type="password" label="Mật khẩu" />
      <FormButton class="mt-4 mx-auto"  text="Đăng nhập" />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const username = ref('')
</script>

<style lang="scss" scoped>
.login {
  background: rgb(34, 193, 195);
  background: linear-gradient(
    135deg,
    rgba(34, 193, 195, 1) 0%,
    rgba(253, 187, 45, 1) 100%
  );
}
</style>
