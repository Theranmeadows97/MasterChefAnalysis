-- General query to get both tables joined
select *  FROM mc_contestants
join  mc_stats on mc_contestants.contestant_id = mc_stats.contestant_id

-- Which contestant has the most wins overall from all seasons?
select name, status, num_wins FROM mc_contestants
join  mc_stats on mc_contestants.contestant_id = mc_stats.contestant_id
order by num_wins DESC
limit 3

-- How many contestants scored 0 points or lower?
select count(*)  FROM mc_contestants
join  mc_stats on mc_contestants.contestant_id = mc_stats.contestant_id
where num_wins = 0 or num_wins < 0

-- Where are the majority of contestants coming from?
select distinct count(*) as num_of_contestants, home_state FROM mc_contestants
join  mc_stats on mc_contestants.contestant_id = mc_stats.contestant_id
group by home_state
order by count(*) DESC
limit 3

-- What is the average age among the winners?
select round(avg(age)) as AVG_age_of_winners FROM mc_contestants
join  mc_stats on mc_contestants.contestant_id = mc_stats.contestant_id
where status = 1
