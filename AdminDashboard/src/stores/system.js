import { defineStore } from "pinia";
import router from "../router";
import axios from '@/plugins/axiosPlugin';
import { useToast } from 'vue-toast-notification';
const toast = useToast();


export const useSystemStore = defineStore('system', {
  state: () => ({
    sidebarOpen: true,
    openModalConfirm: false,
    confirmOption: {},
    globalLoading: false
  }),
  actions: {
    setSidebarOpen(value){
      this.sidebarOpen = value;
    },
    openConfirm(options){
      this.openModalConfirm = true;
      this.confirmOption = options;
    },
    cancelConfirm(){
      this.openModalConfirm = false;
      this.confirmOption.onCancel();
      this.confirmOption = {};
    },
    acceptConfirm(){
      this.openModalConfirm = false;
      this.confirmOption.onConfirm();
      this.confirmOption = {};
    },
    setGlobalLoading(value){
      this.globalLoading = value;
    }
  }
});