-- Index sur l'email pour des recherches rapides et l'unicité
CREATE INDEX IF NOT EXISTS idx_user_email ON "User" (email);
-- Index sur le rôle pour les requêtes par type d'utilisateur
CREATE INDEX IF NOT EXISTS idx_user_role ON "User" (role);
-- Index sur le rôle pour les requêtes par type d'utilisateur
CREATE INDEX IF NOT EXISTS user_id ON "User" (user_id);

CREATE INDEX IF NOT EXISTS idx_property_host_id ON "Property" (host_id);
-- Index sur la localisation pour les recherches de propriétés par localisation
CREATE INDEX IF NOT EXISTS idx_property_location ON "Property" (location);

-- Index sur l'ID de la propriété pour les requêtes de réservations par propriété
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON "Booking" (property_id);
-- Index sur l'ID de l'utilisateur pour les requêtes de réservations par utilisateur
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON "Booking" (user_id);

-- Index sur l'ID de la réservation pour les requêtes de paiements par réservation
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON "Payment" (booking_id);

-- Index sur l'ID de la propriété et de l'utilisateur pour les avis
CREATE INDEX IF NOT EXISTS idx_review_property_id ON "Review" (property_id);
CREATE INDEX IF NOT EXISTS idx_review_user_id ON "Review" (user_id);

-- Index sur l'expéditeur et le destinataire pour les messages
CREATE INDEX IF NOT EXISTS idx_message_sender_id ON "Message" (sender_id);
CREATE INDEX IF NOT EXISTS idx_message_recipient_id ON "Message" (recipient_id);

-- Test
EXPLAIN ANALYZE
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    "User"
WHERE
    email = 'user10@example.com';