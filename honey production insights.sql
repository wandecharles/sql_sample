create table honeyprod (state varchar(100),
						numcol double precision,
						yieldpercol int,
						totalprod double precision,
						stocks text,
						priceperlb money,
						prodvalue numeric,
						year int)

drop table honeyprod
select * from honeyprod

-----------How has honey production yield changed from 1998 to 2016?
select year, sum(totalprod) from honeyprod
group by year
order by year asc

------------Over time, what are the major production trends across the states?
select state, sum(totalprod) from honeyprod
group by state 
order by state

select state, sum(prodvalue) from honeyprod
group by state 
order by state;

-----price per pound for every year for every state
select state, year, priceperlb from honeyprod 
order by state, year


-----state with the highest number of honey producing colonies(north dakota)
select state, sum(numcol) from honeyprod
group by state 
order by sum(numcol) desc
limit 1

--------state with the lowest number of honey producing colonies("Oklahoma")
select state, sum(numcol) from honeyprod
group by state 
order by sum(numcol) asc
limit 1

-------yeild per colony for north dakota
select year, yieldpercol from honeyprod
where state ilike 'north dakota%'
order by year

-----prodcution value of north dakota per year
select year, prodvalue from honeyprod
where state ilike 'north dakota%'
order by year

----------yeild per colony for Oklahoma
select year, yieldpercol from honeyprod
where state ilike 'Oklahoma%'
order by year

-----prodcution value of Oklahoma per year
select year, prodvalue from honeyprod
where state ilike 'Oklahoma%'
order by year



-----------Are there any patterns that can be observed between total honey production and the value of production every year? 
--How has value of production, which in some sense could be tied to demand, changed every year?
select year, sum(totalprod) as total_honey_production, sum(prodvalue) as value_of_production from honeyprod
group by year
order by year
