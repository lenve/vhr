module.exports = {
    presets: [
        '@vue/app',
        [
            '@babel/preset-env', {
            modules: false
        }]
    ],
    plugins: [
        [
            "component",
            {
                "libraryName": "element-ui",
                "styleLibraryName": "theme-chalk"
            }
        ]
    ]
}
