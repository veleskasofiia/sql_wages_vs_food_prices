SELECT 
    a.industry_branch_code,
    a.payroll_year AS current_year,
    ROUND(AVG(b.average_salary),2) AS salary_current_year,
    ROUND(AVG(a.average_salary),2) AS salary_previous_year,
    b.payroll_year AS previous_year,
    ROUND(((b.average_salary * 100) / a.average_salary) - 100, 2) AS salary_difference
FROM t_Sofiia_Veleska_SQL_primary_final a
JOIN t_Sofiia_Veleska_SQL_primary_final  b 
ON a.industry_branch_code = b.industry_branch_code
    AND a.payroll_year -1 = b.payroll_year 
    WHERE a.average_salary <= b.average_salary
GROUP BY a.industry_branch_code
ORDER BY 
	salary_difference DESC,
    a.industry_branch_code,
    a.payroll_year DESC;
