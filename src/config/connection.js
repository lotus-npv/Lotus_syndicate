const mysql = require('mysql2/promise');

console.log("Creating connection pool...");

const pool = mysql.createPool({
    host: 'lotusnpv.cn0uiu22sdkh.ap-southeast-1.rds.amazonaws.com',
    user: 'viper',
    password: 'Nampp2024',
    database: 'lotus_syndication'
})

// const pool = mysql.createPool({
//     host: '45.252.251.108',
//     user: 'lotusocean_jp_app',
//     password: 'xnd7apnp3AWz3Md6',
//     database: 'lotusocean_jp_app'
// })

pool.getConnection()
    .then(connection => {
        console.log("MySQL connection established successfully!");
        connection.release(); // Release the connection back to the pool
    })
    .catch(error => {
        console.error("Error connecting to MySQL:", error.message);
    });

module.exports = pool;