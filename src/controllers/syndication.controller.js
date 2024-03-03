const pool = require('../config/connection');
const moment = require('moment');

const getAll = async (req, res) => {
    let sqlString = 'SELECT * FROM syndication';

    const [rows, fields] = await pool.execute(sqlString);

    return res.status(200).json(rows);
}

const getById = async (req, res) => {
    let id = req.params.id;
    let sqlString = 'SELECT * FROM syndication WHERE id = ?';
    const [rows, fields] = await pool.execute(sqlString, [id]);

    return res.status(200).json(rows);
}

const insert = async (req, res) => {
    const mysqlDatetime = moment().utcOffset("+07:00").format("YYYY-MM-DDTHH:mm:ss");

    const date = new Date();

    let { firstName, middleName, lastName, dob, avata, dispatching_company_id, receiving_factory_id, career_id, address, passport_code, alien_card_number, create_by, update_by } = req.body;

    if (!firstName || !middleName || !lastName || !dob || !dispatching_company_id || !receiving_factory_id || !career_id) {
        return res.status(200).json({
            message: 'missing required params'
        })
    }

    var info = await pool.execute('insert into syndication(firstName, middleName, lastName, dob, avata, dispatching_company_id, receiving_factory_id, career_id, address, passport_code, alien_card_number, create_at, create_by, update_at, update_by) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [firstName, middleName, lastName, dob, avata, dispatching_company_id, receiving_factory_id, career_id, address, passport_code, alien_card_number,mysqlDatetime, create_by, mysqlDatetime, update_by]);

    return res.status(200).json({
        message: 'create done',
        info: info
    })
}

const update = async (req, res) => {
    const mysqlDatetime = moment().utcOffset("+07:00").format("YYYY-MM-DDTHH:mm:ssZ");

    let { id, firstName, middleName, lastName, dob, avata, dispatching_company_id, receiving_factory_id, career_id, address, passport_code, alien_card_number, create_by, update_by } = req.body;

    if (!firstName || !middleName || !lastName || !dob || !dispatching_company_id || !receiving_factory_id || !career_id) {
        return res.status(200).json({
            message: 'missing required params'
        })
    }

    var info = await pool.execute('update intern set firstName = ?, middleName = ?, lastName = ?, dob = ?, avata = ?, dispatching_company_id = ?, receiving_factory_id = ?, career_id = ?, address = ?, passport_code = ?, alien_card_number = ?, update_at = ?, update_by = ? where id = ?',
        [firstName, middleName, lastName, dob, avata, dispatching_company_id, receiving_factory_id, career_id, address, passport_code, alien_card_number, mysqlDatetime, update_by, id]);

    return res.status(200).json({
        message: 'update done',
        info: info
    })
}

let deleteById = async (req, res) => {
    let id = req.params.id;
    if (!id) {
        return res.status(200).json({
            message: 'missing required params'
        })
    }
    var info = await pool.execute('delete from intern where id = ?', [id])
    return res.status(200).json({
        message: 'delete done',
        info: info
    })
}

module.exports = {
    getAll, getById, insert, update, deleteById
}