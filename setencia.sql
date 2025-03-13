

SELECT * FROM INHABITANT WHERE state = "friendly" and job = "weaponsmith"


SELECT * FROM INHABITANT WHERE state = "friendly" and job like "%smith"


SELECT personid FROM INHABITANT WHERE name like "stranger"



SELECT gold FROM INHABITANT WHERE name like "stranger"



SELECT * FROM ITEM WHERE owner is NULL 



UPDATE item SET owner = 20 where owner is null



SELECT * FROM ITEM WHERE owner = "20"



SELECT * FROM INHABITANT WHERE state = "friendly" and job = "dealer" or job = "merchant"



update item set owner = 15 where owner = "20"



update INHABITANT set name = "Thomas"



SELECT * FROM INHABITANT WHERE job = "baker" order by gold desc



select i.name from inhabitant i inner join village v on i.personid = v.chief where v.name ="Onionville"



select count(i.name) from inhabitant i 
inner join village v on i.villageid = v.villageid
where i.gender = 'f' and v.name = "Onionville"