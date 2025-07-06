--  requête initiale qui récupère toutes les réservations avec les détails de l'utilisateur, de la propriété et du paiement
EXPLAIN ANALYZE
SELECT
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price AS booking_total_price,
    B.status AS booking_status,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    P.property_id,
    P.name AS property_name,
    P.location AS property_location,
    P.price_per_night,
    PAY.payment_id,
    PAY.amount AS payment_amount,
    PAY.payment_date,
    PAY.payment_method
FROM
    "Booking" AS B
JOIN
    "User" AS U ON B.user_id = U.user_id
JOIN
    "Property" AS P ON B.property_id = P.property_id
LEFT JOIN
    "Payment" AS PAY ON B.booking_id = PAY.booking_id
WHERE
    B.status = 'confirmed'
    AND B.start_date >= '2025-07-01';



--  requête optimiser qui récupère toutes les réservations avec les détails de l'utilisateur, de la propriété sans les infos du paiement
EXPLAIN ANALYZE
SELECT
    B.booking_id,
    B.start_date,
    B.end_date,
    U.first_name,
    U.last_name,
    P.name AS property_name
FROM
    "Booking" AS B
JOIN
    "User" AS U ON B.user_id = U.user_id
JOIN
    "Property" AS P ON B.property_id = P.property_id
WHERE
    B.status = 'confirmed'
    AND B.start_date >= '2025-07-01';