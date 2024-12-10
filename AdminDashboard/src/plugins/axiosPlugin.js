import axios from 'axios'
import { useToast } from 'vue-toast-notification'
import { useAuthStore } from '../stores/auth'

let baseURL = import.meta.env.VITE_API_URL;


axios.defaults.baseURL = baseURL
axios.defaults.headers = {
  'Content-Type': 'application/json',
}
const toast = useToast()
// const authStore = useAuthStore()

axios.interceptors.request.use(
  (request) => {
    let config = {}
    if(request.config)
      config = request.config
    config.start = Date.now()
    request.config = config

    //get token
    const token = localStorage.getItem('token')
    if(token){
      request.headers.Authorization = `Bearer ${token}`
    }
    return request
  }
)

axios.interceptors.response.use(
  (response) => {
    const authStore = useAuthStore()
    console.log(`Request to ${response.config.url} took ${Date.now() - response.config.config.start}ms`);
    //check response code
    if(response.data.code === 'dth-401'){
      toast.info('Token hết hạn, đang thử đăng nhập lại !')
      authStore.silentLogin()
    }
    if(response.data.code === 'dth-403'){
      toast.error('Bạn không có quyền truy cập nội dung này!')
      authStore.logout()
    }
    if(response.data.code === 'dth-404'){
      toast.error('Không tìm thấy đường dẫn API')
    }
    // if(response.data.code === 'dth-500'){
    //   toast.error('Lỗi hệ thống xảy ra, vui lòng thử lại sau!')
    // }
    return response
  },
  (error) => {
    if(error.response){
      const authStore = useAuthStore()
      if(error.response.status === 401){
        toast.error('Bạn không có quyền truy cập nội dung này!')
        authStore.logout()
      }
      else if(error.response.status === 403){
        toast.error('Bạn không có quyền truy cập nội dung này!')
        authStore.logout()
      }
      else if(error.response.status === 404){
        toast.error('Không tìm thấy đường dẫn API')
      }
      else if(error.response.status === 500){
        toast.error('Lỗi hệ thống xảy ra, vui lòng thử lại sau!')
      }
    }
    return Promise.reject(error)
  }
)

export default axios