#Year wise loan amount Stats
select right(issue_d,2) as year, sum(loan_amnt) total_loan_amount_status 
 from finance_1 
 group by year 
 order by year;


#Grade and sub grade wise revol_bal
SELECT f1.grade, f1.sub_grade,sum(f2.revol_bal)
FROM finance_1 f1 JOIN finance_2 f2 
ON f1.id = f2.id 
group by grade, sub_grade 
order by sub_grade;


#Total Payment for Verified Status Vs Total Payment for Non Verified Status
select f1.verification_status, round(sum(f2.total_pymnt)) as Total_Payment
FROM finance_1 f1 JOIN finance_2 f2 ON f1.id = f2.id
group by verification_status;


#State wise and last_credit_pull_d wise loan status
select right(f2.last_credit_pull_d,2) as year, f1.addr_state as State, count(f1.loan_status) as Total_Loan
FROM finance_2 f2 JOIN finance_1 f1 
ON f1.id = f2.id group by state, year
order by year desc;


#Home ownership Vs last payment date stats
select right(f2.last_pymnt_d,2) as year, f1.home_ownership as Ownership_type, count(home_ownership) as total_Owner
FROM finance_2 f2 join finance_1  f1 on f1.id=f2.id 
group by year,Ownership_type
order by year desc;