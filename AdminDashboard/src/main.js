import { createApp } from 'vue'
import './assets/css/tailwind.css'
import 'vue3-toastify/dist/index.css';
import './assets/css/app.scss'
import App from './App.vue'
import { createPinia } from 'pinia'
import router from './router'
import Input from './components/form/Input.vue';
import {Icon} from '@iconify/vue';
import Button from './components/form/Button.vue';

const app = createApp(App)
app.use(createPinia())
app.component('FormInput', Input)
app.component('Icon', Icon)
app.component('FormButton', Button)
app.use(router)

app.mount('#app')
