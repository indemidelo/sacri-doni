-- 🔧 Setup Supabase per App Libri Regalati
-- Esegui questi comandi nel SQL Editor di Supabase

-- 1. Disabilita RLS (Row Level Security) per test rapidi
-- ATTENZIONE: Questo permette accesso pubblico! Va bene per app tra amici
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE books DISABLE ROW LEVEL SECURITY;
ALTER TABLE gifts DISABLE ROW LEVEL SECURITY;
ALTER TABLE reviews DISABLE ROW LEVEL SECURITY;

-- Se vuoi invece ABILITARE la sicurezza (consigliato), usa queste policy:

-- 2. OPZIONE SICURA: Abilita RLS con policy corrette
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE books ENABLE ROW LEVEL SECURITY;
ALTER TABLE gifts ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;

-- Policy per users (tutti possono leggere, nessuno può modificare)
CREATE POLICY "Users leggibili da tutti"
  ON users FOR SELECT
  USING (true);

-- Policy per books (tutti possono leggere e inserire)
CREATE POLICY "Books leggibili da tutti"
  ON books FOR SELECT
  USING (true);

CREATE POLICY "Books inseribili da tutti"
  ON books FOR INSERT
  WITH CHECK (true);

-- Policy per gifts (tutti possono leggere e inserire)
CREATE POLICY "Gifts leggibili da tutti"
  ON gifts FOR SELECT
  USING (true);

CREATE POLICY "Gifts inseribili da tutti"
  ON gifts FOR INSERT
  WITH CHECK (true);

-- Policy per reviews (tutti possono leggere e inserire)
CREATE POLICY "Reviews leggibili da tutti"
  ON reviews FOR SELECT
  USING (true);

CREATE POLICY "Reviews inseribili da tutti"
  ON reviews FOR INSERT
  WITH CHECK (true);

-- 3. Verifica che i dati siano presenti
SELECT * FROM users;
SELECT * FROM books;
SELECT * FROM gifts;
SELECT * FROM reviews;

-- 4. (Opzionale) Aggiungi indici per performance
CREATE INDEX IF NOT EXISTS idx_gifts_receiver ON gifts(receiver_id);
CREATE INDEX IF NOT EXISTS idx_gifts_giver ON gifts(giver_id);
CREATE INDEX IF NOT EXISTS idx_reviews_gift ON reviews(gift_id);
CREATE INDEX IF NOT EXISTS idx_reviews_reviewer ON reviews(reviewer_id);

-- 5. (Opzionale) Aggiungi constraint per evitare recensioni duplicate
ALTER TABLE reviews 
ADD CONSTRAINT unique_reviewer_per_gift 
UNIQUE (gift_id, reviewer_id);