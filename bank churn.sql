create database Bankchurndb;
use bankchurndb;
desc bank_churn;
/*------Customer churn on the basis of gender----*/
select bank_churn.genderId, genderCategory, count(bank_churn.genderId )as total,
count(case 
when exited= 1 then 1 end)as chrun,
count(case 
when exited= 0 then 0 end)as not_chrun
from bank_churn join gender on bank_churn.genderID= gender.genderID
group by 1;


/*------Customer churn on the basis of Geography----*/
select bank_churn.GeographyId, geographyLocation, count(bank_churn.GeographyId)as total,
count(case 
when exited= 1 then 1 end)as chrun,
count(case 
when exited= 0 then 0 end)as not_chrun
from bank_churn join geography on bank_churn.GeographyID= geography.geographyID
group by 1;


/*------Customer churn on the basis of creditcard----*/
select HasCrCard, category, count(HasCrCard) as total,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn

from bank_churn join Creditcard on bank_churn.HasCrCard = Creditcard.creditID
group by 1;


/*------Customer churn on the basis of age----*/
select  
case 
when age <=25 then "student" 
when age >25 and age <=55 then "workingClass "
when age >55 then "retired"
end as age_category,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;


/*------Customer churn on the basis of balance----*/


select 
case
when balance <100000 then "0-100000"
when balance >100000 and balance <200000 then "100000-200000"
when balance >200000 then "200000-more"
end as balance_category,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;
 
 
 
 
 /*------Customer churn on the basis of creditScore----*/
 
 select 
 case
 when creditScore > 300 and creditScore <500 then "low_score"
 when creditScore > 500 and creditScore < 700 then "Avg_score"
 when creditScore > 700 and creditScore < 1000 then "Good_score"
 end as creditscore_category,
 count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;
 
 
 
 /*------Customer churn on the basis of Active status----*/
 
select isactivemember, activecategory , count(isactivemember)as total,
count(case 
when exited= 1 then 1 end) as chrun,
count(case 
when exited= 0 then 0 end)as not_chrun
from bank_churn join activecustomer on bank_churn.isactivemember= activecustomer.activeID
group by 1;



/*------Customer churn on the basis of tenure----*/

select  
case 
when age <=25 then "student" 
when age >25 and age <=55 then "workingClass "
when age >55 then "retired"
end as age_category,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;


/*------Customer churn on the basis of balance----*/


select 
select  
case 
when age <=25 then "student" 
when age >25 and age <=55 then "workingClass "
when age >55 then "retired"
end as age_category,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;


/*------Customer churn on the basis of balance----*/

select tenure, count(tenure) as total,
case 
when tenure >=4 and tenure <=7 then "Old_Customer" 
when tenure >0 and tenure <=3 then "new_Customer "
when age >55 then "retired"
end as age_category,
count(case when exited =1 then 1 end)as churn,
count(case when exited =0 then 0 end )as not_churn
from bank_churn
group by 1
 order by 1;
