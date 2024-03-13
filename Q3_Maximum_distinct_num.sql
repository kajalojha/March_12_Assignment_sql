use avisoft;
create table my_number(
number int);
insert into my_number(number)
values(8),(8),(3),(3),(1),(4),(5),(6);

SELECT MAX(number) AS num
FROM my_number
WHERE number IN (
    SELECT number
    FROM my_number
    GROUP BY number
    HAVING COUNT(number) = 1
);

 