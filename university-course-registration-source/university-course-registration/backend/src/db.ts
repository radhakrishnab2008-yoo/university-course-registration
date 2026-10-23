
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

const sslCa = process.env.DB_SSL_CA;

export const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT || 19434),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  ssl: sslCa
    ? {
        ca: sslCa.replace(/\\n/g, '\n'),
        rejectUnauthorized: true,
      }
    : undefined,
  waitForConnections: true,
  connectionLimit: 10,
});
