-- Requête 4: COUNT et GROUP BY
-- compter le nombre de réservations effectuées par chaque utilisateur.
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    COUNT(B.booking_id) AS total_bookings
FROM
    "User" AS U
JOIN
    "Booking" AS B ON U.user_id = B.user_id
GROUP BY
    U.user_id, U.first_name, U.last_name
ORDER BY
    total_bookings DESC;

-- Requête 5: RANK et ROW NUMBER
-- classer les propriétés en fonction de leur nombre total de réservations.
WITH PropertyBookingCounts AS (
    SELECT
        P.property_id,
        P.name AS property_name,
        COUNT(B.booking_id) AS number_of_bookings
    FROM
        "Property" AS P
    LEFT JOIN
        "Booking" AS B ON P.property_id = B.property_id
    GROUP BY
        P.property_id, P.name
)
SELECT
    property_id,
    property_name,
    number_of_bookings,
    RANK() OVER (ORDER BY number_of_bookings DESC) AS rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY number_of_bookings DESC) AS row_num_by_bookings
FROM
    PropertyBookingCounts
ORDER BY
    rank_by_bookings, property_name;