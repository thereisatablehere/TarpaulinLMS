ALTER TABLE tarp_community DISABLE CONSTRAINT FK_TARP_COMMUNITY;
ALTER TABLE tarp_course DISABLE CONSTRAINT FK_TARP_COURSE;
ALTER TABLE tarp_s_comment DISABLE CONSTRAINT FK_TARP_S_COMMENT1;
ALTER TABLE tarp_s_comment DISABLE CONSTRAINT FK_TARP_S_COMMENT2;
ALTER TABLE tarp_i_comment DISABLE CONSTRAINT FK_TARP_I_COMMENT1;
ALTER TABLE tarp_i_comment DISABLE CONSTRAINT FK_TARP_I_COMMENT2;
ALTER TABLE tarp_lecture DISABLE CONSTRAINT FK_TARP_LECTURE;
ALTER TABLE tarp_test DISABLE CONSTRAINT FK_TARP_TEST;
ALTER TABLE tarp_question DISABLE CONSTRAINT FK_TARP_QUESTION1;
ALTER TABLE tarp_question DISABLE CONSTRAINT FK_TARP_QUESTION2;
ALTER TABLE tarp_joined_by DISABLE CONSTRAINT FK_TARP_JOINED_BY1;
ALTER TABLE tarp_joined_by DISABLE CONSTRAINT FK_TARP_JOINED_BY2;
ALTER TABLE tarp_taken_by DISABLE CONSTRAINT FK_TARP_TAKEN_BY1;
ALTER TABLE tarp_taken_by DISABLE CONSTRAINT FK_TARP_TAKEN_BY2;
ALTER TABLE tarp_enrolls DISABLE CONSTRAINT FK_TARP_ENROLLS1;
ALTER TABLE tarp_enrolls DISABLE CONSTRAINT FK_TARP_ENROLLS2;
ALTER TABLE tarp_watches DISABLE CONSTRAINT FK_TARP_WATCHES1;
ALTER TABLE tarp_watches DISABLE CONSTRAINT FK_TARP_WATCHES2;
ALTER TABLE tarp_watches DISABLE CONSTRAINT FK_TARP_WATCHES3;
ALTER TABLE tarp_rates DISABLE CONSTRAINT FK_TARP_RATES1;
ALTER TABLE tarp_rates DISABLE CONSTRAINT FK_TARP_RATES2;



