/*
    Grocery Scan Routes
    Purpose: Receive OCR text extracted from receipt images and persist that data to MongoDB.
    
    Request Flow: Flutter App -> POST /api/grocery-scans -> Express Routes -> Mongoose Model ->
                  MongoDB Collection
    This route does NOT perform OCR. OCR happens in Flutter using Google ML Kit.
    This route's responsibility is:
    1. Validate incoming data
    2. Create MongoDB document
    3. Return response to client
*/
const express = require('express');
const router = express.Router();
const GroceryScan = require('../models/GroceryScan');


/*
    POST /api/grocery-scans
    
    Creates a new grocery scan document.
    Expected Request Body:
    {
        "rawText": "MILK\nEGGS\nBREAD"    
    }
    
    Success Response:
    HTTP 201
    {
        "_id": "...",
        "rawText": "MILK\nEGGS\nBREAD",
        "createdAt": "..."
    }
    
    Error Responses:
    400 -> Invalid Request
    500 -> Server/database failure
*/
router.post('/', async (req, res) => {
    try {
        /*
            req.body contains JSON sent by Flutter.
            Example:
            {
                rawText: "MILK\nEGGS"
            }
        */
        const { rawText } = req.body;

        /*
            Prevent saving empty scans.
            Without this validation we could end up storing blank documents in MongoDB.
        */
            if(!rawText || rawText.trim().length == 0) {
            return res.status(400).json({message: 'rawText is required'});
        }

        /* 
            Create a MongoDB document.
            Mongoose takes this JavaScript object and converts it into a document inside the
            GroceryScan collection.
        */
       const scan = await GroceryScan.create({
            rawText,
            createdAt: new Date(),
        });

        /*
            201 = Created
            Return newly created document so Flutter knows the operation succeeded.
        */
        res.status(201).json(scan);
    } catch (error) {
        // Catch unexpected failures: MongoDB offline, Schema validation errors, programming errors
        res.status(500).json({message: error.message });
    }
});

module.exports = router;

/*
    Vocabulary:

    router
        Express object that groups related endpoints.
    
    route
        A URL + HTTP method combination.

    endpoint
        A callable API location.
    
    request (req)
        Data coming from Flutter.

    response (res)
        Data sent back to Flutter.
    
    model
        JavaScript representation of a MongoDB collection.

    document
        One record stored in MongoDB.
    
    collection
        MongoDB equivalent of a SQL table.