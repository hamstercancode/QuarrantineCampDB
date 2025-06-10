CREATE TABLE PERSON ( 
    Person_ID           CHAR(6)         PRIMARY KEY, 
    Person_address      VARCHAR(50), 
    Person_name         VARCHAR(30)     NOT NULL, 
    Gender              CHAR(1), 
    Phone_no            CHAR(10),
    CONSTRAINT          check_person_gender CHECK (Gender = 'M' or Gender = 'F' or Gender IS NULL)
);

CREATE TABLE NURSE ( 
    Nurse_ID            CHAR(6)         PRIMARY KEY, 
    CONSTRAINT          fk_nurse_person_id FOREIGN KEY (Nurse_ID) 
                                REFERENCES PERSON(Person_ID) 
                                ON DELETE CASCADE
);

CREATE TABLE DOCTOR ( 
    Doctor_ID           CHAR(6)         PRIMARY KEY, 
    CONSTRAINT          fk_doctor_person_id FOREIGN KEY (Doctor_ID) 
                                REFERENCES PERSON(Person_ID) 
                                ON DELETE CASCADE
);

CREATE TABLE STAFF ( 
    Staff_ID            CHAR(6)         PRIMARY KEY, 
    CONSTRAINT          fk_staff_person_id FOREIGN KEY (Staff_ID)  
                               REFERENCES PERSON(Person_ID) 
                               ON DELETE CASCADE
);

CREATE TABLE VOLUNTEER ( 
    Volunteer_ID        CHAR(6)         PRIMARY KEY, 
    CONSTRAINT          fk_volunteer_person_id FOREIGN KEY (Volunteer_ID) 
                               REFERENCES PERSON(Person_ID) 
                               ON DELETE CASCADE
);

CREATE TABLE MANAGER ( 
    Manager_ID          CHAR(6)         PRIMARY KEY, 
    Doctor_ID           CHAR(6), 
    CONSTRAINT          fk_manager_person_id FOREIGN KEY (Manager_ID)   
                                REFERENCES PERSON(Person_ID)
                                ON DELETE CASCADE,
    CONSTRAINT          fk_manager_doctor_id FOREIGN KEY (Doctor_ID)  
                                REFERENCES DOCTOR(Doctor_ID) 
                                ON DELETE SET NULL
);

CREATE TABLE MEDICATION ( 
    Unique_code         CHAR(7)         PRIMARY KEY, 
    Med_name            VARCHAR(30)     UNIQUE, 
    Effect              VARCHAR(100), 
    Price               INT, 
    Expiration_Date     DATE 
);

CREATE TABLE PATIENT
(
	Patient_no CHAR(6) PRIMARY KEY,
	Patient_name VARCHAR(30) NOT NULL,
	ID_no CHAR(9) NOT NULL,
	Phone_no CHAR(10),
	Gender CHAR(1),
	Patient_address VARCHAR(50),
	Discharge_date DATE,
	Nurse_ID CHAR(6),
	Admission_date DATE NOT NULL,
	Location_before VARCHAR(50),
	Staff_ID CHAR(6),
	CONSTRAINT          check_patient_gender CHECK (Gender = 'M' or Gender = 'F' or Gender IS NULL),
	CONSTRAINT          fk_patient_nurse_cares FOREIGN KEY (Nurse_ID) 
                                REFERENCES NURSE(Nurse_ID)
                                ON DELETE SET NULL,
	CONSTRAINT          fk_patient_staff_admits FOREIGN KEY(Staff_ID) 
                                REFERENCES STAFF(Staff_ID)
                                ON DELETE SET NULL
);


CREATE TABLE NORMAL_SYMPTOM ( 
    Patient_no          CHAR(6), 
    Normal_symptoms     VARCHAR(50), 
    PRIMARY KEY         (Patient_no, Normal_symptoms),
    CONSTRAINT          fk_normal_symptom_patient_no FOREIGN KEY (Patient_no) 
                                REFERENCES PATIENT(Patient_no) 
                                ON DELETE CASCADE
);

