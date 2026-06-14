const mongoose = require('mongoose')

const sectionSchema = new mongoose.Schema(
    {
        name: {
            type: String, 
            required: true,
            trim: true,
        },
        order : {
            type: Number, 
            required: true,
        }, 
    },
    { _id: false }
);

const storeSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
        },
        city: {
            type: String,
            trim: true
        },
        sections: {
            type: [sectionSchema],
            required: true
        }
    },
    { timestamps: true }
);

module.exports = mongoose.model('Store', storeSchema);