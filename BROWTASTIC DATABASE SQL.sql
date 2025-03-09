CREATE DATABASE BROWTASTIC

 CREATE SCHEMA BROWTASTIC

CREATE TABLE BROWTASTIC.Appointments
(
	Appointment_id       INTEGER NOT NULL,
	Appointment_Date     DATE NULL,
	Status               VARCHAR(20) NULL,
	Service_id           VARCHAR(20) NULL,
	Customer_id          INTEGER NOT NULL,
	TouchUp_Date         DATE NULL,
	TotalCost            INTEGER NULL
);



ALTER TABLE BROWTASTIC.Appointments
ADD PRIMARY KEY (Appointment_id);



CREATE TABLE BROWTASTIC.Costumer
(
	Customer_id          INTEGER NOT NULL,
	First_name           VARCHAR(20) NULL,
	Last_name            VARCHAR(20) NULL,
	Middle_name          VARCHAR(20) NULL,
	Email                VARCHAR(20) NULL,
	PhoneNumber          INTEGER NULL,
	Costumer_name        VARCHAR(20) NULL
);



ALTER TABLE BROWTASTIC.Costumer
ADD PRIMARY KEY (Customer_id);



CREATE TABLE BROWTASTIC.Notification
(
	Notification_ID      INTEGER NOT NULL,
	Appointment_ID       INTEGER NULL,
	Customer_ID          INTEGER NULL,
	Notification_type    VARCHAR(20) NULL,
	Notification_Status  VARCHAR(20) NULL,
	Sent_date_Time       DATE NULL,
	Delivery_method      VARCHAR(20) NULL,
	Message_Content      VARCHAR(20) NULL,
	
);



ALTER TABLE BROWTASTIC.Notification
ADD PRIMARY KEY (Notification_ID);



