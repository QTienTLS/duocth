<template>
  <div id="modal-container"
  :class="{
  'six': true,
  'out': !modelValue && opened, 
  'hidden': !modelValue && !opened
}"

  >
    <div class="modal-background" @click="closeOnOutside">
      <div class="modal" ref="modal">
        <div class="modal-panel">
          <slot name="header">
          <h2>Modal Header</h2>
        </slot>
        <div class="modal-panel__body">
        <slot name="body">
            <p>Modal Content</p>
          </slot>
        </div>
        <div class="modal-panel__footer">
        <slot name="footer">
          <button
          class="select-none"
          @click="closeModal">Đóng</button>
        </slot> 
      </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      opened: false
    }
  },
  props: {
    modelValue: {
      type: Boolean,
      default: false
    },
    modalWidth: {
      type: String,
      default: '700px'
    },
    modalHeight: {
      type: String,
      default: 'fit-content'
    },
    static: {
      type: Boolean,
      default: true
    }
  },
  emits: ['update:modelValue'],
  mounted() {
    const modal = this.$refs.modal
    modal.style.width = this.modalWidth
    modal.style.height = this.modalHeight
  },
  methods: {
    closeModal() {
      console.log('close');
      this.$emit('update:modelValue', false)
    },
    closeOnOutside(e) {
      if(this.static) return
      const modal = this.$refs.modal
      if(!modal.contains(e.target)){
        this.closeModal()
      }
    }
  },
  watch:{
    modelValue(val){  
      if(val && !this.opened){
        this.opened = true
      }
      document.body.classList.toggle('modal-active', val)
    }
  }
}
</script>

<style lang="scss">
html,
body {
  &.modal-active {
    overflow: hidden;
  }
}

#modal-container {
  position: fixed;
  display: table;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  // transform: scale(0);
  z-index: 100009;
  &.six {
    animation:fadeIn .3s cubic-bezier(0.165, 0.840, 0.440, 1.000) forwards;
    .modal-background {
      .modal {
        // transform:scale(0);
        opacity: 0;
        animation: slideIn .5s .3s cubic-bezier(0.165, 0.840, 0.440, 1.000) forwards;
      }
    }
    &.out {
      animation:fadeOut .3s .5s cubic-bezier(0.165, 0.840, 0.440, 1.000) forwards;
      .modal-background {
        .modal {
          animation: slideOut .5s cubic-bezier(0.165, 0.840, 0.440, 1.000) forwards;
        }
      }
    }
    &.hidden {
      display: none;
    }
  }

  .modal-background {
    display: table-cell;
    background: rgba(0, 0, 0, 0.6);
    text-align: center;
    vertical-align: middle;
    .modal {
      background: white;
      padding: 20px;
      display: inline-block;
      border-radius: 3px;
      min-width: 700px;
      // min-height: 300px;
      max-height: 90%;
      max-width: 95%;
      font-weight: 300;
      position: relative;
      h2 {
        font-size: 25px;
        line-height: 25px;
        padding-bottom: 15px;
        text-align: left;
        border-bottom: 1px solid #005F39;
      }
      p {
        font-size: 18px;
        line-height: 22px;
      }
    }
  }
}
.modal-panel{
  height: 100% ;
  width: 100%;
  display: flex;
  flex-direction: column;
  &__footer{
    display: flex;
    justify-content: flex-end;
    min-height: 50px;
    border-top: #005F39 1px solid;
    padding-top: 10px;
    button{
      padding: 5px 20px;
      background: #005F39;
      color: white;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
  }
  &__body{
    flex: 1;
    overflow-y: auto;
  }
}

@keyframes slideIn {
  0%{
    opacity: 0;
    transform: translateY(100%);
  }
  100%{
    opacity: 1;
    transform: translateY(0);
  }
}
@keyframes slideOut {
  0%{
    opacity: 1;
    transform: translateY(0);
  }
  100%{
    opacity: 0;
    transform: translateY(100%);
  }
  
}

@keyframes zoomIn {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}

@keyframes zoomOut {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}

@keyframes fadeIn {
  0% {
    opacity: 0;
    visibility: hidden;
  }
  100% {
    opacity: 1;
    visibility: visible;
  }
}

@keyframes fadeOut {
  0% {
    opacity: 1;
    visibility: visible;
  }
  100% {
    opacity: 0;
    visibility: hidden;
  }
}

</style>
