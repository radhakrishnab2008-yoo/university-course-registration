import dotenv from 'dotenv';
dotenv.config();
import bcrypt from 'bcryptjs';
import { pool } from './db.js';

async function main() {
  const passwordHash = await bcrypt.hash('DemoPass123!', 10);
  await pool.execute(
    `INSERT INTO Users(email,password_hash,role,student_id,faculty_id) VALUES
     ('student@demo.local', ?, 'student', 1, NULL),
     ('faculty@demo.local', ?, 'faculty', NULL, 1),
     ('admin@demo.local', ?, 'admin', NULL, NULL)
     ON DUPLICATE KEY UPDATE password_hash=VALUES(password_hash), is_active=1`,
    [passwordHash, passwordHash, passwordHash]
  );
  console.log('Development demo users created. Password: DemoPass123!');
  await pool.end();
}
main().catch(async (error) => { console.error(error); await pool.end(); process.exit(1); });
