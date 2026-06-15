const express = require('express');
const router = express.Router();
const GroceryScan = require('../models/GroceryScan');

router.post('/', async (req, res) => {
    try {
        const { rawText } = req.body;

        if(!rawText || rawText.trim().length == 0) {
            return res.status(400).json({message: 'rawText is required'});
        }

        const scan = await GroceryScan.create({
            rawText,
            createdAt: new Date(),
        });
        res.status(201).json(scan);
    } catch (error) {
        res.status(500).json({message: error.message });
    }
});

module.exports = router;