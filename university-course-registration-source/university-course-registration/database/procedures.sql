USE university_registration;
DELIMITER $$
DROP PROCEDURE IF EXISTS EnrollStudent$$
CREATE PROCEDURE EnrollStudent(IN p_student_id INT, IN p_section_id INT)
BEGIN
 DECLARE v_capacity INT; DECLARE v_count INT;
 START TRANSACTION;
 SELECT capacity INTO v_capacity FROM Section WHERE section_id=p_section_id FOR UPDATE;
 IF v_capacity IS NULL THEN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Section not found'; END IF;
 SELECT COUNT(*) INTO v_count FROM Enrollment WHERE student_id=p_student_id AND section_id=p_section_id AND status='ENROLLED';
 IF v_count>0 THEN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Already enrolled'; END IF;
 SELECT COUNT(*) INTO v_count FROM Enrollment WHERE section_id=p_section_id AND status='ENROLLED';
 IF v_count>=v_capacity THEN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Section full'; END IF;
 INSERT INTO Enrollment(student_id,section_id,status) VALUES(p_student_id,p_section_id,'ENROLLED') ON DUPLICATE KEY UPDATE status='ENROLLED',enrollment_date=CURRENT_TIMESTAMP;
 COMMIT;
END$$
DELIMITER ;
