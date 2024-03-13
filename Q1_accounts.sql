use avisoft;
create table accounts(
account_id int primary key ,
income int);
insert into accounts(account_id , income)
values(3,108939),
(2,12747),
(8,87709),
(6,91796);
SELECT
    'Low Salary' AS category,
    COUNT(CASE WHEN income < 20000 THEN 1 END) AS accounts_count
FROM
    Accounts
UNION ALL
SELECT
    'Average Salary' AS category,
    COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END) AS accounts_count
FROM
    Accounts
UNION ALL
SELECT
    'High Salary' AS category,
    COUNT(CASE WHEN income > 50000 THEN 1 END) AS accounts_count
FROM
    Accounts;