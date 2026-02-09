-- Script di inserimento libri, regali e recensioni (CORRETTO)
-- Ogni libro è regalato UNA VOLTA da una persona a un'altra
-- Poi il libro gira e tutti e 3 lo leggono e votano

-- Prima inserisci i libri
INSERT INTO books (title, author) VALUES
('Cose che succedono la notte', 'Autore sconosciuto'),
('L''anno del pensiero magico', 'Autore sconosciuto'),
('Le palme selvagge', 'Autore sconosciuto'),
('Lettere di Berlicche', 'Autore sconosciuto'),
('Malone muore', 'Autore sconosciuto'),
('Roma senza papa', 'Autore sconosciuto'),
('2120', 'Autore sconosciuto'),
('Canada', 'Autore sconosciuto'),
('Il tempo è un bastardo', 'Autore sconosciuto'),
('La più recondita memoria degli uomini', 'Autore sconosciuto'),
('Lamento di Portnoy', 'Autore sconosciuto'),
('Melancolia della resistenza', 'Autore sconosciuto'),
('Aaron', 'Autore sconosciuto'),
('All''amico che non mi ha salvato la vita', 'Autore sconosciuto'),
('Dance! Kremlin Palace', 'Autore sconosciuto'),
('L''incontro segreto', 'Autore sconosciuto'),
('Melvill', 'Autore sconosciuto'),
('Troppi paradisi', 'Autore sconosciuto'),
('Blast', 'Autore sconosciuto'),
('Guerra', 'Autore sconosciuto'),
('I Tre Adolf', 'Autore sconosciuto'),
('L''Invincibile', 'Autore sconosciuto'),
('Testosterrore', 'Autore sconosciuto'),
('Underworld', 'Autore sconosciuto'),
('Cold Prison', 'Autore sconosciuto'),
('Follia', 'Autore sconosciuto'),
('Fuochi', 'Autore sconosciuto'),
('La città e la città', 'Autore sconosciuto'),
('La città e i cani', 'Autore sconosciuto'),
('Tokyo Zombie', 'Autore sconosciuto')
ON CONFLICT DO NOTHING;

-- Inserisci i regali (1 riga per libro)
-- Formato: (titolo, donatore_id, ricevente_id, anno)

-- 2021
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Cose che succedono la notte'), 1, 3, 2021), -- Giulio -> Sergio
((SELECT id FROM books WHERE title = 'L''anno del pensiero magico'), 1, 2, 2021), -- Giulio -> Luca
((SELECT id FROM books WHERE title = 'Le palme selvagge'), 3, 1, 2021), -- Sergio -> Giulio
((SELECT id FROM books WHERE title = 'Lettere di Berlicche'), 2, 2, 2021), -- Luca -> Luca
((SELECT id FROM books WHERE title = 'Malone muore'), 3, 3, 2021), -- Sergio -> Sergio
((SELECT id FROM books WHERE title = 'Roma senza papa'), 2, 1, 2021); -- Luca -> Giulio