CREATE TABLE BROWTASTIC.Payment
(
	AmountPaid           VARCHAR(20) NULL,
	PaymentDate          DATE NULL,
	Appointment_id       INTEGER NOT NULL,
	PaymentMethod        VARCHAR(20) NULL,
	PaymentStatus        VARCHAR(20) NULL,
	Payment_ID           INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Payment
ADD PRIMARY KEY (Payment_ID);



CREATE TABLE BROWTASTIC.Procedure_
(
	ProcedureName        VARCHAR(20) NULL,
	Microshading         VARCHAR(20) NULL,
	Microblading         CHAR NULL,
	Ombre_brows          VARCHAR(20) NULL,
	Service_id           INTEGER NULL,
	ProcedureDescription VARCHAR(20) NULL,
	Procedure_ID         INTEGER NOT NULL,
	Appointment_id       INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Procedure_
ADD PRIMARY KEY (Procedure_ID);



CREATE TABLE BROWTASTIC.Review_feedback
(
	review_feedback_ID   INTEGER NOT NULL,
	Appointment_ID       INTEGER NULL,
	Service_ID           INTEGER NULL,
	ReviewText           VARCHAR NULL,
	Ratings              NUMERIC NULL,
	ReviewDate           DATE NULL,
	Customer_id          INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Review_feedback
ADD PRIMARY KEY (review_feedback_ID);



CREATE TABLE BROWTASTIC.Sales
(
	sales_ID             INTEGER NOT NULL,
	PurchasedAmount      NUMERIC NULL,
	Appointment_id       INTEGER NOT NULL,
	Discount_id          INTEGER NULL,
	SalesDate            VARCHAR(20) NULL,
	Customer_id          INTEGER NULL,
	DiscountedAmount     INTEGER NULL
);



ALTER TABLE [BROWTASTIC].[Sales]
ADD PRIMARY KEY (sales_id);



CREATE TABLE BROWTASTIC.Seasonal_Discount
(
	Discount_name        VARCHAR(20) NULL,
	Discount_percentage  NUMERIC NULL,
	StartDate            DATE NULL,
	EndDate              DATE NULL,
	Seasonal_Discount_ID INTEGER NOT NULL,
	Services_ID          INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Seasonal_Discount
ADD PRIMARY KEY (Seasonal_Discount_ID);



CREATE TABLE BROWTASTIC.Services
(
	Procedure_type       VARCHAR(20) NULL,
	price                DECIMAL(19,4) NOT NULL,
	duration             TIME NULL,
	Services_ID          INTEGER NOT NULL,
	Services_name        VARCHAR(20) NULL,
	Services_description VARCHAR(20) NULL,
	Appointment_id       INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Services
ADD PRIMARY KEY (Services_ID);



CREATE TABLE BROWTASTIC.Touch_up
(
	Touch_Up_Status      VARCHAR(20) NULL,
	TouchUp_Date         DATE NOT NULL,
	TouchUp_Duration_Id  INTEGER NULL,
	Touch_up_ID          INTEGER NOT NULL,
	Appointment_id       INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.Touch_up
ADD PRIMARY KEY (Touch_up_ID);



CREATE TABLE BROWTASTIC.TouchUp_6_12_Months
(
	TouchUp_6_12_Months_ID INTEGER NOT NULL,
	TouchUp_6_12_Months_LongTerm DATE NULL,
	TouchUp_Duration_ID  INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.TouchUp_6_12_Months
ADD PRIMARY KEY (TouchUp_6_12_Months_ID,TouchUp_Duration_ID);



CREATE TABLE BROWTASTIC.TouchUp__6_12_weeks
(
	TouchUp__6_12_weeks_ID INTEGER NOT NULL,
	TouchUp__6_12_weeks_ShorTerm DATE NULL,
	TouchUp_Duration_ID  INTEGER NOT NULL
);



ALTER TABLE BROWTASTIC.TouchUp__6_12_weeks
ADD PRIMARY KEY (TouchUp__6_12_weeks_ID,TouchUp_Duration_ID);



CREATE TABLE BROWTASTIC.TouchUp_Duration
(
	TouchUp_Duration_ID  INTEGER NOT NULL,
	TouchUp_Duration_LongTerm DATE NULL,
	TouchUp_Duration_ShorTerm DATE NULL,
	Touch_up_ID          INTEGER NULL
);



ALTER TABLE BROWTASTIC.TouchUp_Duration
ADD PRIMARY KEY (TouchUp_Duration_ID);



ALTER TABLE [BROWTASTIC].[Appointments]
ADD CONSTRAINT FK_BROWTASTIC_AP FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.Appointments
ADD CONSTRAINT FK_BROWTASTIC_CU FOREIGN KEY (Customer_id) REFERENCES [BROWTASTIC].[Costumer] (Customer_id);



ALTER TABLE BROWTASTIC.Notification
ADD CONSTRAINT FK_BROWTASTIC_NT FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments](Appointment_id);



ALTER TABLE BROWTASTIC.Payment
ADD CONSTRAINT FK_BROWTASTIC_PY FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.Procedure_
ADD CONSTRAINT FK_BROWTASTIC_P FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.Review_feedback
ADD CONSTRAINT FK_BROWTASTIC_RF FOREIGN KEY (Customer_id) REFERENCES [BROWTASTIC].[Costumer] (Customer_id);



ALTER TABLE BROWTASTIC.Sales
ADD CONSTRAINT FK_BROWTASTIC_S FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.Seasonal_Discount
ADD CONSTRAINT FK_BROWTASTIC_SD FOREIGN KEY (Services_ID) REFERENCES [BROWTASTIC].[Services] (Services_ID);



ALTER TABLE BROWTASTIC.Services
ADD CONSTRAINT FK_BROWTASTIC_Serv FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.Touch_up
ADD CONSTRAINT FK_BROWTASTIC_T FOREIGN KEY (Appointment_id) REFERENCES [BROWTASTIC].[Appointments] (Appointment_id);



ALTER TABLE BROWTASTIC.TouchUp_6_12_Months
ADD CONSTRAINT FK_BROWTASTIC_TUP FOREIGN KEY (TouchUp_Duration_ID) REFERENCES [BROWTASTIC].[TouchUp_Duration](TouchUp_Duration_ID);
		


ALTER TABLE BROWTASTIC.TouchUp__6_12_weeks
ADD CONSTRAINT FK_BROWTASTIC_TUPS FOREIGN KEY (TouchUp_Duration_ID) REFERENCES [BROWTASTIC].[TouchUp_Duration](TouchUp_Duration_ID);
		



ALTER TABLE BROWTASTIC.TouchUp_Duration
ADD CONSTRAINT FK_BROWTASTIC_D FOREIGN KEY (Touch_up_ID) REFERENCES [BROWTASTIC].[Touch_up] (Touch_up_ID);


