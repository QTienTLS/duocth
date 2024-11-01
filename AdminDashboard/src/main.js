import { createApp } from 'vue'
import './assets/css/tailwind.css'
import 'vue3-toastify/dist/index.css';
import App from './App.vue'
import { createPinia } from 'pinia'
import router from './router'

const app = createApp(App)
app.use(createPinia())
app.use(router)

app.mount('#app')