CREATE TABLE SERIOUS_SYMPTOM ( 
    Patient_no          CHAR(6),  
    Serious_symptoms    VARCHAR(50), 
    PRIMARY KEY         (Patient_no, Serious_symptoms),
    CONSTRAINT          fk_serious_symptom_patient_no FOREIGN KEY (Patient_no) 
                                REFERENCES PATIENT(Patient_no) 
                                ON DELETE CASCADE
);

CREATE TABLE PATIENT_COMORBIDITY ( 
    Patient_no          CHAR(6), 
    Comorbidity         VARCHAR(50),  
    PRIMARY KEY         (Comorbidity, Patient_no), 
    CONSTRAINT          fk_comorbidity_patient_no FOREIGN KEY (Patient_no) 
                                REFERENCES PATIENT(Patient_no) 
                                ON DELETE CASCADE
);

CREATE TABLE ROOM ( 
    Room_no             CHAR(3)         PRIMARY KEY, 
    Building_no         CHAR(3), 
    Floor_no            SMALLINT, 
    Capacity            SMALLINT, 
    Room_Type           VARCHAR(12) 
);

CREATE TABLE ASSIGNED_TO ( 
    Patient_no          CHAR(6), 
    Room_no             CHAR(3), 
    Staff_ID            CHAR(6),
    Patient_condition   VARCHAR(30), 
    PRIMARY KEY         (Patient_no, Staff_ID), 
    CONSTRAINT          fk_assign_room_no FOREIGN KEY(Room_no) 
                                REFERENCES ROOM(Room_no)
                                ON DELETE SET NULL, 
    CONSTRAINT          fk_assign_patient_no FOREIGN KEY(Patient_no) 
                                REFERENCES PATIENT(Patient_no)
                                ON DELETE CASCADE, 
    CONSTRAINT          fk_assign_staff_ID FOREIGN KEY(Staff_ID) 
                                REFERENCES STAFF(Staff_ID) 
                                ON DELETE CASCADE
);

CREATE TABLE PA_LOCATION ( 
    Patient_no          CHAR(6), 
    Staff_ID            CHAR(6), 
    Locations           VARCHAR(50), 
    PRIMARY KEY         (Patient_no, Staff_ID, Locations),
    CONSTRAINT          fk_Location_assign FOREIGN KEY (Patient_no, Staff_ID)   
                            REFERENCES ASSIGNED_TO(Patient_no, Staff_ID)
                            ON DELETE CASCADE
);

CREATE TABLE TREATS ( 
    Patient_no          CHAR(6),      
    Doctor_ID           CHAR(6),      
    Medication_code     CHAR(7),    
    Start_date          DATE, 
    End_date            DATE, 
    Treat_result        VARCHAR(255), 
    PRIMARY KEY         (Patient_no, Doctor_ID, Medication_code), 
    CONSTRAINT          fk_treat_medication_code FOREIGN KEY(Medication_code) 
                                REFERENCES MEDICATION(Unique_code), 
    CONSTRAINT          fk_treat_doctor_id FOREIGN KEY(Doctor_ID) 
                                REFERENCES DOCTOR(Doctor_ID), 
    CONSTRAINT          fk_treat_patient_no FOREIGN KEY(Patient_no) 
                                REFERENCES PATIENT(Patient_no) 
                                ON DELETE CASCADE
);

