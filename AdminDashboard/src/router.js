import { createRouter, createWebHistory } from 'vue-router';
import { useToast } from 'vue-toast-notification';
const toast = useToast();

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: () => import('./pages/Home.vue'),
      meta: {
        title: 'Home',
        requiresAuth: true,
      },
      children: [
        {
          path: 'dashboard',
          name: 'Dashboard',
          component: () => import('./pages/Dashboard.vue'),
        },
        {
          path: 'danh-muc',
          children: [
            {
              path: 'cong-ty',
              name: 'CompanyCategory',
              component: () => import('./pages/danhmuc/congty.vue'),
            },
            {
              path: 'nha-phan-phoi',
              name: 'DrugCategory',
              component: () => import('./pages/danhmuc/trinhduoc.vue'),
            },
            {
              path: 'don-vi',
              name: 'UnitCategory',
              component: () => import('./pages/danhmuc/donvi.vue'),
            }
          ],
        },
        {
          path: 'quan-tri',
          children: [
            {
              path: 'menu',
              name: 'Menu',
              component: () => import('./pages/quantri/menu.vue'),
            },
          ],
        },
      ],
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('./pages/Login.vue'),
      meta: {
        title: 'Đăng nhập hệ thống',
        requiresAuth: false,
      },
    },
    {
      path: '/:catchAll(.*)',
      name: 'NotFound',
      component: () => import('./pages/NotFound.vue'),
      meta: {
        title: 'Không tìm thấy trang',
        requiresAuth: false,
      },
    },
  ],
});

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    if (localStorage.getItem('token') === null) {
      toast.error('Bạn cần đăng nhập để sử dụng!');
      next({ name: 'Login' });
    } else {
      next();
    }
  } else {
    next();
  }
});

router.afterEach((to) => {
  document.title = to.meta.title || 'Home';
});

export default router;
