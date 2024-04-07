CREATE TABLE Dog (
    chip_number INT NOT NULL,
    name VARCHAR(45) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    CONSTRAINT PK_Dog PRIMARY KEY (chip_number)
);

CREATE TABLE Person (
    id INT NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    phone_number VARCHAR(9) NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (id)
);

CREATE TABLE Volunteer (
    Person_id INT NOT NULL,
    status VARCHAR(15) NOT NULL,
    CONSTRAINT PK_Volunteer PRIMARY KEY (Person_id),
    CONSTRAINT FK_Volunteer_Person FOREIGN KEY (Person_id) REFERENCES Person (id)
);

CREATE TABLE Treatment (
    id INT NOT NULL,
    treatment VARCHAR(45) NOT NULL,
    CONSTRAINT PK_Treatment PRIMARY KEY (id)
);

CREATE TABLE Specialization (
    id INT NOT NULL,
    specialization_name VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Specialization PRIMARY KEY (id)
);

CREATE TABLE Dog_Treatment (
    Dog_chip_number INT NOT NULL,
    Treatment_id INT NOT NULL,
    CONSTRAINT PK_Dog_Treatment PRIMARY KEY (Dog_chip_number, Treatment_id),
    CONSTRAINT FK_Dog_Treatment_Dog FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT FK_Dog_Treatment_Treatment FOREIGN KEY (Treatment_id) REFERENCES Treatment (id)
);