CREATE TABLE PATIENT_TEST_RESULTS ( 
    Patient_no          CHAR(6), 
    SPO2                DECIMAL(5,2),       
    Respiratory_rate    INT, 
    PCR_test            CHAR(1), 
    PCR_ct_value        INT,
    Quick_test          CHAR(1), 
    Quick_ct_value      INT,
    Warning_mark        CHAR(1),
    CONSTRAINT          check_boolean CHECK ((PCR_test = 'T' or PCR_test = 'F' or PCR_test IS NULL) 
                                            and (Quick_test = 'T' or Quick_test = 'F' or Quick_test IS NULL) 
                                            and (Warning_mark = 'T' or Warning_mark = 'F' or Warning_mark IS NULL)),
    PRIMARY KEY         (Patient_no, SPO2, Respiratory_rate, PCR_test, Quick_test), 
    CONSTRAINT          fk_test_patient_no FOREIGN KEY (Patient_no) 
                                REFERENCES PATIENT(Patient_no) 
                                ON DELETE CASCADE
);

-- SELECT DATE_FORMAT(column_name, '%Y/%m/%d') FROM tablename
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

INSERT INTO PERSON VALUES('NUR001', '24 Le Loi Str, HCM City'             , 'Nguyen Van A'     , 'F', '0945519390');
INSERT INTO PERSON VALUES('NUR002', '69 Nguyen Binh Khiem Str, HCM City'  , 'Thay Giao Ba'     , 'M', '0838963738');
INSERT INTO PERSON VALUES('NUR003', '44/32 Phan Xich Long Str, HCM City'  , 'Takahashi N'      , 'M', '0904445454');
INSERT INTO PERSON VALUES('NUR004', '497 Hoa Hao Str, HCM City'           , 'Nguyen Van A'     , 'F', '0788757051');
INSERT INTO PERSON VALUES('NUR005', '168 Ly Thuong Kiet Str, HCM City'    , 'Nobi Nobita'      , 'M', '0789788124');
INSERT INTO PERSON VALUES('NUR006', '26 Le Lai Str, HCM City'             , 'Nguyen Van B'     , 'F', '0857871872');
INSERT INTO PERSON VALUES('NUR007', '6 Nguyen Trai Str, Dong Nai Province', 'Thay Giao Bon'    , 'M', '0386272293');
INSERT INTO PERSON VALUES('NUR008', '44 Nguyen Thuong Hien, HCM City'     , 'Satoshi'          , 'M', '0829397332');
INSERT INTO PERSON VALUES('NUR009', '497 30 Thang 4, Vinh Long Province'  , 'Shin Nohara'      , 'F', '0819739173');
INSERT INTO PERSON VALUES('NUR010', '168 Ly Thuong Kiet Str, Ha Noi'      , 'Nobi Doraemon'    , 'M', '0819379733');

INSERT INTO PERSON VALUES('DOC001', '1 Tran Hung Dao Str, HCM City'       , 'Tran Thi B'       , 'F', '0786543678');
INSERT INTO PERSON VALUES('DOC002', '268 Ly Thuong Kiet Str, HCM City'    , 'Nguyen Duc D'     , 'M', '0338861579');
INSERT INTO PERSON VALUES('DOC003', '5 Phan Xich Long Str, Da Nang City'  , 'Yamada N'         , 'M', '0908925454');
INSERT INTO PERSON VALUES('DOC004', '565 Phan Huy Ich Str, HCM City'      , 'Nguyen Thi Trau'  , 'F', '0972377382');
INSERT INTO PERSON VALUES('DOC005', '456 Le Thai To, Tien Giang Province' , 'Tran Van N'       , 'M', '0782396473');

INSERT INTO PERSON VALUES('STA001', '497 Hoa Hao Str, HCM City'           , 'Nguyen Van A'     , 'M', '0683286282');
INSERT INTO PERSON VALUES('STA002', '24 Ly Thai To Str, HCM City'         , 'Le Duan'          , 'M', '0789253282');
INSERT INTO PERSON VALUES('STA003', '57 Phan Xich Long Str, HCM City'     , 'Takeshi A'        , 'F', '0917637429');
INSERT INTO PERSON VALUES('STA004', '123 Nguyen Kim Str, HCM City'        , 'Nguyen Huu Truong', 'F', '0891638217');
INSERT INTO PERSON VALUES('STA005', '98 Le Thanh Tong Str, HCM City'      , 'Le Quang Tin'     , 'M', '0978133782');
INSERT INTO PERSON VALUES('STA006', '124 Nguyen Kim Str, HCM City'        , 'Nguyen Minh Tho'  , 'F', '0829379372');
INSERT INTO PERSON VALUES('STA007', '676 Le Thanh Tong Str, Ha Noi'       , 'Ly Quang Tin'     , 'M', '0872903782');

