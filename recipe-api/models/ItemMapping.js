const mongoose = require("mongoose");

const itemMappingSchema = new mongoose.Schema(
    {
        storeId: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Store",
            required: true
        },
        itemName: {
            type: String,
            required: true,
            trim: true
        },
        normalizedName: {
            type: String,
            required: true,
            trim: true,
            lowercase: true
        },
        sectionName: {
            type: String,
            required: true,
            trim: true
        }
    },
    { timestamps: true }
);

itemMappingSchema.index({ storeId: 1, normalizedName: 1 }, {unique: true});

module.exports = mongoose.model("ItemMapping", itemMappingSchema);