-- Création de la table User
CREATE TABLE IF NOT EXISTS "User" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- Utilise un UUID généré automatiquement
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(50) NOT NULL CHECK (role IN ('guest', 'host', 'admin')), -- ENUM en PostgreSQL est souvent géré par CHECK
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index sur l'email pour des recherches rapides et l'unicité
CREATE INDEX IF NOT EXISTS idx_user_email ON "User" (email);
-- Index sur le rôle pour les requêtes par type d'utilisateur
CREATE INDEX IF NOT EXISTS idx_user_role ON "User" (role);

---

-- Création de la table Property
CREATE TABLE IF NOT EXISTS "Property" (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL, -- DECIMAL(précision, échelle)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Index sur l'ID de l'hôte pour les requêtes de propriétés par hôte
CREATE INDEX IF NOT EXISTS idx_property_host_id ON "Property" (host_id);
-- Index sur la localisation pour les recherches de propriétés par localisation
CREATE INDEX IF NOT EXISTS idx_property_location ON "Property" (location);

---

-- Création de la table Booking
CREATE TABLE IF NOT EXISTS "Booking" (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES "Property"(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Index sur l'ID de la propriété pour les requêtes de réservations par propriété
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON "Booking" (property_id);
-- Index sur l'ID de l'utilisateur pour les requêtes de réservations par utilisateur
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON "Booking" (user_id);

---

-- Création de la table Payment
CREATE TABLE IF NOT EXISTS "Payment" (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID UNIQUE NOT NULL, -- UNIQUE car un paiement par booking
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES "Booking"(booking_id) ON DELETE CASCADE
);

-- Index sur l'ID de la réservation pour les requêtes de paiements par réservation
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON "Payment" (booking_id);

---

-- Création de la table Review
CREATE TABLE IF NOT EXISTS "Review" (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES "Property"(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Index sur l'ID de la propriété et de l'utilisateur pour les avis
CREATE INDEX IF NOT EXISTS idx_review_property_id ON "Review" (property_id);
CREATE INDEX IF NOT EXISTS idx_review_user_id ON "Review" (user_id);

---

-- Création de la table Message
CREATE TABLE IF NOT EXISTS "Message" (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Index sur l'expéditeur et le destinataire pour les messages
CREATE INDEX IF NOT EXISTS idx_message_sender_id ON "Message" (sender_id);
CREATE INDEX IF NOT EXISTS idx_message_recipient_id ON "Message" (recipient_id);