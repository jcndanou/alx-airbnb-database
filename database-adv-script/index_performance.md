Without an index, PostgreSQL performs a slow sequential scan of the entire User table to find the email address.
With the idx_user_email index, a fast Index Scan allows direct access to the record.
Execution time is significantly reduced thanks to the index, especially on large tables.