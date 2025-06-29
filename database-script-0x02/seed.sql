-- Insertion d'utilisateurs
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice', 'Smith', 'alice.smith@example.com', 'hashedpass1', '123-456-7890', 'guest', '2025-01-10 10:00:00'),
('b1cdef01-2345-6789-abcd-ef0123456789', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashedpass2', '098-765-4321', 'host', '2025-01-15 11:30:00'),
('c2deab34-5678-90ab-cdef-0123456789ab', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashedpass3', NULL, 'guest', '2025-01-20 14:00:00'),
('d3fecb56-7890-12cd-efab-cdef01234567', 'Diana', 'Prince', 'diana.p@example.com', 'hashedpass4', '555-123-4567', 'admin', '2025-01-25 09:00:00');

-- Insertion de propriétés (par Bob)
INSERT INTO "Property" (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('p0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b1cdef01-2345-6789-abcd-ef0123456789', 'Charmante Maison au Bord du Lac', 'Une maison paisible avec vue imprenable sur le lac. Parfait pour les familles.', 'Annecy, France', 150.00, '2025-02-01 10:00:00', '2025-06-25 15:00:00'),
('p1cdef01-2345-6789-abcd-ef0123456789', 'b1cdef01-2345-6789-abcd-ef0123456789', 'Appartement Urbain Stylé', 'Idéalement situé au cœur de la ville, proche de toutes les commodités.', 'Paris, France', 100.00, '2025-02-05 14:00:00', '2025-06-20 10:00:00');

-- Insertion de réservations
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2025-07-15', '2025-07-20', 750.00, 'confirmed', '2025-06-28 10:00:00'),
('b1cdef01-2345-6789-abcd-ef0123456789', 'p1cdef01-2345-6789-abcd-ef0123456789', 'c2deab34-5678-90ab-cdef-0123456789ab', '2025-08-01', '2025-08-05', 400.00, 'pending', '2025-06-29 12:00:00');

-- Insertion de paiements
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 750.00, '2025-06-28 10:05:00', 'credit_card');
-- Note: Le second booking est en statut 'pending', donc pas encore de paiement associé.

-- Insertion d'avis
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 5, 'Magnifique séjour, la vue était incroyable et la maison très confortable.', '2025-07-21 09:00:00');

-- Insertion de messages
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b1cdef01-2345-6789-abcd-ef0123456789', 'Bonjour, j''ai hâte de mon séjour ! Y a-t-il des restaurants à proximité ?', '2025-07-10 14:00:00'),
('msg1cdef01-2345-6789-abcd-ef0123456789', 'b1cdef01-2345-6789-abcd-ef0123456789', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Absolument ! Je vous enverrai une liste de mes favoris. Au plaisir de vous accueillir.', '2025-07-10 14:30:00');