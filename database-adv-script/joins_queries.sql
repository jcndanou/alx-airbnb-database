
-- Requête 1: INNER JOIN
-- Récupère toutes les réservations et les informations des utilisateurs qui les ont effectuées.
-- Seules les réservations qui ont un utilisateur correspondant seront affichées.
SELECT
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    B.status AS booking_status,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email
FROM
    "Booking" AS B
INNER JOIN
    "User" AS U ON B.user_id = U.user_id;

---

-- Requête 2: LEFT JOIN
-- Récupère toutes les propriétés et leurs avis, y compris les propriétés qui n'ont pas encore d'avis.
-- Si une propriété n'a pas d'avis, les colonnes d'avis (review_id, rating, comment) seront NULL.
SELECT
    P.property_id,
    P.name AS property_name,
    P.location,
    R.review_id,
    R.rating,
    R.comment,
    R.created_at AS review_date
FROM
    "Property" AS P
LEFT JOIN
    "Review" AS R ON P.property_id = R.property_id;

---

-- Requête 3: FULL OUTER JOIN
-- Récupère tous les utilisateurs et toutes les réservations.
-- Cela inclura les utilisateurs qui n'ont pas de réservations (colonnes de Booking seront NULL)
-- et, théoriquement, les réservations qui ne seraient pas liées à un utilisateur (colonnes de User seraient NULL).
-- Cependant, dans votre schéma, Booking.user_id est NOT NULL et est une clé étrangère,
-- ce qui signifie que chaque réservation est toujours liée à un utilisateur existant.
-- Donc, dans la pratique, les lignes avec des colonnes de User NULL ne devraient pas apparaître avec votre schéma actuel.
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    B.status AS booking_status
FROM
    "User" AS U
FULL OUTER JOIN
    "Booking" AS B ON U.user_id = B.user_id;