INSERT INTO PERSON VALUES('VOL001', '215 Ngo Gia Tu Str, HCM City'        , 'Nguyen Van A'     , 'M', '0965487364');
INSERT INTO PERSON VALUES('VOL002', '781 3 thang 2 Str, HCM City'         , 'Luong Van T'      , 'F', '0897685362');
INSERT INTO PERSON VALUES('VOL003', '4 Phan Xich Long Str, HN City'       , 'Honda N'          , 'F', '0897658436');
INSERT INTO PERSON VALUES('VOL004', '15 Ngo Gia Tu Str, HCM City'         , 'Nguyen Van B'     , 'M', '0812328123');
INSERT INTO PERSON VALUES('VOL005', '119 Ngo Quyen Str, HCM City'         , 'Nguyen Van Binh'  , 'M', '0987387388');

INSERT INTO PERSON VALUES('MAN001', '20 Cach Mang Thang Tam Str, HCM City', 'Nguyen Van A'     , 'M', '0763872917');
INSERT INTO PERSON VALUES('MAN002', '180 Nguyen Anh Thu Str, HCM City'    , 'Nha Bach D'       , 'F', '0989873279');
INSERT INTO PERSON VALUES('MAN003', '32 Tran Hung Dao Str, HCM City'      , 'Nakamura R'       , 'M', '0989897678');
INSERT INTO PERSON VALUES('MAN004', '44 Le Loi Str, HCM City'             , 'Tran Van Z'       , 'F', '0943567854');
INSERT INTO PERSON VALUES('MAN005', '12 Bach Dang Str, HCM City'          , 'Nguyen Thi Ba'    , 'M', '0976767578');

INSERT INTO NURSE VALUES('NUR001');
INSERT INTO NURSE VALUES('NUR002');
INSERT INTO NURSE VALUES('NUR003');
INSERT INTO NURSE VALUES('NUR004');
INSERT INTO NURSE VALUES('NUR005');
INSERT INTO NURSE VALUES('NUR006');
INSERT INTO NURSE VALUES('NUR007');
INSERT INTO NURSE VALUES('NUR008');
INSERT INTO NURSE VALUES('NUR009');
INSERT INTO NURSE VALUES('NUR010');

INSERT INTO DOCTOR VALUES('DOC001');
INSERT INTO DOCTOR VALUES('DOC002');
INSERT INTO DOCTOR VALUES('DOC003');
INSERT INTO DOCTOR VALUES('DOC004');
INSERT INTO DOCTOR VALUES('DOC005');

INSERT INTO STAFF VALUES('STA001');
INSERT INTO STAFF VALUES('STA002');
INSERT INTO STAFF VALUES('STA003');
INSERT INTO STAFF VALUES('STA004');
INSERT INTO STAFF VALUES('STA005');
INSERT INTO STAFF VALUES('STA006');
INSERT INTO STAFF VALUES('STA007');

INSERT INTO VOLUNTEER VALUES('VOL001');
INSERT INTO VOLUNTEER VALUES('VOL002');
INSERT INTO VOLUNTEER VALUES('VOL003');
INSERT INTO VOLUNTEER VALUES('VOL004');
INSERT INTO VOLUNTEER VALUES('VOL005');

INSERT INTO MANAGER VALUES('MAN001','DOC001');
INSERT INTO MANAGER(Manager_ID) VALUES('MAN002');
INSERT INTO MANAGER(Manager_ID) VALUES('MAN003');
INSERT INTO MANAGER(Manager_ID) VALUES('MAN004');
INSERT INTO MANAGER(Manager_ID) VALUES('MAN005');

