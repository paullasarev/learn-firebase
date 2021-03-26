const withPWA = require('next-pwa')
const runtimeCaching = require('next-pwa/cache')

console.log('next.config.js')

module.exports = withPWA({
  pwa: {
    dest: 'public',
    register: true,
    runtimeCaching,
    sw: 'service-worker.js',
  },
});
