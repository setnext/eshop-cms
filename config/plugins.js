const crypto = require('crypto');

module.exports = ({ env }) => ({
  'users-permissions': {
    config: {
      jwtSecret: env('JWT_SECRET') || crypto.randomBytes(16).toString('base64'),
    },
    upload: {
      breakpoints: {
        xlarge: 1920,
        large: 3456,
        medium: 750,
        small: 500,
        xsmall: 64
      }
    }
  },
});