CREATE TABLE Specializations (
    Specialization_id INT NOT NULL,
    Volunteer_Person_id INT NOT NULL,
    CONSTRAINT PK_Specializations PRIMARY KEY (Specialization_id, Volunteer_Person_id),
    CONSTRAINT FK_Specializations_Specialization FOREIGN KEY (Specialization_id) REFERENCES Specialization (id),
    CONSTRAINT FK_Specializations_Volunteer FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

CREATE TABLE Adoption (
    id INT NOT NULL,
    Dog_chip_number INT NOT NULL,
    Person_id INT NOT NULL,
    adoption_status VARCHAR(25) NOT NULL,
    date DATE NOT NULL,
    Volunteer_Person_id INT NOT NULL,
    CONSTRAINT PK_Adoption PRIMARY KEY (id),
    CONSTRAINT FK_Adoption_Person FOREIGN KEY (Person_id) REFERENCES Person (id),
    CONSTRAINT FK_Adoption_Dog FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT FK_Adoption_Volunteer FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

CREATE TABLE ShelterCare (
    Volunteer_Person_id INT NOT NULL,
    Dog_chip_number INT NOT NULL,
    CONSTRAINT PK_ShelterCare PRIMARY KEY (Volunteer_Person_id, Dog_chip_number),
    CONSTRAINT FK_ShelterCare_Dog FOREIGN KEY (Dog_chip_number) REFERENCES Dog (chip_number),
    CONSTRAINT FK_ShelterCare_Volunteer FOREIGN KEY (Volunteer_Person_id) REFERENCES Volunteer (Person_id)
);

-- Insertions for the Dog table
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (1, 'TOFIK', '2021-04-15', 'Male', '2023-02-01');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (2, 'Azor', '2012-05-15', 'Male', '2012-06-20');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (3, 'Luna', '2015-08-10', 'Female', '2015-09-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (4, 'Rex', '2018-03-03', 'Male', '2018-04-10');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (5, 'Coco', '2020-11-20', 'Female', '2020-12-25');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (6, 'Bella', '2019-01-01', 'Female', '2019-02-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (7, 'Rocky', '2016-06-25', 'Male', '2016-08-01');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (8, 'Mia', '2017-09-12', 'Female', '2017-10-20');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (9, 'Max', '2014-04-08', 'Male', '2014-05-15');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (10, 'Lola', '2019-11-17', 'Female', '2019-12-25');
INSERT INTO Dog (chip_number, name, birth_date, gender, admission_date) VALUES (11, 'Buddy', '2016-02-09', 'Male', '2016-03-15');

-- Insertions for the Person table
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (1, 'Anna', 'Kowalska', '123456789');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (2, 'Jan', 'Nowak', '987654321');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (3, 'Alicja', 'Wiśniewska', '111222333');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (4, 'Piotr', 'Mazurek', '444555666');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (5, 'Karolina', 'Dąbrowska', '777888999');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (6, 'Marek', 'Lewandowski', '555444333');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (7, 'Ewa', 'Kaczor', '111222333');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (8, 'Paweł', 'Górski', '999888777');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (9, 'Wiktoria', 'Jankowska', '333222111');
INSERT INTO Person (id, first_name, last_name, phone_number) VALUES (10, 'Krzysztof', 'Nowicki', '666555444');

-- Insertions for the Volunteer table
INSERT INTO Volunteer (Person_id, status) VALUES (1, 'Active');
INSERT INTO Volunteer (Person_id, status) VALUES (3, 'Inactive');
INSERT INTO Volunteer (Person_id, status) VALUES (5, 'Active');

-- Insertions for the Specialization table
INSERT INTO Specialization (id, specialization_name) VALUES (1, 'Veterinarian');
INSERT INTO Specialization (id, specialization_name) VALUES (2, 'Behaviorist');
INSERT INTO Specialization (id, specialization_name) VALUES (3, 'Dog Trainer');

-- Insertions for the Treatment table
INSERT INTO Treatment (id, treatment) VALUES (1, 'Vaccination');
INSERT INTO Treatment (id, treatment) VALUES (2, 'Microchipping');
INSERT INTO Treatment (id, treatment) VALUES (3, 'Sterilization');

-- Insertions for the Specializations table
INSERT INTO Specializations (Specialization_id, Volunteer_Person_id) VALUES (1, 1);
INSERT INTO Specializations (Specialization_id, Volunteer_Person_id) VALUES (2, 3);
INSERT INTO Specializations (Specialization_id, Volunteer_Person_id) VALUES (3, 5);

-- Insertions for the Dog_Treatment table
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (1, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (2, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (3, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (4, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (5, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (6, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (7, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (8, 2);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (9, 3);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (10, 1);
INSERT INTO Dog_Treatment (Dog_chip_number, Treatment_id) VALUES (11, 2);

-- Insertions for the Adoption table
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (1, 1, 1, 'Adopted', '2023-03-01', 1);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (2, 2, 2, 'Available for adoption', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (3, 3, 3, 'In progress', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (4, 4, 4, 'Available for adoption', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (5, 5, 5, 'Adopted', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (6, 6, 6, 'Available for adoption', '2023-03-01', 1);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (7, 7, 7, 'Adopted', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (8, 8, 8, 'Available for adoption', '2023-03-01', 3);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (9, 9, 9, 'Adopted', '2023-03-01', 5);
INSERT INTO Adoption (id, Dog_chip_number, Person_id, adoption_status, date, Volunteer_Person_id) VALUES (10, 10, 10, 'Available for adoption', '2023-03-01', 1);

-- Insertions for the ShelterCare table
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (1, 1);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (3, 2);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (5, 3);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (3, 4);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (5, 5);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (1, 6);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (3, 7);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (5, 8);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (3, 9);
INSERT INTO ShelterCare (Volunteer_Person_id, Dog_chip_number) VALUES (1, 10);

-- Select all dogs born after a specific date
SELECT * FROM Dog WHERE birth_date > '2018-01-01';

-- Select all adopted dogs and their new owner's information
SELECT Dog.name, Person.first_name, Person.last_name FROM Adoption
JOIN Dog ON Adoption.Dog_chip_number = Dog.chip_number
JOIN Person ON Adoption.Person_id = Person.id
WHERE Adoption.adoption_status = 'Adopted';

-- Count adoptions by status
SELECT adoption_status, COUNT(*) AS total FROM Adoption GROUP BY adoption_status;

-- Average number of dogs admitted per year
SELECT YEAR(admission_date) AS year, COUNT(*) / COUNT(DISTINCT YEAR(admission_date)) AS avg_admitted_per_year FROM Dog GROUP BY YEAR(admission_date);

-- Select dogs that have received a specific treatment
SELECT * FROM Dog WHERE chip_number IN (SELECT Dog_chip_number FROM Dog_Treatment WHERE Treatment_id = (SELECT id FROM Treatment WHERE treatment = 'Vaccination'));


