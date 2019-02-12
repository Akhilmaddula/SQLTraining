1. Create a table employee with empno number(4),ename varchar2(40),job varchar2(20),mgr number(4), hiredate date,sal number(10,2),comm number(10)

2.add a column deptno varchar2(2) to employee

3.change the deptno datatype to number.

4.rename employee table as employ

5.drop table employ

6.insert 5 unique rows into employee table

7.update sal of employees by 10%

8.delete all the employees of dept 10

9.increase commission for deptno 20 employees.

10. Add a not null plus unique  column to the employee table for ename

11. Set default value as 1000 for column comm
	
12 insert multiple records into employee table with a single query from emp table.

13.update salary of a employee to 15000 whose job designation is “manager”

14. Update salary of a employee to 5000 whose comm is more than salary

15. Change the hiredate column data type to character;

16. Update the job designation of an employee to senior  software engineer who has joined in 1982

17. Update mgr id to 7782 whose mgr id is 7566;

18. Delete all employees  records  from employee table whose salary is greater than 10000 and job is not ‘  manager’;

19. Add a primary key constraint on column empno
	
20. Remove the primary key constraint on empno column;

21. Create a view empl_view on employee table with the following columns(empno,job,sal)

22. Insert some records into view  empl_view

23. Update the view column job to “software engineer” whose sal is greater than 6000

24. Add a column deptno to the view empl_view

25. Drop a column sal from the view empl_view

26. Rename the view empl_view to view_emp

27. Drop the view empl_view;

28. Rename the table employee to employ

29. Grant accesses permissions select, insert on table employee to user pkrm***;

30. Insert a record into employee table of  user pkrm***

31. Remove insert privilege from user pkrm*** on employee table.

32. Remove all   privilege from user pkrm***  on employee table

33. Create a save point with the name s1;

34. Remove a record from employee table;

35. Get the removed record using rollback;

36. Remove all records from employee table;

37. Drop the complete employee table;

38. Restore employee table to save point s1;

39. Create a table emp1 with the employee table columns;

40. Insert records into emp1 table from employee table;

41. Create an index hd_index on column ‘hiredate’;

42. Drop an index hd_index;

43. Create a public synonym pub_emp on employee table;

44. Create a private synonym pri_emp on table emp1;

45. Insert records into employee table using synonym pub_emp;

45. Drop the synonym pub_emp on employee table;

46. Create a comment on table employee;

47. Create a comment on column empno of employee table

48. Create a sequence on empno column of a employee table;

49. Modify the sequence incremental value;

50. Commit all the data;



--dql operations

51.display the dept information from department table

52.display the details of all employees 

53.display the name and job for all employees 

54.display name and salary for all employees 

55.display employee number and total salary for each employee

56.display employee name and annual salary for all employees 

57.display the names of all employees who are working in department number 10 

58.display the names of all employees working as clerks and drawing a salary more than 3000 

59.display employee number and names for employees who earn commission 

60.display names of employees who do not earn any commission 

61.display the names of employees who are working as clerk , salesman or analyst and drawing a salary more than 3000 

62.display the names of employees who are working in the company for the past 5 years 

63.display the list of employees who have joined the company before 30 th june 90 or after 31 st dec 90 

64.display current date 

65.display the list of users in your database (using log table) 

66.display the names of all tables from the current user 

67.display the name of the current user 

68.display the names of employees working in department number 10 or 20 or 40 or employees working as clerks , salesman or analyst 

69.display the names of employees whose name starts with alphabet s 

70.display employee name from employees whose name ends with alphabet s 

71.display the names of employees whose names have second alphabet a in their names

72.display the names of employees whose name is exactly five characters in length 

73.display the names of employees who are not working as salesman or clerk or analyst

74.display the names of employees in order of salary i.e. The name of the employee earning lowest salary shoud appear first 

75.display the names of employees in job ascending order of salary 

76.display the details from employee table in order of employee name 

77.display empnno,ename,deptno and sal. Sort the output first based on name and within name by deptno and within deptno by sal; 

78. Display the name of employees along with their annual salary(sal*12). The name of the employee earning highest annual salary should appear first?

79. Display name,salary,hra,pf,da,totalsalary for each employee.

80. Display the name of employee concatnate with employee number?

81. Display those employees who joined the company before 15th of the month

82. Display those employees who has joined after 15th of the month?

83. Display the deptname where no employee is working?

84. Produce the output of the emptable "employee_and job" for ename and job ?

85. Display those employees whose name contains a?

86. Display those employees who are not working under any manager?

87. Display those who are not managers?

88. Display the jobs which are unique to department 10?

