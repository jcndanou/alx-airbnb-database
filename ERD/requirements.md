# Data Model for a Property Rental Platform

## Entities

### User
Represents platform users, whether guests, hosts, or administrators.

### Property
Represents rental properties listed by hosts.

### Booking
Represents a property reservation by a user for specific dates.

### Payment
Records financial transactions related to bookings.

### Review
Allows users to leave ratings and feedback about properties.

### Message
Enables communication between users.

## Relationships

- **User and Property**  
  A user (host) can own multiple properties. Each property is listed by exactly one host. *(One-to-many relationship)*

- **User and Booking**  
  A user (guest) can make multiple bookings. Each booking is made by exactly one user. *(One-to-many relationship)*

- **Property and Booking**  
  A property can have multiple bookings. Each booking concerns exactly one property. *(One-to-many relationship)*

- **Booking and Payment**  
  A booking has exactly one associated payment. Each payment is linked to exactly one booking. *(One-to-one relationship)*

- **User and Review**  
  A user can write multiple reviews. Each review is written by exactly one user. *(One-to-many relationship)*

- **Property and Review**  
  A property can receive multiple reviews. Each review concerns exactly one property. *(One-to-many relationship)*

- **User and Message (sender)**  
  A user can send multiple messages. Each message has exactly one sender. *(One-to-many relationship)*

- **User and Message (recipient)**  
  A user can receive multiple messages. Each message has exactly one recipient. *(One-to-many relationship)*

## Visual representation of ER Diagram
<img src="..\Images\erd.png" alt="ER Diagram" width="400"/>