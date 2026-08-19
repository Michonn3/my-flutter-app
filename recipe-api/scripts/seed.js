// a program that inserts data into the database
require('dotenv').config();
const mongoose = require('mongoose');
const Store = require('../models/Store');
const ItemMappinng = require('../models/ItemMapping');

const mongoUri = process.env.MONGO_URI || 'mongodb://localhost:27017/recipes';

const storeData = {
    name: 'Generic Grocery Store',
    sections: [
        {name: 'Produce', order: 1},
        {name: 'Bakery', order: 2},
        {name: 'Meat', order: 3},
        {name: 'Dairy', order: 4},
        {name: 'Frozen', order: 5},
        {name: 'Pantry', order: 6},
        {name: 'Snacks', order: 7},
        {name: 'Beverages', order: 8},
        {name: 'Household', order: 9},
        {name: 'Miscellaneous', order: 10},
    ],
};

const itemMappings = [
    {name: 'banana', sectionName: 'Produce'},
    {name: 'bananas', sectionName: 'Produce'},
    {name: 'apple', sectionName: 'Produce'},
    {name: 'apples', sectionName: 'Produce'},
    {name: 'strawberries', sectionName: 'Produce'},
    {name: 'lettuce', sectionName: 'Produce'},
    {name: 'spinach', sectionName: 'Produce'},
    {name: 'tomatoes', sectionName: 'Produce'},
    {name: 'onions', sectionName: 'Produce'},
    {name: 'potatoes', sectionName: 'Produce'},

    {name: 'bread', sectionName: 'Bakery'},
    {name: 'bagels', sectionName: 'Bakery'},
    {name: 'tortillas', sectionName: 'Bakery'},

    {name: 'chicken', sectionName: 'Meat'},
    {name: 'chicken breast', sectionName: 'Meat'},
    {name: 'ground beef', sectionName: 'Meat'},
    {name: 'bacon', sectionName: 'Meat'},

    {name: 'milk', sectionName: 'Dairy'},
    {name: 'eggs', sectionName: 'Dairy'},
    {name: 'yogurt', sectionName: 'Dairy'},
    {name: 'butter', sectionName: 'Dairy'},
    {name: 'cheese', sectionName: 'Dairy'},

    {name: 'frozen pizza', sectionName: 'Frozen'},
    {name: 'ice cream', sectionName: 'Frozen'},

    {name: 'rice', sectionName: 'Pantry'},
    {name: 'pasta', sectionName: 'Pantry'},
    {name: 'beans', sectionName: 'Pantry'},
    {name: 'cereal', sectionName: 'Pantry'},
    {name: 'peanut butter', sectionName: 'Pantry'},

    {name: 'chips', sectionName: 'Snacks'},
    {name: 'cookies', sectionName: 'Snacks'},
    {name: 'crackers', sectionName: 'Snacks'},

    {name: 'orange juice', sectionName: 'Beverages'},
    {name: 'coffee', sectionName: 'Beverages'},
    {name: 'soda', sectionName: 'Beverages'},

    {name: 'dish soap', sectionName: 'Household'},
    {name: 'paper towels', sectionName: 'Household'},
    {name: 'toilet paper', sectionName: 'Household'},
    {name: 'trashbags', sectionName: 'Household'}
];

async function seedDatabase() {
    try {
        await mongoose.connect(mongoUri); // connects to DB
        console.log('Connected to MongoDB');

        await Store.deleteMany({}); // Clears old seed data. OK for development only.
        await ItemMappinng.deleteMany({});
        console.log(`Cleared existing seed data`);

        const createdStore = await Store.create(storeData); // Creates one store document
        console.log(`Created store: ${createdStore.name}`);

        const createdMappings = await ItemMapping.insertMany(itemMmappings); // Creates all item mappings at once
        console.log(`Created ${createdMappings.length} item mappings`);

        console.log('Seeding complete');
    } catch (error) {
        console.error('Seeding failed:', error.message);
    } finally {
        await mongoose.connection.close(); // closes DB connection
        console.log('MongoDB connection closed')
    }
}

seedDatabase();











