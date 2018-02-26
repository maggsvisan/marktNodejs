CREATE TABLE Door (
  id INT NOT NULL AUTO_INCREMENT,
  doorLocation VARCHAR(50) NOT NULL,
  doorDescription VARCHAR(50) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE User (
  id INT NOT NULL AUTO_INCREMENT,
  fName VARCHAR(30) NOT NULL,
  lName VARCHAR(30) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  adminPer BOOLEAN NOT NULL,
  email VARCHAR(30) NOT NULL,
  passwrd VARCHAR(30),
  birthday date,
  userType VARCHAR(30) NOT NULL,
  comments VARCHAR(30),

  PRIMARY KEY (id)
);


CREATE TRIGGER user_qrcodeInsert
AFTER INSERT ON User
FOR EACH ROW 
  INSERT INTO QRCode (idUser)
  VALUES (NEW.id);

INSERT INTO User (fName,lName,phone, adminPer, email,passwrd,birthday,userType,comments) VALUES 
('Rafa', 'Gamez', '998899', FALSE ,'rafa@marktlabs.com', '12345','1993-05-16','Employee','Empleado fulltime');

INSERT INTO User (fName,lName,phone, adminPer, email,passwrd,birthday,userType,comments) VALUES 
('maggie', 'villarreal', '811998899', TRUE,'magg@marktlabs.com', '12345','1994-04-15','Employee','Es nueva empleada');







CREATE TABLE QRCode (
  id INT NOT NULL AUTO_INCREMENT,
  QRCodeValue VARCHAR(50),
  expirationDate datetime ,
  activationDate datetime ,
  idUser INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (idUser) REFERENCES User(id)
);

--- para cambiar de null a not null
ALTER TABLE QRCode
CHANGE COLUMN activationDate activationDate datetime ;

ALTER TABLE QRCode
CHANGE COLUMN QRCodeValue QRCodeValue VARCHAR(50) ;
---

CREATE TABLE AccessRecord (
  id INT NOT NULL AUTO_INCREMENT,
  QRCode INT NOT NULL,
  date_record datetime NOT NULL,
  door INT NOT NULL,
  

  PRIMARY KEY (id),
  FOREIGN KEY (QRCode) REFERENCES QRCode(id),
  FOREIGN KEY (door) REFERENCES Door(id)
);


CREATE TABLE Schedule (
  id INT NOT NULL AUTO_INCREMENT,
  meetingRoom VARCHAR(30) NOT NULL,
  starts datetime NOT NULL,
  ends datetime NOT NULL,
  idUser INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (idUser) REFERENCES User(id)
);



-- example of trigger

CREATE TABLE qrcodes (
  id int not null auto_increment,
  user_id int not null,
    
  PRIMARY KEY (id)
);

CREATE TABLE user (
  id int not null auto_increment,
  name varchar(50) not null,
  
  PRIMARY KEY (id)
);

CREATE TRIGGER user_qrcode 
AFTER INSERT ON user
FOR EACH ROW 
  INSERT INTO qrcodes (user_id)
  VALUES (NEW.id);

INSERT INTO user (name) VALUES 
('poncho'),
('magg');
------




/*-- StoredProcedure Example-- */

DELIMITER $$
CREATE PROCEDURE registerUser (IN val1 VARCHAR(20), IN val2 VARCHAR(20),IN val3 VARCHAR(20),
IN val4 BOOLEAN,IN val5 VARCHAR(20),IN val6 VARCHAR(20),IN val7 date, IN val10 VARCHAR(20))

BEGIN
 INSERT INTO User (fName,lName, phone, adminPer, email, passwrd, birthday, comments)
 VALUES (val1, val2, val3,val4, val5, val6, val7, val10);



END$$

DELIMITER ;


--aqui termina el SP


call registerUser("Es de vidrio");


-- para mostrar todos los procedures:
 SHOW PROCEDURE STATUS
