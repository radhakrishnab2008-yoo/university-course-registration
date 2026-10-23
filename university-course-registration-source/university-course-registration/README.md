# University Course Registration and Enrollment System
Sage-green themed DBMS project starter for ICFAI Deemed to be University.

## Requirements
Install Node.js 20+ and MySQL 8.

## Setup
1. Create the MySQL database by importing `database/schema.sql`, then `database/seed.sql`.
2. Copy `backend/.env.example` to `backend/.env` and set your MySQL details and a strong SESSION_SECRET.
3. From the project root, run `npm install`, then create the demo login users with `npm run seed:users -w backend` after the database schema and seed data have been imported.\n4. Start the app:
   ```bash
   npm install
   npm run dev
   ```
4. Open http://localhost:5173. API: http://localhost:4000/api/health

Demo accounts (development only): `student@demo.local`, `faculty@demo.local`, and `admin@demo.local`. Password for all three: `DemoPass123!`. Run `npm run seed:users -w backend` after importing the database. Change these credentials before public deployment.

This is a starter project, not security-audited production software. Review and test all business rules before public deployment.
