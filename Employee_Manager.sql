SELECT e.name AS Employee
FROM Employee E
JOIN Employee M
ON e.managerId = m.id
WHERE e.salary > m.salary;