INSERT INTO MEDICATION VALUES('MED0001', 'Bromhexin hydroclorid', 'cough'          , 2000, '2022-10-20');
INSERT INTO MEDICATION VALUES('MED0002', 'Paracetamol'          , 'fever, headache', 3000, '2022-11-08');
INSERT INTO MEDICATION VALUES('MED0003', 'Terpin Codein'        , 'cough'          , 1000, '2022-10-02');
INSERT INTO MEDICATION VALUES('MED0004', 'Esphelaran'           , 'constipation'   , 3000, '2022-10-20');
INSERT INTO MEDICATION VALUES('MED0005', 'Mythyl Orange'        , 'cold'           , 2500, '2022-12-22');


INSERT INTO PATIENT VALUES('PAT001', 'Peter Tran'       , '323692071', '0948297879', 'M', 'Bien Hoa City, Dong Nai Province'  , '2020-11-20', 'NUR001', '2020-10-20', 'Bach Khoa Dormitory'           , 'STA001');
INSERT INTO PATIENT VALUES('PAT002', 'Ben Parker'       , '573723683', '0893797192', 'F', '268 Ly Thuong Kiet Str, HCM City'  , '2020-10-20', 'NUR002', '2020-09-25', 'Bach Khoa University'          , 'STA002');
INSERT INTO PATIENT VALUES('PAT003', 'Nguyen Bach Cuc'  , '871238978', '0997187933', 'F', '67 Tran Hung Dao Str, HCM City'    ,  NULL       , 'NUR003', '2021-11-01', '23 Tran Hung Dao Str, HCM City', 'STA003');
INSERT INTO PATIENT VALUES('PAT004', 'Le The Duy'       , '882772739', '0917936782', 'M', '127 Tran Quoc Toan Str, HCM City'  , '2021-04-03', 'NUR005', '2021-03-25', 'University of Economics'       , 'STA005');
INSERT INTO PATIENT VALUES('PAT005', 'Truong Quang Thai', '183934678', '0891731933', 'F', '635 Ly Thuong Kiet Str, HCM City'  , '2021-06-30', 'NUR004', '2021-06-23', 'Ly Thuong Kiet Co.op Mart'     , 'STA006');
INSERT INTO PATIENT VALUES('PAT006', 'Nguyen Van A'     , '723972033', '0781673811', 'F', '36 Nguyen Tri Phuong Str, HCM City',  NULL       , 'NUR006', '2021-10-10', 'Tu Du Hospital'                , 'STA007');
INSERT INTO PATIENT VALUES('PAT007', 'Tran Van B'       , '913797193', '0367481791', 'M', '23 Hai Ba Truong Str, HCM City'    , '2021-05-03', 'NUR008', '2021-03-30', 'Tien Giang Province'           , 'STA004');
INSERT INTO PATIENT VALUES('PAT008', 'Nguyen Van A'     , '742810139', '0183981613', 'M', '33 Dinh Tien Hoang Str, HCM City'  , '2021-09-02', 'NUR009', '2021-08-07', 'United State'                  , 'STA002');
INSERT INTO PATIENT VALUES('PAT009', 'Le Thi C'         , '816387793', '0819738618', 'F', '29 Phu Dong Str, HCM City'         ,  NULL       , 'NUR007', '2021-10-15', 'Bach Khoa Dormitory'           , 'STA003');
INSERT INTO PATIENT VALUES('PAT010', 'Bui Trong D'      , '183834678', '0891379613', 'M', '99 Ngo Quyen Str, HCM City'        , '2021-05-07', 'NUR001', '2021-05-01', '56 Nguyen Trai Str, HCM City'  , 'STA001');
INSERT INTO PATIENT VALUES('PAT011', 'Ly Van T'         , '813781731', '0185714617', 'F', '94 Au Co Str, HCM City'            , '2021-05-04', 'NUR002', '2021-04-20', '6 Ly Tu Trong Str, HCM City'   , 'STA002');
INSERT INTO PATIENT VALUES('PAT012', 'Tran Van V'       , '123645631', '0312412879', 'M', '8 Tan Thuan Dong Str, HCM City'    , '2020-05-20', 'NUR001', '2021-12-25', 'Bach Khoa Dormitory'           , 'STA001');


