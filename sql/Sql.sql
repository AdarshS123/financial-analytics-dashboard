create database revenue;
use revenue;
select * from `expense_table` limit 5;
drop table `financial_dataset(expense items)`;
drop table `financial_dataset(income items)`;
select * from `income_table` limit 5;


#1. Total Revenue (Actual Income) by Month
SELECT 
    `Month`,
    SUM(`Actual Income`) AS total_revenue
FROM `income_table`
GROUP BY `Month`
ORDER BY MIN(`ï»¿Date`);

#2. Total Expenses (Actual Expense) by Month
SELECT 
    `Month`,
    SUM(`Actual Expense`) AS total_expense
FROM `expense_table`
GROUP BY `Month`
ORDER BY MIN(`ï»¿Date`);

#3. Profit by Month

SELECT 
    i.`Month`,
    SUM(i.`Actual Income`) AS total_revenue,
    SUM(e.`Actual Expense`) AS total_expense,
    SUM(i.`Actual Income`) - SUM(e.`Actual Expense`) AS profit
FROM `income_table` i
JOIN `expense_table` e 
ON i.`ï»¿Date` = e.`ï»¿Date`
AND i.`City` = e.`City`
GROUP BY i.`Month`
ORDER BY MIN(i.`ï»¿Date`);


#4. Profit Margin by Category
SELECT 
    i.`Category I` AS category,
    SUM(i.`Actual Income`) AS revenue,
    SUM(e.`Actual Expense`) AS expense,
    SUM(i.`Actual Income`) - SUM(e.`Actual Expense`) AS profit,
    ROUND(
        (SUM(i.`Actual Income`) - SUM(e.`Actual Expense`)) 
        / SUM(i.`Actual Income`) * 100, 2
    ) AS profit_margin_pct
FROM `income_table` i
JOIN `expense_table` e 
ON i.`ï»¿Date` = e.`ï»¿Date`
AND i.`City` = e.`City`
GROUP BY i.`Category I`;

#5. Budget vs Actual
SELECT 
    `Month`,
    SUM(`Budgeted Income`) AS budget_income,
    SUM(`Actual Income`) AS actual_income,
    SUM(`Actual Income`) - SUM(`Budgeted Income`) AS variance
FROM `income_table`
GROUP BY `Month`;

SELECT 
    `Month`,
    SUM(`Budgeted Expense`) AS budget_expense,
    SUM(`Actual Expense`) AS actual_expense,
    SUM(`Actual Expense`) - SUM(`Budgeted Expense`) AS variance
FROM `expense_table`
GROUP BY `Month`;

