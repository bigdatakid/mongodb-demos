const path = './sec/master-key.txt';
const fs = require('fs');
const crypto = require('crypto');

try {
 let key= crypto.randomBytes(96);
 console.log(key);
  fs.writeFileSync(path, key);
} catch (err) {
  console.error(err);
}