INSERT INTO NORMAL_SYMPTOM VALUES('PAT001', 'dry cough');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT001', 'tiredness');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT001', 'loss of smell');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT002', 'fever');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT002', 'cough');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT003', 'discolouration of fingers');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT003', 'sore throat');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT004', 'aches and pains');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT004', 'diarrhoea');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT004', 'conjunctivitis');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT005', 'loss of taste');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT005', 'cough');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT006', 'discolouration of toes');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT007', 'sore throat');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT007', 'fever');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT008', 'tiredness');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT008', 'loss of smell');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT008', 'fever');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT009', 'cough');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT009', 'discolouration of fingers');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT009', 'headache');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT010', 'rash on skin');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT010', 'discolouration of toes');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT010', 'fever');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT011', 'sore throat');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT011', 'dry cough');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT011', 'tiredness');
INSERT INTO NORMAL_SYMPTOM VALUES('PAT011', 'headache');

INSERT INTO SERIOUS_SYMPTOM VALUES('PAT001', 'shortness of breath');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT001', 'chest pain');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT002', 'loss of speech');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT002', 'shortness of breath');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT004', 'chest pain');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT005', 'shortness of breath');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT006', 'chest pain');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT008', 'loss of movement');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT009', 'chest pain');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT010', 'loss of movement');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT011', 'shortness of breath');
INSERT INTO SERIOUS_SYMPTOM VALUES('PAT011', 'chest pain');

INSERT INTO PATIENT_COMORBIDITY VALUES('PAT001', 'cancer');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT002', 'chronic lung diseases');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT003', 'diabetes');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT005', 'chronic lung diseases');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT005', 'cancer');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT006', 'immunocompromised state');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT007', 'heart conditions');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT008', 'immunocompromised state');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT010', 'heart conditions');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT010', 'diabetes');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT011', 'diabetes');
INSERT INTO PATIENT_COMORBIDITY VALUES('PAT011', 'cancer');

INSERT INTO ROOM VALUES ('200', 'B12', 2, 10, 'VIP');
INSERT INTO ROOM VALUES ('101', 'B12', 1, 30, 'Normal');
INSERT INTO ROOM VALUES ('102', 'B12', 1, 50, 'Normal');
INSERT INTO ROOM VALUES ('103', 'B12', 1, 40, 'Normal');
INSERT INTO ROOM VALUES ('304', 'D07', 3, 50, 'Normal');
INSERT INTO ROOM VALUES ('405', 'A04', 4, 20, 'Recuperation');
INSERT INTO ROOM VALUES ('406', 'A04', 4, 20, 'Recuperation');
INSERT INTO ROOM VALUES ('407', 'A04', 4, 20, 'Recuperation');
INSERT INTO ROOM VALUES ('308', 'C10', 3, 10, 'VIP');
INSERT INTO ROOM VALUES ('509', 'D08', 5, 50, 'Normal');

