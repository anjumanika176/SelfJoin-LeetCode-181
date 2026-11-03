# SelfJoin-LeetCode-181
LeetCode 181: Employees Earning More Than Their Managers, solved in MySQL using a Self Join


# LeetCode 181: Employees Earning More Than Their Managers

## Problem
Given an `Employee` table, find the employees who earn more than their managers.

**Table: `Employee`**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |

- `id` is the primary key.
- `managerId` is the `id` of the employee's manager.
- Return the result in any order, with the column name `Employee`.

## Example

**Input**

| id | name  | salary | managerId |
|----|-------|--------|-----------|
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |

**Output**

| Employee |
|----------|
| Joe      |

Joe earns 70000 and his manager Sam earns 60000, so Joe is the only employee who earns more than his manager.

## Approach
The manager is also an employee, so the manager's data is in the same table.
I used a **Self Join**: the same table is joined with itself under two aliases.

- `e` = the employee
- `m` = the manager

The join condition `e.managerId = m.id` connects each employee to their manager.
The filter `e.salary > m.salary` keeps only employees who earn more.
Employees with a `NULL` managerId have no manager, so they are left out by the join.

## Solution (MySQL)

```sql
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
  ON e.managerId = m.id
WHERE e.salary > m.salary;
```

## Concepts Used
- Self Join
- Table aliases
- `WHERE` filtering

## Link
[https://leetcode.com/problems/employees-earning-more-than-their-managers/]
