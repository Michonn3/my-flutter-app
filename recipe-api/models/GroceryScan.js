const mongoose = require('mongoose')
/*
    GroceryScan Schema
    Purpose:
    Stores raw OCR text extracted from a receipt image.
    This is where you describe the data's structure.
    This is intentionally simple for now:
    - Flutter extracts the text
    -  Express receives the text
    - MongoDB stores the text
    Later, this can be expanded to include:
    - storeName
    - purchaseDate
    - parsedItems
    - total  
*/

const groceryScanSchema = new mongoose.Schema(
    {
        /*
            Example raw text returned by OCR.
            HEB
            MILK 3.99
            EGGS 2.49
            BREAD 1.99
            We store the entire OCR result first.
            Later we can parse individual items
        */
        rawText: {
            type: String,
            required: true, // User must provide OCR text
            trim: true, // Removes whitespace from beg./end
        },
    },
    /*
        Automatically creates:
        createdAt
        updatedAt
        Example:
        {
            createdAt: 2026-06-18T18:00:00Z,
            updatedAt: 2026-06-18T18:00:00Z
        }
    */
    {
        timestamps: true, 
    }
);
// Export model so other files can use it
module.exports = mongoose.model('GroceryScan', groceryScanSchema);