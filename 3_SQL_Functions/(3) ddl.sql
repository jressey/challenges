#execute by visiting http://rextester.com/, setting to psql, and combining this and the solutions file in the form, then executing.

CREATE TABLE members(
   id integer PRIMARY KEY,
   name varchar(40),
   address varchar(200),
   phone_number varchar(20),
   age integer
);

CREATE TABLE organizations(
  id integer,
  member_id integer references members(id),
  location varchar(200),
  dues numeric
);

INSERT INTO members VALUES
    (1, 'Tom Jones', '100 Maple Dr.', '0001234567', 22);
INSERT INTO members VALUES
    (2, 'Sarah Thomas', '200 Oak Dr.', '1111234567', 32);
INSERT INTO members VALUES
    (3, 'Wendy Jacobs', '300 Birch Dr.', '2221234567', 46);
INSERT INTO members VALUES
    (4, 'Elliot Davis', '400 Redwood Dr.', '3331234567', 52);
    
INSERT INTO organizations VALUES
    (1, 1, 'South', 100.00);    
INSERT INTO organizations VALUES
    (2, 2, 'West', 0.00);
INSERT INTO organizations VALUES
    (3, 3, 'North', 200.00);      
INSERT INTO organizations VALUES
    (4, 4, 'East', 0.00);      
   