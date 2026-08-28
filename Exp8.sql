
SET SERVEROUTPUT ON;

CREATE TABLE customer (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    address VARCHAR2(100),
    salary NUMBER
);

INSERT INTO customer VALUES (1, 'Ezhil', 23, 'aaa', 20000);
INSERT INTO customer VALUES (2, 'Aarthi', 24, 'bbb', 30000);
INSERT INTO customer VALUES (3, 'Sumathi', 21, 'ccc', 35000);
INSERT INTO customer VALUES (4, 'Viji', 24, 'ddd', 40000);
INSERT INTO customer VALUES (5, 'Priya', 21, 'eee', 43000);

COMMIT;



DECLARE
    c_id customer.id%TYPE := 5;
    c_name customer.name%TYPE;
    c_addr customer.address%TYPE;
BEGIN
    SELECT name, address
    INTO c_name, c_addr
    FROM customer
    WHERE id = c_id;

    DBMS_OUTPUT.PUT_LINE('name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('address: ' || c_addr);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('no such customer!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('error!');
END;
/


ACCEPT cc_id NUMBER PROMPT 'Enter customer ID: '

DECLARE
    c_id customer.id%TYPE := &cc_id;
    c_name customer.name%TYPE;
    c_addr customer.address%TYPE;
    ex_invalid_id EXCEPTION;
BEGIN
    IF c_id <= 0 THEN
        RAISE ex_invalid_id;
    ELSE
        SELECT name, address
        INTO c_name, c_addr
        FROM customer
        WHERE id = c_id;

        DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
        DBMS_OUTPUT.PUT_LINE('Address: ' || c_addr);
    END IF;

EXCEPTION
    WHEN ex_invalid_id THEN
        DBMS_OUTPUT.PUT_LINE('ID must be greater than zero!');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No such customer!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END;
/
