const mysql = require('mysql2/promise');

console.log("Creating connection pool...");

const pool = mysql.createPool({
    host: 'localhost',
    user: 'admin',
    password: 'TiniWorld1@3',
    database: 'lotus_syndication'
})

pool.getConnection()
    .then(connection => {
        console.log("MySQL connection established successfully!");
        connection.release(); // Release the connection back to the pool
    })
    .catch(error => {
        console.error("Error connecting to MySQL:", error.message);
    });

module.exports = pool;