SELECT employeename
FROM employeetable
WHERE employeesalary = (
    SELECT MAX(employeesalary)
    FROM employeetable
    WHERE employeedepartment = 'your_department'
)
  AND employeedepartment = 'your_department'
ORDER BY employeename ASC
LIMIT 1;


SELECT 





SELECT employeedepartment, MIN(employeename) AS employeename
FROM employeetable
WHERE (employeedepartment, employeesalary) IN (
    SELECT employeedepartment, MAX(employeesalary)
    FROM employeetable
    GROUP BY employeedepartment
)
GROUP BY employeedepartment;


