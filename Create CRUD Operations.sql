
SQL> CREATE TABLE Customer3 (
  2      Customer_ID NUMBER PRIMARY KEY,
  3      Customer_Name VARCHAR2(50),
  4      Email VARCHAR2(100) UNIQUE,
  5      Phone_Number VARCHAR2(15) UNIQUE,
  6      Address VARCHAR2(100)
  7  );

Table created.

SQL> 
SQL> INSERT INTO Customer3 VALUES (101,'Aishwarya','aishwarya@gmail.com','9876500001','Chennai');

1 row created.

SQL> INSERT INTO Customer3 VALUES (102,'Bhavya','bhavya@gmail.com','9876500002','Coimbatore');

1 row created.

SQL> INSERT INTO Customer3 VALUES (103,'Charu','charu@gmail.com','9876500003','Madurai');

1 row created.

SQL> INSERT INTO Customer3 VALUES (104,'Deepika','deepika@gmail.com','9876500004','Salem');

1 row created.

SQL> INSERT INTO Customer3 VALUES (105,'Esha','esha@gmail.com','9876500005','Trichy');

1 row created.

SQL> INSERT INTO Customer3 VALUES (106,'Fathima','fathima@gmail.com','9876500006','Erode');

1 row created.

SQL> INSERT INTO Customer3 VALUES (107,'Gayathri','gayathri@gmail.com','9876500007','Vellore');

1 row created.

SQL> INSERT INTO Customer3 VALUES (108,'Hema','hema@gmail.com','9876500008','Thanjavur');

1 row created.

SQL> INSERT INTO Customer3 VALUES (109,'Ishwarya','ishwarya@gmail.com','9876500009','Tirunelveli');

1 row created.

SQL> INSERT INTO Customer3 VALUES (110,'Janani','janani@gmail.com','9876500010','Chengalpattu');

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Customer3;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        101 Aishwarya
aishwarya@gmail.com
9876500001
Chennai


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        102 Bhavya
bhavya@gmail.com
9876500002
Coimbatore


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        103 Charu
charu@gmail.com
9876500003
Madurai


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        104 Deepika
deepika@gmail.com
9876500004
Salem


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        105 Esha
esha@gmail.com
9876500005
Trichy


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        106 Fathima
fathima@gmail.com
9876500006
Erode


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        107 Gayathri
gayathri@gmail.com
9876500007
Vellore


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        108 Hema
hema@gmail.com
9876500008
Thanjavur


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        109 Ishwarya
ishwarya@gmail.com
9876500009
Tirunelveli


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        110 Janani
janani@gmail.com
9876500010
Chengalpattu


10 rows selected.

SQL> SELECT * FROM Customer3
  2  WHERE Customer_ID = 101;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        101 Aishwarya
aishwarya@gmail.com
9876500001
Chennai


SQL> UPDATE Customer3
  2  SET Address = 'Bangalore'
  3  WHERE Customer_ID = 101;

1 row updated.

SQL> UPDATE Customer3
  2  SET Phone_Number = '9876500111'
  3  WHERE Customer_ID = 102;

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> DELETE FROM Customer3
  2  WHERE Customer_ID = 110;

1 row deleted.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Customer3;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        101 Aishwarya
aishwarya@gmail.com
9876500001
Bangalore


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        102 Bhavya
bhavya@gmail.com
9876500111
Coimbatore


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        103 Charu
charu@gmail.com
9876500003
Madurai


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        104 Deepika
deepika@gmail.com
9876500004
Salem


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        105 Esha
esha@gmail.com
9876500005
Trichy


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        106 Fathima
fathima@gmail.com
9876500006
Erode


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        107 Gayathri
gayathri@gmail.com
9876500007
Vellore


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        108 Hema
hema@gmail.com
9876500008
Thanjavur


CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE_NUMBER
---------------
ADDRESS
--------------------------------------------------------------------------------
        109 Ishwarya
ishwarya@gmail.com
9876500009
Tirunelveli


9 rows selected.
