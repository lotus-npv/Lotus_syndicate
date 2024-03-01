const pool = require('../config/connection');
const moment = require('moment');

const getDispatchingCompanyById = async (req, res) => {
    let id = req.params.id;
    let sqlString = 'SELECT * FROM dispatching_company WHERE id = ?';
    const [rows, fields] = await pool.execute(sqlString, [id]);

    return res.status(200).json(rows);
}

const getDispatchingCompanyAll = async(req, res) => {
    let sqlString = 'SELECT * FROM dispatching_company';
    
}