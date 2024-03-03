const express = require('express');
const internController = require('../controllers/intern.controller');

let router = express.Router();

router.get('/all', internController.getAll);
router.get('/:id', internController.getById);
router.post('/insert', internController.insert);
router.put('/update', internController.update);
router.delete('/delete/:id', internController.deleteById);

module.exports = router;