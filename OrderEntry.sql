use wsutc_cpts451_orderentry;

/* Q1 */
select
    *
from
    ordertbl
where
    OrdDate >= '2021-01-01'
    and OrdDate <= '2021-01-31'
    and EmpNo is null;

/* Q2 */
select
    OrdNo,
    OrdDate,
    CustNo,
    OrdCity,
    OrdState
from
    ordertbl
where
    OrdDate > '2021-01-23'
    and OrdState = 'WA';

/* Q3 */
SELECT distinct
    employee.EmpFirstName,
    employee.EmpLastName,
    employee.EmpNo,
    employee.EmpPhone
FROM
    employee
    JOIN ordertbl ON employee.EmpNo = ordertbl.EmpNo
    JOIN customer ON customer.CustNo = ordertbl.CustNo
WHERE
    customer.CustBal > 300;

/* Q4 */
SELECT
    avg(CustBal) AS avgCustBal,
    CustCity,
    LEFT (CustZip, 5) AS shortCustZip,
    CustState
FROM
    customer
WHERE
    CustState = 'WA'
GROUP BY
    shortCustZip,
    CustCity;

/* Q5 */
SELECT
    customer.CustNo,
    customer.CustFirstName,
    customer.CustLastName,
    SUM(ordline.Qty) AS totalQuantityOrdered,
    SUM(ordline.Qty * product.ProdPrice) AS totalOrderAmount
FROM
    customer
    JOIN ordertbl ON ordertbl.CustNo = customer.CustNo
    JOIN ordline ON ordertbl.OrdNo = ordline.OrdNo
    JOIN product ON ordline.ProdNo = product.ProdNo
WHERE
    ordertbl.OrdDate >= '2021-01-01'
    AND ordertbl.OrdDate <= '2021-01-31'
    AND (
        product.ProdName LIKE '%Ink Jet%'
        OR product.ProdName LIKE '%Laser%'
    )
GROUP BY
    customer.CustNo,
    customer.CustFirstName,
    customer.CustLastName
HAVING
    SUM(CASE WHEN product.ProdName LIKE '%Ink Jet%' OR product.ProdName LIKE '%Laser%' THEN 1 ELSE 0 END) > 2;


/* Q6 */
INSERT INTO employee (
    EmpNo,
    EmpFirstName,
    EmpLastName,
    EmpPhone,
    EmpEMail,
    SupEmpNo,
    EmpCommRate
)
SELECT
    'abcdefg',
    'Benjamin',
    'Farias Dela Mora',
    '509-792-4736',
    'b.fariasdelamora@pnnl.gov',
    EmpNo,
    0.120
FROM
    employee
WHERE
    EmpFirstName = 'Amy'
    AND EmpLastName = 'Tang';


/* Q7 */
DELETE FROM employee 
WHERE
    EmpFirstName = 'Benjamin'
    AND EmpLastName = 'Farias Dela Mora'
    AND EmpNo = 'abcdefg'
;