INSERT INTO ASSIGNED_TO VALUES ('PAT001', '101', 'STA001', 'Normal');
INSERT INTO ASSIGNED_TO VALUES ('PAT002', '101', 'STA002', 'Normal');
INSERT INTO ASSIGNED_TO VALUES ('PAT003', '200', 'STA003', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT004', '308', 'STA003', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT005', '102', 'STA003', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT006', '405', 'STA005', 'Normal');
INSERT INTO ASSIGNED_TO VALUES ('PAT007', '407', 'STA006', 'Normal');
INSERT INTO ASSIGNED_TO VALUES ('PAT008', '103', 'STA007', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT009', '102', 'STA004', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT010', '308', 'STA002', 'Serious');
INSERT INTO ASSIGNED_TO VALUES ('PAT011', '509', 'STA005', 'Normal');

INSERT INTO PA_LOCATION VALUES('PAT001', 'STA001', 'Emergency room');
INSERT INTO PA_LOCATION VALUES('PAT002', 'STA002', 'Normal room');
INSERT INTO PA_LOCATION VALUES('PAT003', 'STA003', 'Recuperation room');
INSERT INTO PA_LOCATION VALUES('PAT004', 'STA003', 'Normal room');
INSERT INTO PA_LOCATION VALUES('PAT005', 'STA003', 'Emergency room');
INSERT INTO PA_LOCATION VALUES('PAT006', 'STA005', 'Normal room');
INSERT INTO PA_LOCATION VALUES('PAT007', 'STA006', 'Recuperation room');
INSERT INTO PA_LOCATION VALUES('PAT008', 'STA007', 'Normal room');
INSERT INTO PA_LOCATION VALUES('PAT009', 'STA004', 'Normal room');
INSERT INTO PA_LOCATION VALUES('PAT010', 'STA002', 'Recuperation room');
INSERT INTO PA_LOCATION VALUES('PAT011', 'STA005', 'Normal room');



INSERT INTO TREATS VALUES ('PAT001', 'DOC001', 'MED0001', '2022-10-20', '2022-10-27', 'Normal');
INSERT INTO TREATS VALUES ('PAT001', 'DOC001', 'MED0002', '2020-10-28', '2020-10-05', 'Normal');
INSERT INTO TREATS VALUES ('PAT001', 'DOC001', 'MED0003', '2021-10-06', '2021-10-20', 'Normal');
INSERT INTO TREATS VALUES ('PAT002', 'DOC002', 'MED0004', '2020-09-25', '2020-10-02', 'Normal');
INSERT INTO TREATS VALUES ('PAT002', 'DOC002', 'MED0005', '2021-10-03', '2021-10-10', 'Normal');
INSERT INTO TREATS VALUES ('PAT002', 'DOC002', 'MED0001', '2021-10-11', '2021-11-01', 'Normal');
INSERT INTO TREATS VALUES ('PAT003', 'DOC002', 'MED0002', '2021-11-01', '2021-11-11', 'Normal');
INSERT INTO TREATS VALUES ('PAT004', 'DOC003', 'MED0005', '2021-03-25', '2021-03-31', 'Serious');
INSERT INTO TREATS VALUES ('PAT004', 'DOC001', 'MED0001', '2021-04-01', '2021-04-03', 'Normal');
INSERT INTO TREATS VALUES ('PAT005', 'DOC002', 'MED0002', '2021-06-23', '2021-06-25', 'Serious');
INSERT INTO TREATS VALUES ('PAT005', 'DOC002', 'MED0003', '2021-06-26', '2021-06-28', 'Serious');
INSERT INTO TREATS VALUES ('PAT005', 'DOC002', 'MED0004', '2021-06-29', '2021-06-30', 'Normal');
INSERT INTO TREATS VALUES ('PAT006', 'DOC003', 'MED0005', '2021-10-25', '2021-11-25', 'Normal');
INSERT INTO TREATS VALUES ('PAT006', 'DOC003', 'MED0001', '2021-10-20', '2021-10-27', 'Normal');
INSERT INTO TREATS VALUES ('PAT007', 'DOC004', 'MED0002', '2021-03-30', '2021-04-15', 'Normal');
INSERT INTO TREATS VALUES ('PAT007', 'DOC004', 'MED0003', '2021-04-16', '2021-05-03', 'Normal');
INSERT INTO TREATS VALUES ('PAT008', 'DOC005', 'MED0004', '2021-08-07', '2021-08-27', 'Normal');
INSERT INTO TREATS VALUES ('PAT008', 'DOC005', 'MED0005', '2021-09-28', '2021-09-02', 'Normal');
INSERT INTO TREATS VALUES ('PAT009', 'DOC005', 'MED0001', '2021-10-15', '2021-10-20', 'Serious');
INSERT INTO TREATS VALUES ('PAT009', 'DOC005', 'MED0002', '2021-10-21', '2021-10-31', 'Serious');
INSERT INTO TREATS VALUES ('PAT010', 'DOC003', 'MED0003', '2021-05-01', '2021-05-02', 'Serious');
INSERT INTO TREATS VALUES ('PAT010', 'DOC002', 'MED0004', '2021-05-03', '2021-05-04', 'Normal');
INSERT INTO TREATS VALUES ('PAT010', 'DOC003', 'MED0005', '2021-05-05', '2021-05-07', 'Normal');
INSERT INTO TREATS VALUES ('PAT011', 'DOC001', 'MED0001', '2021-04-20', '2021-04-27', 'Normal');
INSERT INTO TREATS VALUES ('PAT011', 'DOC002', 'MED0002', '2021-04-28', '2021-04-30', 'Normal');
INSERT INTO TREATS VALUES ('PAT011', 'DOC003', 'MED0003', '2021-05-01', '2021-05-04', 'Normal');

INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT001', 97.88, 20, 'F', NULL, 'F', NULL, 'F'); 
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT002', 99.12, 23, 'T', 35  , 'T', 36  , 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT003', 50.14, 25, 'F', NULL, 'F', NULL, 'T');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT004', 97.88, 19, 'T', 40  , 'T', 50  , 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT005', 86.34, 17, 'T', 32  , 'T', 40  , 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT006', 50.88, 23, 'F', NULL, 'F', NULL, 'T');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT007', 98.34, 18, 'F', NULL, 'F', NULL, 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT008', 97.54, 19, 'F', NULL, 'F', NULL, 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT009', 50.78, 21, 'F', NULL, 'F', NULL, 'T');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT010', 96.34, 21, 'T', 33  , 'T', 34  , 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT011', 89.78, 22, 'F', NULL, 'F', NULL, 'F');
INSERT INTO PATIENT_TEST_RESULTS VALUES ('PAT012', 90.69, 22, 'T', 30,   'T', 30,   'T');

