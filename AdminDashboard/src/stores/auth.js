import { defineStore } from "pinia";
import router from "../router";
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
const toast = useToast();


export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: '',
    refreshToken: '',
    username: ''
  }),
  actions: {
    logout(){
      this.token = '';
      this.refreshToken = '';
      this.username = '';
      localStorage.removeItem('token');
      router.push({name: 'Login'});
    },
    async login(username, password){
      let res = await axios.post('/auth/login', {username, password});
      if(res.data.code === 'dth-200'){
        toast.success(`Đăng nhập thành công! Chào mừng quay lại ${res.data.data.username}`);
        this.token = res.data.data.token;
        this.refreshToken = res.data.data.refreshToken;
        this.username = res.data.data.username;
        localStorage.setItem('token', res.data.data.token);
        localStorage.setItem('refreshToken', res.data.data.refreshToken);
        router.push({name: 'Home'});
      }
      else{
        toast.error(res.data.message);
      }
    }
  }
});