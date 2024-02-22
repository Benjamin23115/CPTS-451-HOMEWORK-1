## Cpts451: Introduction to Database Systems
**Homework #01 Due: February 26, 2024 @ 23:59**  
**Instructor: Russell Dean Swannack**  
**Semester: Spring 2024**

---

### Instructions:
- Download and install the latest version of MySQL database software and its Workbench utility.
- Download the databases script files from the class Canvas website: Files > SQL DB Files.
- Install the databases: WSUTC_CptS451_University, WSUTC_CptS451_OrderEntry, and CptS451_University_WSU.
- Use the OrderEntry database for the following questions.
- Use the University database for specified questions.
- Use the University_WSU database for specified questions.
- Create a new database called CptS451_VetClinic_abc (abc are your initials) and use it for specified questions.

---

### Questions:

**Q1.** List all columns of the `OrderTbl` table for Internet orders placed in January 2021. An Internet order does not have an associated employee.

**Q2.** List the order number, order date, and customer number of orders placed after January 23, 2021, shipped to Washington recipients.

**Q3.** List the employee number, name (first and last), and phone of employees who have taken orders in January 2021 from customers with balances greater than $300. Remove duplicate rows in the result.

**Q4.** List the average balance of customers by city and short zip code (the first five digits of the zip code). Include only customers residing in Washington State (WA). Investigate the `LEFT()` function.

**Q5.** List the customer number, customer name (first and last), the sum of the quantity of products ordered, and the total order amount (sum of the product price times the quantity) for orders placed in January 2021. Only include products in which the product name contains the string "Ink Jet" or "Laser". Only include customers who have ordered more than two Ink Jet or Laser products in January 2021.

**Q6.** Create an `INSERT` statement for you to be an employee with Amy Tang as your supervisor.

**Q7.** Create a `DELETE` statement, removing you as an employee.

**Q8.** List the student names (first & last), major & class whose StdGPA is 3.5 or better that took any courses offered prior to 2020.

**Q9.** Display the faculty names (first & last), who are teaching Information Systems Offerings in 2020, in addition, list their supervisor’s name (first & last), where applicable.

**Q10.** Provide a table of the course numbers with its total number of offerings (appropriate column naming) having enrolled students and only for offerings being held on Monday and Wednesdays.

**Q11.** Show the student names (first & last), major & class and their total number of enrolled offerings (appropriate column naming).

**Q12.** For those Accounting students who are also OrderEntry database Customers, provide their enrolled Offering information, who is teaching (first & last name) that offering (instead of FacNo), and the number of course units, but only for their Information Systems courses. The student’s names (first & last) should the leftmost columns in the results table.

**Q13.** Create an `INSERT` statement for you to be a faculty with Nicki Macon as your supervisor.

**Q14.** Create a `DELETE` statement, removing you as a faculty.

**Q15.** Show the course number, offer number, and average student grade for 4th-year computer science courses taught in the 2022 summer semester, with the results sorted by ascending course number.

**Q16.** Show the student’s name (First & last) and grade count (meeting the criteria) for students whose offering grade is 3.7 or higher, but only show students who have more than one of these grades.

**Q17.** List those faculty whose salary is greater than their supervisor’s salary. For both faculty members, list their identifier, last name, and salary.

**Q18.** List those faculty who taught in 2022. Show their name (first & last), offering number, course number & description, average student GPA for that offering, and enrollment count. We are only interested in listed those faculty whose enrollment count is above 2 and sort the results by descending average GPA.

**Q19.** Student Dan Debroeck wants to see his class schedule for Summer 2022. It should include the offering number, course number, offering location, days of the week & time, and instructor’s name (first & last).

**Q20.** Create an Owner table. Each record’s address components shall be separate fields.

**Q21.** Create a Patient table. Each record shall contain a link to its Owner.

**Q22.** Create the necessary `INSERT` statements to input all the provided information into your database.

---

*Homework Notes:*
- Please attempt to format your answers in an aesthetically pleasing manner. 
- Submit a single SQL script as a text file containing all your answers.
- Include an additional text/CSV file with the query comment execution results.
- Include a ReadMe.txt with any additional explanatory comments.

---

### Submission Details:
- Submit a single ZIP file containing all your answers to the Homework 01 Drop Box on the class website.
- Name your file: `cpts451hw01abc.zip` (where 'abc' is your initials).
- At the top of your text file, place a comment information block detailing your name, assignment, SQL system used, and operating system.
