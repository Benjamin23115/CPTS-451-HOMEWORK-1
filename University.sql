use wsutc_cpts451_university;
-- Q8

SELECT distinct
    student.StdFirstName,
    student.StdLastName,
    student.StdMajor,
    student.StdClass,
    student.StdGPA,
    student.StdNo,
    offering.OffYear
FROM
    student
        JOIN
    enrollment ON enrollment.StdNo = student.StdNo
        JOIN
    offering ON offering.OfferNo = enrollment.OfferNo
WHERE
    student.StdGPA >= 3.5 and offering.OffYear < 2020;
    
-- Q9

SELECT 
    faculty.FacFirstName,
    faculty.FacLastName,
    faculty.FacSupervisor,
    faculty.FacNo,
    course.CourseNo
FROM
    faculty
        JOIN
    offering ON offering.FacNo = faculty.FacNo
        JOIN
    course ON course.CourseNo = offering.CourseNo
WHERE
    OffYear = 2020 and course.CourseNo like 'IS%';
    
-- Q10 

SELECT 
    COUNT(student.StdNo) AS totalStudentsEnrolled,
    offering.CourseNo
FROM
    student
        JOIN
    enrollment ON enrollment.StdNo = student.StdNo
        JOIN
    offering ON offering.OfferNo = enrollment.OfferNo
WHERE
    offering.OffDays = 'MW'
GROUP BY offering.CourseNo;

-- Q11

SELECT DISTINCT
    student.StdFirstName,
    student.StdLastName,
    StdMajor,
    StdClass,
    COUNT(enrollment.OfferNo) AS totalNumberEnrolledOfferings
FROM
    student
        JOIN
    enrollment ON enrollment.StdNo = student.StdNo
GROUP BY student.StdFirstName , student.StdLastName , student.StdMajor , student.StdClass;

-- Q12
SELECT 
    student.StdFirstName,
    student.StdLastName,
    offering.CourseNo,
    course.CrsUnits,
    faculty.FacFirstName AS InstructorFirstName,
    faculty.FacLastName AS InstructorLastName
FROM
    student
        JOIN
    enrollment ON enrollment.StdNo = student.StdNo
        JOIN
    offering ON offering.OfferNo = enrollment.OfferNo
        JOIN
    faculty ON faculty.FacNo = offering.FacNo
        JOIN
    course ON course.CourseNo = offering.CourseNo
        JOIN
    wsutc_cpts451_orderentry.customer AS customer ON (customer.CustFirstName = student.StdFirstName
        AND customer.CustLastName = student.StdLastName)
WHERE
    student.StdMajor = 'ACCT'
        AND offering.CourseNo LIKE '%IS%'; 
    
-- Q13
INSERT INTO faculty (
    FacNo,
    FacFirstName,
    FacLastName,
    FacCity,
    FacState,
    FacZipCode,
    FacRank,
    FacHireDate,
    FacSalary,
    FacSupervisor,
    FacDept
) 
VALUES (
    "123456789",
    "Benjamin",
    "Farias Dela Mora",
    "Pasco",
    "WA",
    "99301",
    "JR",
    "2024-02-23",
    70000,
    (SELECT FacNo FROM (SELECT * FROM faculty) AS temp WHERE FacFirstName = 'Nicki' AND FacLastName = 'Macon' AND FacNo = '765-43-2109'),
    "ACCT"
);



-- Q14

DELETE FROM faculty 
WHERE
    FacFirstName = 'Benjamin'
    AND FacLastName = 'Farias Dela Mora';