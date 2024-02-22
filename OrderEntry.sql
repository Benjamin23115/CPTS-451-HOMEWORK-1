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
    (ordline.Qty * product.ProdPrice) AS totalOrderAmount,
    ordline.Qty,
    product.ProdName
FROM
    customer
    JOIN ordertbl ON ordertbl.CustNo = customer.CustNo
    JOIN ordline ON ordertbl.OrdNo = ordline.OrdNo
    JOIN product ON ordline.ProdNo = product.ProdNo
WHERE
    ordertbl.OrdDate >= '2021-01-01'
    AND ordertbl.OrdDate <= '2021-01-31'
    AND ordline.Qty > 2
    AND (
        product.ProdName LIKE '%Ink Jet%'
        OR product.ProdName LIKE '%Laser%'
    );

/* Q6 */
insert into
    employee (
        EmpNo,
        EmpFirstName,
        EmpLastName,
        EmpPhone,
        EmpEMail,
        SupEmpNo,
        EmpCommRate
    )
values
    (
        "abcdefg",
        "Benjamin",
        "Farias Dela Mora",
        "509-792-4736",
        "b.fariasdelamora@pnnl.gov",
        (
            SELECT
                EmpNo
            FROM
                employee
            WHERE
                EmpFirstName = 'Amy'
                AND EmpLastName = 'Tang'
        ),
        50.0
    );

/* Q7 */
DELETE FROM employee
WHERE
    EmpFirstName = 'Benjamin'
    AND EmpLastName = 'Farias Dela Mora';