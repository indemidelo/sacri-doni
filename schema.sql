CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  pin TEXT NOT NULL
);
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL
);
CREATE TABLE gifts (
  id SERIAL PRIMARY KEY,
  book_id INTEGER REFERENCES books(id),
  giver_id INTEGER REFERENCES users(id),
  receiver_id INTEGER REFERENCES users(id),
  gift_year INTEGER NOT NULL
);
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  gift_id INTEGER REFERENCES gifts(id),
  reviewer_id INTEGER REFERENCES users(id),
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comment TEXT
);

INSERT INTO users (name, pin)
VALUES
('Giulio',''),
('Luca',''),
('Sergio','');