const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    proxy: {
      '/api': {
        target: 'http://172.22.31.117:8081/', // 配置好的后端接口地址
        // 允许跨域
        secure:false,
        changeOrigin: true,
        ws: true,
        pathRewrite: {
          '^/api': '' // 以'/api'开头的url会进行接口转发
        }
      }
    }
  },
})
