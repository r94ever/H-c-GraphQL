require('dotenv').config()
const { join } = require('path')
const { copySync, removeSync } = require('fs-extra')

module.exports = {
  ssr: false,

  srcDir: __dirname,

  env: {
    baseUrl: process.env.APP_URL,
    apiUrl: process.env.API_URL || process.env.APP_URL + '/api',
    appName: process.env.APP_NAME || 'Laravel Nuxt',
    appLocale: process.env.APP_LOCALE || 'en',
    githubAuth: !!process.env.GITHUB_CLIENT_ID
  },

  head: {
    title: process.env.APP_NAME,
    titleTemplate: '%s - ' + process.env.APP_NAME,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Nuxt.js project' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  loading: { color: '#007bff' },

  router: {
    middleware: ['locale', 'check-auth']
  },

  css: [
    { src: '~/assets/sass/app.scss', lang: 'scss' }
  ],

  plugins: [
    '~components/global',
    '~plugins/i18n',
    '~plugins/vform',
    '~plugins/axios',
    '~plugins/fontawesome',
    '~plugins/nuxt-client-init',
    // '~plugins/echo.client.js',
    { src: '~plugins/bootstrap', mode: 'client' }
  ],

  modules: [
    '@nuxtjs/router',
    '@nuxtjs/apollo',
    '@nuxtjs/auth',
  ],

  build: {
    extractCSS: true
  },

  hooks: {
    generate: {
      done (generator) {
        // Copy dist files to public/_nuxt
        if (generator.nuxt.options.dev === false && generator.nuxt.options.mode === 'spa') {
          const publicDir = join(generator.nuxt.options.rootDir, 'public', '_nuxt')
          removeSync(publicDir)
          copySync(join(generator.nuxt.options.generate.dir, '_nuxt'), publicDir)
          copySync(join(generator.nuxt.options.generate.dir, '200.html'), join(publicDir, 'index.html'))
          removeSync(generator.nuxt.options.generate.dir)
        }
      }
    }
  },

  apollo: {
    clientConfigs: {
      default: {
        httpEndpoint: 'http://localhost:8000/graphql',
      }
    }
  },

  auth: {
    cookie: {
      prefix: 'auth',
    },
    redirect: {
      home: '/',
      login: '/login',
      callback: '/auth/callback',
      logout: '/login',
    },
    localStorage: false,
    strategies: {
      local: false,
      admin: {
        _scheme: '@/plugins/apollo-auth-schema.js',
        name: 'apollo',
        provider: 'apollo',
        token_type: 'Bearer',
        default: true,
      },
    }
  },
}
