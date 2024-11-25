import { useSystemStore } from "../stores/system";
export default function useConfirm(options) {
    const systemStore = useSystemStore();
    return new Promise((resolve)=>{
      systemStore.openConfirm({
        ...options,
        onConfirm: ()=>{
          resolve(true)
        },
        onCancel: ()=>{
          resolve(false)
        }
      })
    })
}