--INSERT INTO PRODUCTDEALS_SALESREP (slsrep_number, last, first, street, city, state, zip, commission_rate) VALUES (3.0, 'Jones', 'Mary', '123 Main', 'Grant', 'MI', '49219', 0.05);
--INSERT INTO PRODUCTDEALS_SALESREP (slsrep_number, last, first, street, city, state, zip, commission_rate) VALUES (6.0, 'Smith', 'William', '102 Raymond', 'Ada', 'MI', '49441', 0.07);
--INSERT INTO PRODUCTDEALS_SALESREP (slsrep_number, last, first, street, city, state, zip, commission_rate) VALUES (12.0, 'Diaz', 'Miguel', '410 Harper', 'Lansing', 'MI', '49224', 0.05);
--
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (124.0, 'Adams', 'Sally', '481 Oak', 'Lansing', 'MI', '49224', 818.75, 1000.0, 3.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (256.0, 'Samuels', 'Ann', '215 Pete', 'Grant', 'MI', '49219', 21.50, 1500.0, 6.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (311.0, 'Charles', 'Don', '48 College', 'Ira', 'MI', '49034', 825.75, 1000.0, 12.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (315.0, 'Daniels', 'Tom', '914 Cherry', 'Kent', 'MI', '48391', 770.75, 750.0, 6.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (405.0, 'William', 'Al', '519 Watson', 'Grant', 'MI', '49219', 402.75, 1500.0, 12.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (412.0, 'Adams', 'Sally', '16 Elm', 'Lansing', 'MI', '49224', 1817.50, 2000.0, 3.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (522.0, 'Nelson', 'Mary', '108 Pine', 'Ada', 'MI', '49441', 98.75, 1500.0, 12.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (567.0, 'Dinh', 'Tran', '808 Ridge', 'Harper', 'MI', '49421', 402.40, 750.0, 6.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (587.0, 'Galvez', 'Mara', '512 Pine', 'Ada', 'MI', '49441', 114.60, 1000.0, 6.0);
--INSERT INTO PRODUCTDEALS_CUSTOMER (customer_number, last, first, street, city, state, zip, balance, credit_limit, slsrep_number) VALUES (622.0, 'Martin', 'Dan', '419 Chip', 'Grant', 'MI', '49219', 1045.75, 1000.0, 3.0);
--
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12489.0, to_date('2002-09-02', 'YYYY-MM-DD'), 124.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12491.0, to_date('2002-09-02', 'YYYY-MM-DD'), 311.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12494.0, to_date('2002-09-04', 'YYYY-MM-DD'), 315.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12495.0, to_date('2002-09-04', 'YYYY-MM-DD'), 256.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12498.0, to_date('2002-09-05', 'YYYY-MM-DD'), 522.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12500.0, to_date('2002-09-05', 'YYYY-MM-DD'), 124.0);
--INSERT INTO ProductDeals_TRANS (trans_number, trans_date, customer_number) VALUES (12504.0, to_date('2002-09-05', 'YYYY-MM-DD'), 522.0);
--
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('AX12', 'Iron', 104.0, 24.95);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('AZ52', 'Dartboard', 20.0, 12.95);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('BA74', 'Basketball', 40.0, 29.95);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('BH22', 'Corn Popper', 95.0, 25.95);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('BT04', 'Gas Grill', 11.0, 149.99);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('BZ66', 'Washer', 52.0, 399.99);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('CA14', 'Griddle', 78.0, 39.99);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('CB03', 'Bike', 44.0, 399.99);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('CX11', 'Blender', 112.0, 22.95);
--INSERT INTO ProductDeals_PART (part_number, part_description, units_on_hand, unit_price) VALUES ('CZ81', 'Treadmill', 68.0, 349.95);
--
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12489.0, 'AX12', 11.0, 21.95);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12491.0, 'BT04', 1.0, 149.99); --Here
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12491.0, 'BZ66', 1.0, 399.99);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12494.0, 'CB03', 4.0, 279.99);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12495.0, 'CX11', 2.0, 22.95);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12498.0, 'AZ52', 2.0, 12.95);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12498.0, 'BA74', 4.0, 24.95);
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12500.0, 'BT04', 1.0, 149.99); --Here
--INSERT INTO ProductDeals_TRANSPART (trans_number, part_number, number_ordered, quoted_price) VALUES (12504.0, 'CZ81', 2.0, 325.99);


ALTER TABLE tarp_community ENABLE CONSTRAINT FK_TARP_COMMUNITY;
ALTER TABLE tarp_course ENABLE CONSTRAINT FK_TARP_COURSE;
ALTER TABLE tarp_s_comment ENABLE CONSTRAINT FK_TARP_S_COMMENT1;
ALTER TABLE tarp_s_comment ENABLE CONSTRAINT FK_TARP_S_COMMENT2;
ALTER TABLE tarp_i_comment ENABLE CONSTRAINT FK_TARP_I_COMMENT1;
ALTER TABLE tarp_i_comment ENABLE CONSTRAINT FK_TARP_I_COMMENT2;
ALTER TABLE tarp_lecture ENABLE CONSTRAINT FK_TARP_LECTURE;
ALTER TABLE tarp_test ENABLE CONSTRAINT FK_TARP_TEST;
ALTER TABLE tarp_question ENABLE CONSTRAINT FK_TARP_QUESTION1;
ALTER TABLE tarp_question ENABLE CONSTRAINT FK_TARP_QUESTION2;
ALTER TABLE tarp_joined_by ENABLE CONSTRAINT FK_TARP_JOINED_BY1;
ALTER TABLE tarp_joined_by ENABLE CONSTRAINT FK_TARP_JOINED_BY2;
ALTER TABLE tarp_taken_by ENABLE CONSTRAINT FK_TARP_TAKEN_BY1;
ALTER TABLE tarp_taken_by ENABLE CONSTRAINT FK_TARP_TAKEN_BY2;
ALTER TABLE tarp_enrolls ENABLE CONSTRAINT FK_TARP_ENROLLS1;
ALTER TABLE tarp_enrolls ENABLE CONSTRAINT FK_TARP_ENROLLS2;
ALTER TABLE tarp_watches ENABLE CONSTRAINT FK_TARP_WATCHES1;
ALTER TABLE tarp_watches ENABLE CONSTRAINT FK_TARP_WATCHES2;
ALTER TABLE tarp_watches ENABLE CONSTRAINT FK_TARP_WATCHES3;
ALTER TABLE tarp_rates ENABLE CONSTRAINT FK_TARP_RATES1;
ALTER TABLE tarp_rates ENABLE CONSTRAINT FK_TARP_RATES2;
