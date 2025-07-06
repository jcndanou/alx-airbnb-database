# Query 1: INNER JOIN
-- Retrieves all reservations and the information of the users who made them.
# Query 2: LEFT JOIN
-- Retrieves all properties and their reviews, including properties that do not yet have any reviews.
# Query 3: FULL OUTER JOIN
-- Retrieves all users and all reservations.

# Query 4: COUNT and GROUP BY
-- Count the number of reservations made by each user.
# Query 5: RANK and ROW NUMBER
-- Rank properties based on their total number of reservations.

# 1st subqueries
The subquery identifies property_ids with an average rating > 4.0 in "Review".
The main query selects matching properties in "Property".
The WHERE IN filter links the two, retaining only highly rated properties.

"(3 concise lines explaining: 1) the role of the subquery, 2) the action of the main query, 3) their interaction via WHERE IN)"

# 2nd subqueries
The main query retrieves user information (U.user_id, U.first_name).
A correlated subquery (via B.user_id = U.user_id) counts their reservations.
Only users with more than 3 reservations are retained (WHERE count > 3).