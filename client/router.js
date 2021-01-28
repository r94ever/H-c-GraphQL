import Vue from 'vue'
import Router from 'vue-router'
import { scrollBehavior } from '~/utils'

Vue.use(Router)

const page = path => () => import(`~/pages/${path}`).then(m => m.default || m)

const routes = [
  { path: '/', name: 'welcome', component: page('welcome.vue') },

  { path: '/login', name: 'login', component: page('auth/login.vue') },
  { path: '/register', name: 'register', component: page('auth/register.vue') },
  { path: '/password/reset', name: 'password.request', component: page('auth/password/email.vue') },
  { path: '/password/reset/:token', name: 'password.reset', component: page('auth/password/reset.vue') },
  { path: '/email/verify/:id', name: 'verification.verify', component: page('auth/verification/verify.vue') },
  { path: '/email/resend', name: 'verification.resend', component: page('auth/verification/resend.vue') },

  { path: '/home', name: 'home', component: page('home.vue') },
  { path: '/chat', name: 'chat', component: page('chat.vue') },
  {
    path: '/settings',
    component: page('settings/index.vue'),
    children: [
      { path: '', redirect: { name: 'settings.profile' } },
      { path: 'profile', name: 'settings.profile', component: page('settings/profile.vue') },
      { path: 'password', name: 'settings.password', component: page('settings/password.vue') }
    ]
  },
  { path: '/posts', component: page('posts/index.vue'), name: 'posts-index' },
  { path: '/posts/create', component: page('posts/create.vue'), name: 'posts-create' },
  { path: '/posts/:id', component: page('posts/_id.vue'), name: 'posts-edit' },
  { path: '/categories', component: page('categories/index.vue'), name: 'categories-index' },
  { path: '/categories/create', component: page('categories/create.vue'), name: 'categories-create' },
  { path: '/categories/:id', component: page('categories/_id.vue'), name: 'categories-edit' }
]

export function createRouter () {
  return new Router({
    routes,
    scrollBehavior,
    mode: 'history'
  })
}
