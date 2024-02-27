import mysql from 'mysql2/promise';

console.log("Creating connection pool...");
// const pool = mysql.createPool({
//     host: process.env.HOST,
//     user: process.env.USER,
//     password: process.env.PASSWORD,
//     database: process.env.DATABASE
// })

const pool = mysql.createPool({
    host: process.env.HOST,
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

export default pool;