<template>
  <div class="login h-[100vh] w-[100vw] flex justify-center items-center">
    <div class="h-[20rem] w-1/3 text-center
    bg-white shadow-lg rounded-lg py-4 px-32 flex flex-col
    ">
      <h2 class="mb-12">Đăng nhập hệ thống</h2>
      <!-- <form> -->
      <FormInput v-model="username" @keyup.enter="login" icon="fa6-solid:user-tie" label="Tên đăng nhập" />
      <FormInput v-model="password" @keyup.enter="login" class="mt-2" icon="tabler:lock-password" type="password" label="Mật khẩu" />
      <FormButton class="mt-4 mx-auto" @click="login"  text="Đăng nhập" />
    <!-- </form> -->
    </div>
  </div>
</template>

<script setup>
import { onMounted, onUnmounted, ref } from 'vue'
import { useAuthStore } from '../stores/auth';
const authStore = useAuthStore()

const username = ref('')
const password = ref('')
const login = async () => {
  try {
    await authStore.login(username.value, password.value)
  } catch (error) {
    console.log(error)
  }
}

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
