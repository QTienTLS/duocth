<template src="./index.template.html"></template>
<script>
const DEFAULT_PAGE_SIZE_LIST = [10, 20, 30, 50, 100, 200];
export default {
  name: "Pagination",
  props: {
    pageIndex: {
      type: Number,
      default: 0,
    },
    pageSize: {
      type: Number,
      default: 20,
    },
    totalRecords: {
      type: Number,
      default: 0,
    },
    commands: {
      type: Array,
      default: () => [],
    }
  },
  data: function () {
    return {
      pageSizeData: this.pageSize,
      //pageIndexData: (this.pageIndex < this.lastPage ? this.pageIndex : this.lastPage),
      pageIndexData: this.pageIndex,
      pageSizeList: DEFAULT_PAGE_SIZE_LIST,
    };
  },
  watch: {
    pageSizeData: function () {
      if (this.pageIndexData > this.lastPage)
        this.pageIndexData = this.lastPage;
      else this.$emit("pageChanged", this.getPageArgs());
    },
    pageIndexData: function () {
      this.$emit("pageChanged", this.getPageArgs());
    },
    totalRecords: function (value) {
      if (this.pageIndexData > this.totalPages - 1)
      {
        this.pageIndexData = this.totalPages > 0 ? this.totalPages - 1 : 0;
      }
      else this.$emit("pageChanged", this.getPageArgs());
    },
  },
  computed: {
    totalPages: function () {
      return Math.ceil(this.totalRecords / this.pageSizeData);
    },
    lastPage: function () {
      let result = this.totalPages - 1;
      return result > 0 ? result : 0;
    },
    currentBeginRecord: function () {
      let begin = this.getBeginRecordOfPage(this.pageIndexData);
      return begin < this.totalRecords ? begin : this.totalRecords;
    },
    currentEndRecord: function () {
      let end = this.getEndRecordOfPage(this.pageIndexData);
      return end < this.totalRecords ? end : this.totalRecords;
    },
    currentPageListIndex: function () {
      return this.getPageListIndex(this.pageIndexData);
    },
    lastPageListIndex: function () {
      return this.getPageListIndex(this.lastPage);
    },
    currentPageListItems: function () {
      let begin = this.currentPageListIndex * 4;
      let result = [];
      for (let i = 0; i < 4; i++) {
        let p = begin + i;
        if (this.checkPageValid(p)) result.push(begin + i);
        else break;
      }
      return result;
    },
    enabledPrevPageList: function () {
      return this.currentPageListIndex > 0;
    },
    enabledNextPageList: function () {
      return this.currentPageListIndex < this.lastPageListIndex;
    },
    enabledNextPage: function () {
      return this.pageIndexData < this.lastPage;
    },
    enabledLastPage: function () {
      return this.pageIndexData < this.lastPage;
    },
    enabledPrevPage: function () {
      return this.pageIndexData > 0;
    },
    enabledFirstPage: function () {
      return this.pageIndexData > 0;
    },
  },
  methods: {
    reloadCurrentPage: function(){
      this.$emit("pageChanged", this.getPageArgs());
    },
    getPageArgs: function () {
      return {
        pageIndex: this.pageIndexData,
        pageSize: this.pageSizeData,
      };
    },
    gotoPage: function (value) {
      if (this.pageIndexData != value) this.pageIndexData = value;
    },
    gotoNextPage: function () {
      this.gotoPage(this.pageIndexData + 1);
    },
    gotoPrevPage: function () {
      this.gotoPage(this.pageIndexData - 1);
    },
    gotoFirstPage: function () {
      this.gotoPage(0);
    },
    gotoLastPage: function () {
      this.gotoPage(this.lastPage);
    },
    getBeginRecordOfPage: function (page) {
      return page * this.pageSizeData + 1;
    },
    getEndRecordOfPage: function (page) {
      return this.getBeginRecordOfPage(page) + this.pageSizeData - 1;
    },
    checkPageValid: function (page) {
      return page >= 0 && page <= this.lastPage;
    },
    getPageListIndex: function (page) {
      return Math.ceil((page + 1) / 4) - 1;
    },
    gotoNextPageList: function () {
      let page = (this.currentPageListIndex + 1) * 4;
      this.gotoPage(page);
    },
    gotoPrevPageList: function () {
      let page = (this.currentPageListIndex - 1) * 4;
      this.gotoPage(page);
    },
    command_Click: function(command, args){
      this.$emit("commandClick", command, args);
    }
  },
};
</script>
