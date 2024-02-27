 use cpts451_university_wsu;
 
 -- Q15
 SELECT 
    AVG(student.StdGPA) AS avgStudentGPA,
    course.CourseNo,
    offering.OfferNo
FROM
    enrollment
        JOIN
    student ON student.StdNo = enrollment.StdNo
        JOIN
    offering ON offering.OfferNo = enrollment.OfferNo
        JOIN
    course ON course.CourseNo = offering.CourseNo
WHERE
    course.CourseNo LIKE 'CS4%'
        AND offering.OffTerm = 'Summer'
        AND offering.OffYear = 2022
GROUP BY course.CourseNo , offering.OfferNo
ORDER BY course.CourseNo ASC;

-- Q16
SELECT 
    student.StdFirstName,
    student.StdLastName,
    enrollment.StdNo,
    COUNT(*) AS gradesAboveNumber
FROM
    enrollment
        JOIN
    student ON student.StdNo = enrollment.StdNo
WHERE
    enrollment.EnrGrade >= 3.7
GROUP BY student.StdFirstName , student.StdLastName , enrollment.StdNo
HAVING COUNT(*) > 1;

-- Q17
SELECT 
    faculty1.FacNo AS FacultyID,
    faculty1.FacLastName AS FacultyLastName,
    faculty1.FacSalary AS FacultySalary
FROM
    faculty faculty1
        JOIN
    faculty faculty2 ON faculty1.FacSupervisor = faculty2.FacNo
WHERE
    faculty1.FacSalary > faculty2.FacSalary;

-- Q18
SELECT 
    faculty.FacFirstName,
    faculty.FacLastName,
    offering.OfferNo,
    offering.CourseNo,
    course.CrsDesc,
    AVG(student.StdGPA) AS avgStudentGPA,
    COUNT(enrollment.StdNo) AS enrollmentCount
FROM
    enrollment
        JOIN
    offering ON enrollment.OfferNo = offering.OfferNo
        JOIN
    faculty ON offering.FacNo = faculty.FacNo
        JOIN
    course ON offering.CourseNo = course.CourseNo
        JOIN
    student ON enrollment.StdNo = student.StdNo
WHERE
    OffYear = 2022
GROUP BY faculty.FacFirstName , faculty.FacLastName , offering.OfferNo , offering.CourseNo , course.CrsDesc
HAVING enrollmentCount > 2
ORDER BY avgStudentGPA DESC;

-- Q19
SELECT 
    offering.OfferNo,
    offering.CourseNo,
    offering.OffDays,
    offering.OffTime,
    offering.OffLocation,
    faculty.FacFirstName,
    faculty.FacLastName
FROM
    offering
        JOIN
    enrollment ON enrollment.OfferNo = offering.OfferNo
        JOIN
    student ON student.StdNo = enrollment.StdNo
        JOIN
    faculty ON faculty.FacNo = offering.FacNo
WHERE
    offering.OffYear = 2022
        AND offering.OffTerm = 'Summer'
        AND student.StdFirstName = 'Dan'
        AND student.StdLastName = 'Debroeck';