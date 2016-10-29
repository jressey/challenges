--1   
SELECT 
    m.name, m.address, o.dues, o.location 
FROM 
    members m JOIN organizations o
ON 
    m.id = o.member_id;   

--2
SELECT *
FROM members
WHERE age > 45;

--3
SELECT 
    m.*, o.dues
FROM 
    members m JOIN organizations o
ON 
    m.id = o.member_id
WHERE
    o.dues = 0;   