-- Function / Procedure
UPDATE PATIENT_TEST_RESULTS
SET PCR_test = 'T',
    PCR_ct_value =  NULL
-- WHERE EXISTS (SELECT Admission_date FROM PATIENT WHERE Admission_date >= '1-9-2020')
WHERE EXISTS(SELECT Admission_date FROM PATIENT WHERE Admission_date >= '2020-9-1')
;

SELECT *
FROM PATIENT
WHERE Patient_name = 'Nguyen Van A'
;

CREATE OR REPLACE FUNCTION get_detail_patient
(Patient_ID in PATIENT_TEST_RESULTS.Patient_no%TYPE)
RETURN SYS_REFCURSOR
AS
   o_cursor   SYS_REFCURSOR;
BEGIN
    OPEN o_cursor FOR
        SELECT *
        FROM PATIENT_TEST_RESULTS
        WHERE PATIENT_TEST_RESULTS.Patient_no = Patient_ID;
    RETURN o_cursor;
END 
;

SELECT get_detail_patient('PAT001')FROM DUAL;


CREATE OR REPLACE PROCEDURE sort_nurse_desc
(start_date IN DATE, end_date IN DATE, cursorParam OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN cursorParam FOR
        SELECT Nurse_ID AS Nurse, COUNT(Patient_no) AS Num_patient
        FROM PATIENT
        WHERE Admission_date >= start_date AND (Discharge_date <= end_date OR Discharge_date IS NULL)
        GROUP BY Nurse_ID
        ORDER BY COUNT(Patient_no) DESC;
END 
;

var c refcursor;
execute sort_nurse_desc('2020-1-1','2022-1-1',:c)
print c;
