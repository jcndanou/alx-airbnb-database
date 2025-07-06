
-- on commence par supprimer la table ainsi que les fk qui y sont
DROP TABLE IF EXISTS "Booking" CASCADE;

-- on cree la nouvelle table "Booking" comme table partitionnée
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
) PARTITION BY RANGE (start_date);

---

-- on creer les differentes partitions en fonction des plages que l'on veut
CREATE TABLE "Booking_2024" PARTITION OF "Booking"
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE "Booking_2025" PARTITION OF "Booking"
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE "Booking_2026" PARTITION OF "Booking"
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');


-- on cree les index sur la colonne de partitionement de toutes les tables partitionees
CREATE INDEX IF NOT EXISTS idx_booking_start_date ON "Booking" (start_date);
CREATE INDEX IF NOT EXISTS idx_booking_status_start_date ON "Booking" (status, start_date); 

-- test
EXPLAIN ANALYZE
SELECT *
FROM "Booking"
WHERE start_date >= '2025-03-01' AND start_date < '2025-04-01'
AND status = 'confirmed';
