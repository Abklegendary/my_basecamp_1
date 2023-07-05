const { environment } = require('@rails/webpacker')

module.exports = environment

environment.config.merge({
  entry: {
    application: './app/javascript/packs/application.js',
    // Additional entry points if any
  }
})
