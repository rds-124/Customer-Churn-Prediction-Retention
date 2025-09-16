use churn_project;

-- 1. Overall Churn rate
select round(avg(churn_value),2) * 100 as churn_rate
from telco_customers;



-- 2. Churn by Contract type
select contract,
	   round(avg(churn_value),2) * 100 as churn_rate,
       count(*) as customers
from telco_customers
group by contract
order by churn_rate desc;



-- 3. Churn by tenure bucket
select tenure_buckets,
	    round(avg(churn_value),2) * 100 as churn_rate,
        count(*) as customers
from telco_customers
group by tenure_buckets
order by min(tenure_buckets);



-- 4. Churn by internet service type
select internet_service,
		round(avg(churn_value),2)*100 as churn_rate,
        count(*) as customers
from telco_customers
group by internet_service
order by churn_rate desc;



-- 5. Churn by payment method
select payment_method,
		round(avg(churn_value),2)*100 as churn_rate,
        count(*) as customers
from telco_customers
group by payment_method
order by churn_rate desc;



-- 6. Service features driving churn (Tech Support + Online Security)
select tech_support, online_security,
		round(avg(churn_value),2)*100 as churn_rate,
        count(*) as customers
from telco_customers
group by tech_support, online_security
order by churn_rate desc;



-- 7. Risk band distribution
select risk_band,
		round(avg(churn_value),2)*100 as actual_churn,
        count(*) as customers
from telco_customers
group by risk_band
order by case risk_band
			when 'High' then 1
            when 'Medium' then 2
            when 'Low' then 3
		END;
        
        

-- 8. High-value customers at risk
select customerid, cltv, monthly_charges, 
		round(risk_score, 2)*100 as risk_score
from telco_customers
where risk_band = 'High'
order by cltv DESC
limit 20;



-- 9. Top churn reasons
select churn_reason,
		count(*) as churners
from telco_customers
where churn_value = 1
group by churn_reason
order by churners desc
limit 10;



-- 10. Monthly revenue at risk (churners)
select round(sum(monthly_charges),2) as mrr_at_risk
from telco_customers
where churn_value = 1;
