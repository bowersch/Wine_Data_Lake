// Date: 03/02/2023
// Source: https://www.youtube.com/watch?v=vxu1RrR0vbw
// Comment: followed tutorial to get User Authentication working -- code by Conor Bailey

//brings in environment variables from .env file
require('dotenv').config();

//get the pg library
const { Client } = require("pg");

//checks if app is in production
const isProduction = process.env.NODE_ENV === "production";

//database URL variable
const connectionString = `postgresql://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_DATABASE}`;

const client = new Client({
    connectionString: isProduction ? process.env.DATABASE_URL : connectionString
});

module.exports = { client };