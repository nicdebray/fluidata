const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend( 'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'bootstrap-datepicker': 'bootstrap-datepicker',
    chartkick: 'chartkick',
    datetimepicker: 'datetimepicker'

  })
  )

module.exports = environment
