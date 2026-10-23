USE university_registration;
DELIMITER $$
DROP TRIGGER IF EXISTS Prevent_Faculty_Double_Booking$$
CREATE TRIGGER Prevent_Faculty_Double_Booking BEFORE INSERT ON Section FOR EACH ROW
BEGIN
 IF EXISTS(SELECT 1 FROM Section s WHERE s.faculty_id=NEW.faculty_id AND s.semester_id=NEW.semester_id AND s.schedule_day=NEW.schedule_day AND s.start_time<NEW.end_time AND s.end_time>NEW.start_time) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Faculty has an overlapping teaching slot';
 END IF;
END$$
DELIMITER ;
