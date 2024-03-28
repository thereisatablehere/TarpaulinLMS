-- used to specify comments in sql scripts

-- PRODUCTDEALS_SALESREP
DROP TABLE productdeals_salesrep CASCADE CONSTRAINTS;
CREATE TABLE productdeals_salesrep (
  slsrep_number integer,
  last    varchar(20), 
  first    varchar(20),
  street   varchar(20),
  city     varchar(20),
  state   CHAR(2),
  zip      CHAR(5),
  commission_rate   decimal(3,2),
  primary key (slsrep_number)
);

-- ProductDeals_PART
DROP TABLE productdeals_part CASCADE CONSTRAINTS;
CREATE TABLE productdeals_part (
  part_number   varchar(4),
  part_description  varchar(20),
  units_on_hand integer,
  unit_price    decimal(5,2),
  primary key (part_number)
);

-- PRODUCTDEALS_CUSTOMER
DROP TABLE productdeals_customer CASCADE CONSTRAINTS;
CREATE TABLE productdeals_customer (
  customer_number integer,
  last    varchar(15), 
  first    varchar(15),
  street   varchar(20),
  city     varchar(20),
  state   varchar(2),
  zip      varchar(5),
  balance   decimal(6,2),
  credit_limit  integer,
  slsrep_number integer,
  primary key (customer_number),
  Constraint FK_PRODUCTDEALS_CUSTOMER foreign key (slsrep_number) references productdeals_salesrep(slsrep_number)
);

-- ProductDeals_TRANS
DROP TABLE productdeals_trans CASCADE CONSTRAINTS;
CREATE TABLE productdeals_trans (
  trans_number   integer,
  trans_date date,
  customer_number   integer,
  primary key (trans_number),
  Constraint FK_PRODUCTDEALS_TRANS foreign key (customer_number) references productdeals_customer(customer_number)
);

-- ProductDeals_TRANSPART
DROP TABLE productdeals_transpart CASCADE CONSTRAINTS;
CREATE TABLE productdeals_transpart (
  trans_number   integer,
  part_number varchar(4),
  number_ordered   integer,
  quoted_price  decimal(5,2),
  primary key (trans_number, part_number),
  Constraint FK_PRODUCTDEALS_TRANSPART1 foreign key (trans_number) references productdeals_trans(trans_number),
  Constraint FK_PRODUCTDEALS_TRANSPART2 foreign key (part_number) references productdeals_part(part_number)
);


