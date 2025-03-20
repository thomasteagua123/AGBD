select * from crime_scene_report 
where type = "murder" and city like "sql city" and date = 20180115

16371	Annabel Miller	490173	103	Franklin Ave	318771143
select * from person
where name like "Annabel%" and address_street_name = "Franklin Ave"

14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
select * from person
where address_street_name like "Northwestern Dr" ORDER BY address_number DESC