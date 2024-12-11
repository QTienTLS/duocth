<template>
  <div class="relative mt-4">
    <label
    v-show="label"
    @click="toggleSelect"
      class="absolute flex items-center font-normal z-40 left-[10px] transition-all duration-200"
      :class="model!=null&&(model&&mode=='single'||model.length>0)?'text-[13px] text-[#006c40] top-[-12px] h-[20px] bg-white z-10 px-2':'text-[#a1a1a1] h-full  text-[17px]'"
    >
      <Icon :icon="icon" class="mr-2" v-show="icon" />
      <span>{{ label }}</span>
    </label>
    <div
      @click="toggleSelect"
      ref="qtSelect"
      class="h-[40px] w-full relative px-[10px] text-[14px] font-[400] border"
      :class="{
        'border-[#005F39] rounded-t-[5px]': open,
        'border-[#c1c1c1] rounded-[5px]': !open,
        'bg-gray-300': props.readonly,
        'bg-transparent': !props.readonly,
      }"
    >
      <span
        class="leading-[40px] w-[calc(100%-20px)] text-left block truncate text-gray-600 cursor-pointer select-none"
        ref="displaySelect"
        >{{ displayValue }}</span
      >
      <Icon
        class="absolute top-1/2 transform -translate-y-1/2 right-2 transition-transform transition-200"
        :class="open ? 'rotate-90' : ''"
        icon="tabler:chevron-right"
        width="1.5em"
        height="1.5em"
      />
    </div>
    <div
      class="panel-options"
      ref="selectPanel"
      :class="open ? '' : 'panel-options--close'"
    >
      <div
        v-for="(option, index) in props.options"
        @click="selectOption(option)"
        class="flex items-center h-[35px] border-b even:bg-[#F1F8FF] cursor-pointer"
        :key="index"
      >
        <div
          v-if="mode == 'multiple'"
          class="border-r h-full w-[35px] select-none flex items-center justify-center"
        >
          <e-checkbox disabled :checked="model.includes(option.id)" />
        </div>
        <span class="px-6 truncate flex-1 text-left">
          <e-tooltip :content="option.text" class="">
            {{ option.text }}
          </e-tooltip>
        </span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, readonly } from 'vue';
import { onClickOutside } from '@vueuse/core';

const props = defineProps({
  mode: {
    type: String,
    default: 'single',
  },
  options: {
    type: Array,
    default: () => [],
  },
  label: {
    type: String,
    default: '',
  },
  icon: {
    type: String,
    default: '',
  },
  readonly: {
    type: Boolean,
    default: false,
  },
});
const selectPanel = ref(null);
const model = defineModel();
const open = ref(false);
const qtSelect = ref(null);
const displaySelect = ref(null);
onClickOutside(selectPanel, (e) => {
  if (e.target == qtSelect.value || e.target == displaySelect.value) return;
  open.value = false;
});
const toggleSelect = () => {
  if (props.readonly) return;
  open.value = !open.value;
};
const selectOption = (option) => {
  if (props.mode === 'single') {
    model.value = option.id;
    open.value = false;
  } else {
    if (model.value.includes(option.id)) {
      model.value = model.value.filter((item) => item !== option.id);
    } else {
      model.value = [...model.value, option.id];
    }
  }
};
const displayValue = computed(() => {
  if (props.mode === 'single') {
    return props.options.find((option) => option.id === model.value)?.text;
  } else {
    return props.options
      .filter((option) => model.value.includes(option.id))
      .map((option) => option.text)
      .join(', ');
  }
});
</script>

<style lang="scss" scoped>
.panel-options {
  height: 200px;
  position: absolute;
  top: 40px;
  left: 0px;
  border: 1px solid #c1c1c1;
  border-top: none;
  width: 100%;
  animation: openSelect 0.2s forwards;
  border-radius: 0 0 5px 5px;
  overflow-y: auto;
  z-index: 9999;
  background-color: white;
  &--close {
    animation: closeSelect 0.2s forwards;
  }
}

@keyframes openSelect {
  from {
    height: 0;
    opacity: 0;
  }
  to {
    height: 200px;
    opacity: 1;
  }
}
@keyframes closeSelect {
  0% {
    height: 200px;
    opacity: 1;
  }
  99% {
    height: 0;
    opacity: 1;
  }
  100% {
    height: 0;
    opacity: 0;
  }
}
</style>
