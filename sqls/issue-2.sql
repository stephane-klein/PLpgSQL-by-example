CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
    firstname   VARCHAR(100) DEFAULT NULL,
    metadata    JSONB DEFAULT NULL
);

INSERT INTO users
(
    firstname,
    metadata
)

VALUES
    (
        'Firstname 1',
        '{
            "group": [
                {
                    "field_a": 1,
                    "field_b": 2
                },
                {
                    "field_a": 4,
                    "field_b": 8
                }
            ]
        }'::JSONB
    ),
    (
        'Firstname 2',
        '{
            "group": [
                {
                    "field_a": 6,
                    "field_b": 5
                },
                {
                    "field_a": 9,
                    "field_b": 3
                },
                {
                    "field_a": 2,
                    "field_b": 1
                }
            ]
        }'::JSONB
    );
