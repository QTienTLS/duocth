<template>
  <div class="grid-column-filter-item e-input-group e-filterdiv">
    <input
      type="text"
      ref="txtFilterText"
      @change="filter_Changed"
      @keyup="filter_Keyup"
      v-model.trim="filterText"
      class="e-input"
    />
    <button :class="buttonClearCss" @click="btnClear_Clicked" />
  </div>
</template>
<script>
export default {
  name: "FilterTemplate",
  props: {},
  data: function () {
    return {
      last: [],
      filterText: "",
    };
  },
  mounted: function () {
    this.filterText = this.dataGrid.getFilterConditionValue(
      this.data.column.field
    );
    let currentFilter = this.dataGrid.getCurrentFilter();
    if (currentFilter.fieldName == this.data.column.field) {
      setTimeout((x) => {
        this.$nextTick(() => this.$refs.txtFilterText.focus()); // this works great, just watch out with going to fast !!!
      }, 200);
    }
  },
  computed: {
    dataGrid: function () {
      return this.$parent.$parent;
    },
    buttonClearCss: function () {
      let result = "e-clear-icon";
      if (this.filterText == "" || this.filterText == null)
        result += " e-clear-icon-hide";
      return result;
    },
  },
  methods: {
    filter_Changed: function (args) {
      if (this.filterText == null || this.filterText == "") {
        this.dataGrid.clearFilterCondition(this.data.column.field);
      } else {
        this.dataGrid.setFilterCondition({
          fieldName: this.data.column.field,
          value: this.filterText,
        });
      }
    },
    filter_Keyup: async function (args) {
      this.last.push(new Date());
      setTimeout(function(){
        if(this.last.length > 0) {
          this.last.splice(0, 1);
        }
        if(this.last.length == 0) {
          this.dataGrid.refresh();
        }
      }.bind(this), 800);
    },
    btnClear_Clicked: function (args) {
      this.filterText = null;
      this.dataGrid.clearFilterCondition(this.data.column.field);
    },
  },
};
</script>
