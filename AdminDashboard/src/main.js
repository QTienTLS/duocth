import { createApp } from 'vue'
import './assets/css/tailwind.css'
import 'vue-toast-notification/dist/theme-bootstrap.css';
import './assets/css/app.scss'
import './assets/css/grid.scss'
import App from './App.vue'
import { createPinia } from 'pinia'
import router from './router'
import Input from './components/form/Input.vue';
import {Icon} from '@iconify/vue';
import ToastPlugin from 'vue-toast-notification';
import Vue3Lottie from 'vue3-lottie'
import Button from './components/form/Button.vue';
import Loading from './components/Loading.vue';
import Grid from './components/Grid.vue';
import TopButtons from './components/TopButtons.vue';
import Modal from './components/Modal.vue';
import Select from './components/form/Select.vue';
import {registerLicense } from '@syncfusion/ej2-base';
import GridButton from './components/GridButton.vue';
import ImageInput from './components/form/ImageInput.vue';
import { DatePickerComponent as EjsDatepicker } from '@syncfusion/ej2-vue-calendars';
import {
  GridComponent,
  ColumnsDirective,
  ColumnDirective,
  AggregatesDirective,
  AggregateDirective,
  VirtualScroll,
  Sort,
  Filter,
  Selection,
  Resize,
  Page,
} from '@syncfusion/ej2-vue-grids'
import { CheckBoxComponent as EjsCheckBox } from "@syncfusion/ej2-vue-buttons";
import { TooltipComponent as EjsTooltip  } from "@syncfusion/ej2-vue-popups";
import { DropDownListComponent } from '@syncfusion/ej2-vue-dropdowns'
import TextArea from './components/form/TextArea.vue';


const app = createApp(App)
registerLicense('ORg4AjUWIQA/Gnt2UlhhQlVMfV5AQmBIYVp/TGpJfl96cVxMZVVBJAtUQF1hTX9Sd0xjWn9fdHxXRWRd')
app.component('ejs-grid', GridComponent)
app.component('e-columns', ColumnsDirective)
app.component('ejs-dropdownlist', DropDownListComponent)
app.component('e-column', ColumnDirective)
app.component('ejs-datepicker', EjsDatepicker)
app.component('e-aggregates', AggregatesDirective)
app.component('e-checkbox', EjsCheckBox)
app.component('e-tooltip', EjsTooltip)
app.component('FormTextArea', TextArea)
app.component('e-aggregate', AggregateDirective)
app.component('GridButton', GridButton)
app.component('TopButtons', TopButtons)
app.component('TModal', Modal)
app.component('ImageInput', ImageInput)
app.component('FormSelect', Select)
app.use(createPinia())
app.component('FormInput', Input)
app.use(ToastPlugin);
app.component('Icon', Icon)
app.use(Vue3Lottie, { name: 'LottieAnimation' })
app.component('Loading', Loading)
app.component('DataGrid', Grid)
app.component('FormButton', Button)
app.use(router)

app.mount('#app')
app.provide('grid', [Filter, Selection, Sort, VirtualScroll, Resize, Page])
