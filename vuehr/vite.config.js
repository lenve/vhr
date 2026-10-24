import {fileURLToPath, URL} from 'node:url'
import {defineConfig} from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
    plugins: [vue()],
    //webpack 会自动注入 Node 的 global 变量，Vite 不会；sockjs-client 依赖它
    define: {
        global: 'globalThis'
    },
    resolve: {
        alias: {
            '@': fileURLToPath(new URL('./src', import.meta.url))
        }
    },
    server: {
        host: 'localhost',
        port: 8080,
        proxy: {
            '/ws': {
                target: 'ws://localhost:8081',
                ws: true
            },
            '/': {
                target: 'http://localhost:8081',
                changeOrigin: true,
                rewrite: path => path.replace(/^\//, ''),
                //Vite 中 "/" 规则会拦截页面请求，这里把页面和静态资源放行给 Vite 自己处理
                bypass: (req) => {
                    const url = req.url || '';
                    const accept = req.headers.accept || '';
                    //根路径与页面请求交给 Vite 渲染 index.html
                    if (url === '/' || accept.includes('text/html')) {
                        return url;
                    }
                    if (url.startsWith('/@') || url.startsWith('/src') || url.startsWith('/node_modules')
                        || url.startsWith('/__vite') || url === '/favicon.ico') {
                        return url;
                    }
                    if (/\.(js|mjs|ts|css|scss|less|json|png|jpe?g|gif|svg|ico|woff2?|ttf|map)(\?.*)?$/.test(url)) {
                        return url;
                    }
                    return undefined;
                }
            }
        }
    },
    build: {
        outDir: 'dist',
        chunkSizeWarningLimit: 1500
    }
})
