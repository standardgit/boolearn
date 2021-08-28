const { enviroment } = require('@rails/webpacker')
const webpack    = require("webpack")
enviroment.plugins.append("provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
}))
module.exports = enviroment