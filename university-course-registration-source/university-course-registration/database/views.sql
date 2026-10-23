USE university_registration;
CREATE OR REPLACE VIEW Faculty_Timetable AS SELECT f.faculty_id,f.name AS faculty_name,c.course_code,c.course_name,s.section_number,s.schedule_day,s.start_time,s.end_time,s.classroom,sem.name AS semester_name FROM Faculty f JOIN Section s ON s.faculty_id=f.faculty_id JOIN Course c ON c.course_id=s.course_id JOIN Semester sem ON sem.semester_id=s.semester_id;
