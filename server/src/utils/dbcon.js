const { Pool } = require('pg');
const { db } = require('../config/config');

module.exports.dbcon = (sql, params) => {
  return new Promise((resolve, reject) => {
    const pool = new Pool({ ...db });
    pool.query(sql, params)
      .then(out => resolve(out))
      .catch(err => reject(err));
  });
};