-- 2022
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = '2120'), 3, 1, 2022), -- Sergio -> Giulio
((SELECT id FROM books WHERE title = 'Canada'), 3, 2, 2022), -- Sergio -> Luca
((SELECT id FROM books WHERE title = 'Il tempo è un bastardo'), 1, 2, 2022), -- Giulio -> Luca
((SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini'), 2, 1, 2022), -- Luca -> Giulio
((SELECT id FROM books WHERE title = 'Lamento di Portnoy'), 2, 3, 2022), -- Luca -> Sergio
((SELECT id FROM books WHERE title = 'Melancolia della resistenza'), 1, 3, 2022); -- Giulio -> Sergio

-- 2023
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Aaron'), 3, 1, 2023), -- Sergio -> Giulio
((SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita'), 3, 3, 2023), -- Sergio -> Sergio
((SELECT id FROM books WHERE title = 'Dance! Kremlin Palace'), 1, 2, 2023), -- Giulio -> Luca
((SELECT id FROM books WHERE title = 'L''incontro segreto'), 1, 3, 2023), -- Giulio -> Sergio
((SELECT id FROM books WHERE title = 'Melvill'), 2, 3, 2023), -- Luca -> Sergio
((SELECT id FROM books WHERE title = 'Troppi paradisi'), 2, 1, 2023); -- Luca -> Giulio

-- 2024
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Blast'), 3, 2, 2024), -- Sergio -> Luca
((SELECT id FROM books WHERE title = 'Guerra'), 2, 1, 2024), -- Luca -> Giulio
((SELECT id FROM books WHERE title = 'I Tre Adolf'), 3, 1, 2024), -- Sergio -> Giulio
((SELECT id FROM books WHERE title = 'L''Invincibile'), 1, 3, 2024), -- Giulio -> Sergio
((SELECT id FROM books WHERE title = 'Testosterrore'), 1, 2, 2024), -- Giulio -> Luca
((SELECT id FROM books WHERE title = 'Underworld'), 2, 3, 2024); -- Luca -> Sergio

-- 2025
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Cold Prison'), 3, 2, 2025), -- Sergio -> Luca
((SELECT id FROM books WHERE title = 'Follia'), 2, 1, 2025), -- Luca -> Giulio
((SELECT id FROM books WHERE title = 'Fuochi'), 3, 1, 2025), -- Sergio -> Giulio
((SELECT id FROM books WHERE title = 'La città e la città'), 1, 2, 2025), -- Giulio -> Luca
((SELECT id FROM books WHERE title = 'La città e i cani'), 2, 3, 2025), -- Luca -> Sergio
((SELECT id FROM books WHERE title = 'Tokyo Zombie'), 1, 3, 2025); -- Giulio -> Sergio

-- ============================================
-- ORA INSERIAMO LE RECENSIONI
-- Ogni libro può avere 3 recensioni (Giulio, Luca, Sergio)
-- anche se è stato regalato solo a uno di loro
-- ============================================

-- 2021
-- Cose che succedono la notte (Giulio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cose che succedono la notte') AND gift_year = 2021), 1, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cose che succedono la notte') AND gift_year = 2021), 2, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cose che succedono la notte') AND gift_year = 2021), 3, 1);

-- L'anno del pensiero magico (Giulio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''anno del pensiero magico') AND gift_year = 2021), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''anno del pensiero magico') AND gift_year = 2021), 2, 2);

-- Le palme selvagge (Sergio -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Le palme selvagge') AND gift_year = 2021), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Le palme selvagge') AND gift_year = 2021), 2, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Le palme selvagge') AND gift_year = 2021), 3, 4);

-- Lettere di Berlicche (Luca -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lettere di Berlicche') AND gift_year = 2021), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lettere di Berlicche') AND gift_year = 2021), 2, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lettere di Berlicche') AND gift_year = 2021), 3, 1);

-- Malone muore (Sergio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Malone muore') AND gift_year = 2021), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Malone muore') AND gift_year = 2021), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Malone muore') AND gift_year = 2021), 3, 4);

-- Roma senza papa (Luca -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Roma senza papa') AND gift_year = 2021), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Roma senza papa') AND gift_year = 2021), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Roma senza papa') AND gift_year = 2021), 3, 3);

-- 2022
-- 2120 (Sergio -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = '2120') AND gift_year = 2022), 1, 5),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = '2120') AND gift_year = 2022), 2, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = '2120') AND gift_year = 2022), 3, 4);

-- Canada (Sergio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Canada') AND gift_year = 2022), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Canada') AND gift_year = 2022), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Canada') AND gift_year = 2022), 3, 2);

-- Il tempo è un bastardo (Giulio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Il tempo è un bastardo') AND gift_year = 2022), 1, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Il tempo è un bastardo') AND gift_year = 2022), 2, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Il tempo è un bastardo') AND gift_year = 2022), 3, 4);

