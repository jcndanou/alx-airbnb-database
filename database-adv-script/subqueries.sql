-- 1
SELECT
    P.property_id,
    P.name AS property_name,
    P.location,
    P.price_per_night
FROM
    "Property" AS P
WHERE
    P.property_id IN (
        SELECT
            R.property_id
        FROM
            "Review" AS R
        GROUP BY
            R.property_id
        HAVING
            AVG(R.rating) > 4.0
    );

-- 2

SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    U.email
FROM
    "User" AS U
WHERE (
    SELECT
        COUNT(B.booking_id)
    FROM
        "Booking" AS B
    WHERE
        B.user_id = U.user_id -- C'est ici que la corrélation se produit (U.user_id vient de la requête externe)
) > 3;