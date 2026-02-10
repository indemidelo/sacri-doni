-- FIX RLS per permettere UPDATE e INSERT delle recensioni
-- Esegui questo SQL nel SQL Editor di Supabase

-- 1. Disabilita completamente RLS (soluzione veloce per app tra amici)
ALTER TABLE reviews DISABLE ROW LEVEL SECURITY;

-- OPPURE (se vuoi mantenere un minimo di sicurezza)
-- 2. Abilita RLS ma permetti tutto

-- Prima cancella le policy esistenti
DROP POLICY IF EXISTS "Reviews leggibili da tutti" ON reviews;
DROP POLICY IF EXISTS "Reviews inseribili da tutti" ON reviews;

-- Ricrea le policy corrette
CREATE POLICY "Reviews leggibili da tutti"
  ON reviews FOR SELECT
  USING (true);

CREATE POLICY "Reviews inseribili da tutti"
  ON reviews FOR INSERT
  WITH CHECK (true);

-- QUESTA È LA POLICY MANCANTE CHE CAUSA IL PROBLEMA!
CREATE POLICY "Reviews aggiornabili da tutti"
  ON reviews FOR UPDATE
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Reviews eliminabili da tutti"
  ON reviews FOR DELETE
  USING (true);

-- Verifica che le policy siano attive
SELECT schemaname, tablename, policyname, cmd 
FROM pg_policies 
WHERE tablename = 'reviews';