-- La più recondita memoria degli uomini (Luca -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini') AND gift_year = 2022), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini') AND gift_year = 2022), 2, 3);

-- Lamento di Portnoy (Luca -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lamento di Portnoy') AND gift_year = 2022), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lamento di Portnoy') AND gift_year = 2022), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Lamento di Portnoy') AND gift_year = 2022), 3, 3);

-- Melancolia della resistenza (Giulio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Melancolia della resistenza') AND gift_year = 2022), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Melancolia della resistenza') AND gift_year = 2022), 3, 3);

-- 2023
-- Aaron (Sergio -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Aaron') AND gift_year = 2023), 1, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Aaron') AND gift_year = 2023), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Aaron') AND gift_year = 2023), 3, 2);

-- All'amico che non mi ha salvato la vita (Sergio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita') AND gift_year = 2023), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita') AND gift_year = 2023), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita') AND gift_year = 2023), 3, 3);

-- Dance! Kremlin Palace (Giulio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Dance! Kremlin Palace') AND gift_year = 2023), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Dance! Kremlin Palace') AND gift_year = 2023), 2, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Dance! Kremlin Palace') AND gift_year = 2023), 3, 3);

-- L'incontro segreto (Giulio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''incontro segreto') AND gift_year = 2023), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''incontro segreto') AND gift_year = 2023), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''incontro segreto') AND gift_year = 2023), 3, 1);

-- Melvill (Luca -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Melvill') AND gift_year = 2023), 1, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Melvill') AND gift_year = 2023), 2, 1),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Melvill') AND gift_year = 2023), 3, 1);

-- Troppi paradisi (Luca -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Troppi paradisi') AND gift_year = 2023), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Troppi paradisi') AND gift_year = 2023), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Troppi paradisi') AND gift_year = 2023), 3, 4);

-- 2024
-- Blast (Sergio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Blast') AND gift_year = 2024), 1, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Blast') AND gift_year = 2024), 2, 5),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Blast') AND gift_year = 2024), 3, 5);

-- Guerra (Luca -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Guerra') AND gift_year = 2024), 1, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Guerra') AND gift_year = 2024), 3, 3);

-- I Tre Adolf (Sergio -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'I Tre Adolf') AND gift_year = 2024), 1, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'I Tre Adolf') AND gift_year = 2024), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'I Tre Adolf') AND gift_year = 2024), 3, 3);

-- L'Invincibile (Giulio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''Invincibile') AND gift_year = 2024), 1, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'L''Invincibile') AND gift_year = 2024), 3, 2);

-- Testosterrore (Giulio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Testosterrore') AND gift_year = 2024), 2, 2);

-- Underworld (Luca -> Sergio) - nessuna recensione

-- 2025
-- Cold Prison (Sergio -> Luca)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cold Prison') AND gift_year = 2025), 1, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cold Prison') AND gift_year = 2025), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Cold Prison') AND gift_year = 2025), 3, 2);

-- Follia (Luca -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Follia') AND gift_year = 2025), 1, 2);

-- Fuochi (Sergio -> Giulio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Fuochi') AND gift_year = 2025), 1, 4),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Fuochi') AND gift_year = 2025), 2, 3),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Fuochi') AND gift_year = 2025), 3, 4);

-- La città e la città (Giulio -> Luca) - nessuna recensione

-- La città e i cani (Luca -> Sergio) - nessuna recensione

-- Tokyo Zombie (Giulio -> Sergio)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Tokyo Zombie') AND gift_year = 2025), 2, 2),
((SELECT id FROM gifts WHERE book_id = (SELECT id FROM books WHERE title = 'Tokyo Zombie') AND gift_year = 2025), 3, 2);

-- Verifica i dati inseriti
SELECT 
    'Libri totali:' as tipo, 
    COUNT(*) as numero 
FROM books
UNION ALL
SELECT 
    'Regali totali:', 
    COUNT(*) 
FROM gifts
UNION ALL
SELECT 
    'Recensioni totali:', 
    COUNT(*) 
FROM reviews;