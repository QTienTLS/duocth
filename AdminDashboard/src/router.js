import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      name: "Home",
      component: () => import("./pages/Home.vue"),
      meta: {
        title: "Home",
        requiresAuth: true,
      },
    },
    {
      path: "/login",
      name: "Login",
      component: () => import("./pages/Login.vue"),
      meta: {
        title: "Đăng nhập hệ thống",
        requiresAuth: false,
      },
    },
    {
      path: "/:catchAll(.*)",
      name: "NotFound",
      component: () => import("./pages/NotFound.vue"),
      meta: {
        title: "Không tìm thấy trang",
        requiresAuth: false,
      },
    },
  ],
})

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    if (localStorage.getItem("token") === null) {
      next({ name: "Login" });
    } else {
      next();
    }
  } else {
    next();
  }
});


router.afterEach(to => {
  document.title = to.meta.title || "Home";
})

export default router;