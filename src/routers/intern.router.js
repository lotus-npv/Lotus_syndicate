import express from 'express';
import internController from '../controllers/intern.controller';

let router = express.Router();

const internRouters = (app) => {
    router.get('/all', internController.getAllIntern);
    router.get('/:id', internController.getInternById);
    router.post('/insert', internController.insertNewIntern);
    router.put('/update', internController.updateIntern);
    router.delete('/delete/:id', internController.deleteIntern);

    return app.use('/api/v1/intern/', router);
}

export default internRouters;