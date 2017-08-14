const path = require('path');

module.exports = {
  entry: './assets/javascript/index.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'public', 'assets'),
  }
};
