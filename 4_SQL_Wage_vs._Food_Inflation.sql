-- Progress

SELECT * FROM t_Sofiia_Veleska_SQL_primary_final

-- Product

SELECT 
	ROUND(AVG(a.average_price),2) AS price_current_year,
	ROUND(AVG(b.average_price),2) AS price_previous_year,
	ROUND(AVG(b.average_price) / AVG(a.average_price) * 100 - 100, 2) AS percentage_increase_prod
FROM t_Sofiia_Veleska_SQL_primary_final a
LEFT JOIN t_Sofiia_Veleska_SQL_primary_final b
	ON a.year_from -1 = b.year_from 
	WHERE b.average_price IS NOT NULL
	AND a.category_code = b.category_code
GROUP BY a.year_from;

 -- Salary

SELECT 
	a.payroll_year,
	b.payroll_year AS previous_year,
	ROUND(AVG(a.average_salary),2) AS avg_salary,
	ROUND(AVG(b.average_salary),2) AS prev_avg_salary,
	ROUND(AVG(b.average_salary) / AVG(a.average_salary) * 100 - 100, 2) AS percentage_increase_sal
FROM t_Sofiia_Veleska_SQL_primary_final a
LEFT JOIN t_Sofiia_Veleska_SQL_primary_final b
	ON a.payroll_year -1 = b.payroll_year 
	WHERE b.payroll_year IS NOT NULL
GROUP BY a.payroll_year;



-- Final Code


SELECT 
    a.year_from, 
    b.year_from AS previous_year,
    ROUND(AVG(a.average_price),2) AS current_year_price,
    ROUND(AVG(b.average_price),2) AS previous_year_price,
    ROUND((AVG(b.average_price) / AVG(a.average_price) * 100) - 100, 2 )AS percentage_p,
    a.payroll_year,
    b.payroll_year AS previous_year,
    ROUND(AVG(a.average_salary),2) AS current_year_salary,
    ROUND(AVG(b.average_salary),2) AS previous_year_salary,
    ROUND((AVG(b.average_salary) / AVG(a.average_salary) * 100) - 100, 2) AS percentage_increase_s,
    ROUND((AVG(b.average_price) / AVG(a.average_price) * 100) - 100, 2 ) - ROUND((AVG(b.average_salary) / AVG(a.average_salary) * 100) - 100, 2) AS differences
FROM t_sofiia_veleska_sql_primary_final a
JOIN t_sofiia_veleska_sql_primary_final b 
    ON a.year_from - 1 = b.payroll_year 
    AND a.category_code = b.code
GROUP BY a.year_from;
		