-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | seat_id     | int  |
-- | free        | bool |
-- +-------------+------+
-- seat_id is an auto-increment column for this table.
-- Each row of this table indicates whether the ith seat is free or not. 1 means free while 0 means occupied.
 

-- Find all the consecutive available seats in the cinema.

-- Return the result table ordered by seat_id in ascending order.

-- The test cases are generated so that more than two seats are consecutively available.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Cinema table:
-- +---------+------+
-- | seat_id | free |
-- +---------+------+
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
-- +---------+------+
-- Output: 
-- +---------+
-- | seat_id |
-- +---------+
-- | 3       |
-- | 4       |
-- | 5       |
-- +---------+

select W.seat_id
from
(select *, lead(free) over( order by seat_id) as NextSeat,
lag(free) over(order by seat_id) as PrevSeat
from cinema) as W
where W.free = 1 and W.NextSeat = 1 
or W.free = 1 and W.PrevSeat = 1 
order by W.seat_id