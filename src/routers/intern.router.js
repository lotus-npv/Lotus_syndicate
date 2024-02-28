const express = require('express');
const internController = require('../controllers/intern.controller');

let router = express.Router();

router.get('/all', internController.getAllIntern);
router.get('/:id', internController.getInternById);
router.post('/insert', internController.insertNewIntern);
router.put('/update', internController.updateIntern);
router.delete('/delete/:id', internController.deleteIntern);

module.exports = router;