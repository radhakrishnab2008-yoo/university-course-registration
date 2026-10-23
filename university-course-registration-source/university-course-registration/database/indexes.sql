USE university_registration;
CREATE INDEX idx_student_major ON Student(major);
CREATE INDEX idx_section_faculty_time ON Section(faculty_id,semester_id,schedule_day,start_time,end_time);
CREATE INDEX idx_enrollment_section_status ON Enrollment(section_id,status);
CREATE INDEX idx_waitlist_section_status_created ON Waitlist(section_id,status,created_at);
CREATE INDEX idx_course_department ON Course(department);
