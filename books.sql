-- Script di inserimento libri, regali e recensioni
-- Esegui questo script nel SQL Editor di Supabase

-- Prima inserisci i libri (senza duplicati)
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

-- Ora inserisci i regali
-- Ogni libro può essere regalato a tutti e 3 (Giulio, Luca, Sergio)

-- 2021
-- Cose che succedono la notte - Giulio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Cose che succedono la notte'), 1, 1, 2021), -- a Giulio
((SELECT id FROM books WHERE title = 'Cose che succedono la notte'), 1, 2, 2021), -- a Luca
((SELECT id FROM books WHERE title = 'Cose che succedono la notte'), 1, 3, 2021); -- a Sergio

-- L'anno del pensiero magico - Giulio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'L''anno del pensiero magico'), 1, 1, 2021),
((SELECT id FROM books WHERE title = 'L''anno del pensiero magico'), 1, 2, 2021),
((SELECT id FROM books WHERE title = 'L''anno del pensiero magico'), 1, 3, 2021);

-- Le palme selvagge - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Le palme selvagge'), 3, 1, 2021),
((SELECT id FROM books WHERE title = 'Le palme selvagge'), 3, 2, 2021),
((SELECT id FROM books WHERE title = 'Le palme selvagge'), 3, 3, 2021);

-- Lettere di Berlicche - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Lettere di Berlicche'), 2, 1, 2021),
((SELECT id FROM books WHERE title = 'Lettere di Berlicche'), 2, 2, 2021),
((SELECT id FROM books WHERE title = 'Lettere di Berlicche'), 2, 3, 2021);

-- Malone muore - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Malone muore'), 3, 1, 2021),
((SELECT id FROM books WHERE title = 'Malone muore'), 3, 2, 2021),
((SELECT id FROM books WHERE title = 'Malone muore'), 3, 3, 2021);

-- Roma senza papa - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Roma senza papa'), 2, 1, 2021),
((SELECT id FROM books WHERE title = 'Roma senza papa'), 2, 2, 2021),
((SELECT id FROM books WHERE title = 'Roma senza papa'), 2, 3, 2021);

-- 2022
-- 2120 - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = '2120'), 3, 1, 2022),
((SELECT id FROM books WHERE title = '2120'), 3, 2, 2022),
((SELECT id FROM books WHERE title = '2120'), 3, 3, 2022);

-- Canada - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Canada'), 3, 1, 2022),
((SELECT id FROM books WHERE title = 'Canada'), 3, 2, 2022),
((SELECT id FROM books WHERE title = 'Canada'), 3, 3, 2022);

-- Il tempo è un bastardo - Giulio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Il tempo è un bastardo'), 1, 1, 2022),
((SELECT id FROM books WHERE title = 'Il tempo è un bastardo'), 1, 2, 2022),
((SELECT id FROM books WHERE title = 'Il tempo è un bastardo'), 1, 3, 2022);

-- La più recondita memoria degli uomini - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini'), 2, 1, 2022),
((SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini'), 2, 2, 2022),
((SELECT id FROM books WHERE title = 'La più recondita memoria degli uomini'), 2, 3, 2022);

-- Lamento di Portnoy - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Lamento di Portnoy'), 2, 1, 2022),
((SELECT id FROM books WHERE title = 'Lamento di Portnoy'), 2, 2, 2022),
((SELECT id FROM books WHERE title = 'Lamento di Portnoy'), 2, 3, 2022);

-- Melancolia della resistenza - Giulio regala a Giulio e Sergio
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Melancolia della resistenza'), 1, 1, 2022),
((SELECT id FROM books WHERE title = 'Melancolia della resistenza'), 1, 3, 2022);

-- 2023
-- Aaron - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Aaron'), 3, 1, 2023),
((SELECT id FROM books WHERE title = 'Aaron'), 3, 2, 2023),
((SELECT id FROM books WHERE title = 'Aaron'), 3, 3, 2023);

-- All'amico che non mi ha salvato la vita - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita'), 3, 1, 2023),
((SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita'), 3, 2, 2023),
((SELECT id FROM books WHERE title = 'All''amico che non mi ha salvato la vita'), 3, 3, 2023);

-- Dance! Kremlin Palace - Giulio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Dance! Kremlin Palace'), 1, 1, 2023),
((SELECT id FROM books WHERE title = 'Dance! Kremlin Palace'), 1, 2, 2023),
((SELECT id FROM books WHERE title = 'Dance! Kremlin Palace'), 1, 3, 2023);

-- L'incontro segreto - Giulio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'L''incontro segreto'), 1, 1, 2023),
((SELECT id FROM books WHERE title = 'L''incontro segreto'), 1, 2, 2023),
((SELECT id FROM books WHERE title = 'L''incontro segreto'), 1, 3, 2023);

-- Melvill - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Melvill'), 2, 1, 2023),
((SELECT id FROM books WHERE title = 'Melvill'), 2, 2, 2023),
((SELECT id FROM books WHERE title = 'Melvill'), 2, 3, 2023);

-- Troppi paradisi - Luca regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Troppi paradisi'), 2, 1, 2023),
((SELECT id FROM books WHERE title = 'Troppi paradisi'), 2, 2, 2023),
((SELECT id FROM books WHERE title = 'Troppi paradisi'), 2, 3, 2023);

-- 2024
-- Blast - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Blast'), 3, 1, 2024),
((SELECT id FROM books WHERE title = 'Blast'), 3, 2, 2024),
((SELECT id FROM books WHERE title = 'Blast'), 3, 3, 2024);

-- Guerra - Luca regala a Giulio e Sergio
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Guerra'), 2, 1, 2024),
((SELECT id FROM books WHERE title = 'Guerra'), 2, 3, 2024);

-- I Tre Adolf - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'I Tre Adolf'), 3, 1, 2024),
((SELECT id FROM books WHERE title = 'I Tre Adolf'), 3, 2, 2024),
((SELECT id FROM books WHERE title = 'I Tre Adolf'), 3, 3, 2024);

-- L'Invincibile - Giulio regala a Giulio e Sergio
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'L''Invincibile'), 1, 1, 2024),
((SELECT id FROM books WHERE title = 'L''Invincibile'), 1, 3, 2024);

-- Testosterrore - Giulio regala a Luca
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Testosterrore'), 1, 2, 2024);

-- Underworld - Luca regala (nessuna recensione quindi non inserisco)

-- 2025
-- Cold Prison - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Cold Prison'), 3, 1, 2025),
((SELECT id FROM books WHERE title = 'Cold Prison'), 3, 2, 2025),
((SELECT id FROM books WHERE title = 'Cold Prison'), 3, 3, 2025);

-- Follia - Luca regala a Giulio
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Follia'), 2, 1, 2025);

-- Fuochi - Sergio regala a tutti
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Fuochi'), 3, 1, 2025),
((SELECT id FROM books WHERE title = 'Fuochi'), 3, 2, 2025),
((SELECT id FROM books WHERE title = 'Fuochi'), 3, 3, 2025);

-- La città e la città - Giulio regala (nessuna recensione quindi non inserisco)

-- La città e i cani - Luca regala (nessuna recensione quindi non inserisco)

-- Tokyo Zombie - Giulio regala a Luca e Sergio
INSERT INTO gifts (book_id, giver_id, receiver_id, gift_year) VALUES
((SELECT id FROM books WHERE title = 'Tokyo Zombie'), 1, 2, 2025),
((SELECT id FROM books WHERE title = 'Tokyo Zombie'), 1, 3, 2025);

-- ============================================
-- ORA INSERIAMO LE RECENSIONI
-- ============================================

-- 2021
-- Cose che succedono la notte (Giulio regala)
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cose che succedono la notte' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cose che succedono la notte' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cose che succedono la notte' AND g.receiver_id = 3 AND g.gift_year = 2021), 3, 1);

-- L'anno del pensiero magico
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''anno del pensiero magico' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''anno del pensiero magico' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 2);

-- Le palme selvagge
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Le palme selvagge' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Le palme selvagge' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Le palme selvagge' AND g.receiver_id = 3 AND g.gift_year = 2021), 3, 4);

-- Lettere di Berlicche
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lettere di Berlicche' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lettere di Berlicche' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lettere di Berlicche' AND g.receiver_id = 3 AND g.gift_year = 2021), 3, 1);

-- Malone muore
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Malone muore' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Malone muore' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Malone muore' AND g.receiver_id = 3 AND g.gift_year = 2021), 3, 4);

-- Roma senza papa
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Roma senza papa' AND g.receiver_id = 1 AND g.gift_year = 2021), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Roma senza papa' AND g.receiver_id = 2 AND g.gift_year = 2021), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Roma senza papa' AND g.receiver_id = 3 AND g.gift_year = 2021), 3, 3);

-- 2022
-- 2120
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = '2120' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 5),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = '2120' AND g.receiver_id = 2 AND g.gift_year = 2022), 2, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = '2120' AND g.receiver_id = 3 AND g.gift_year = 2022), 3, 4);

-- Canada
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Canada' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Canada' AND g.receiver_id = 2 AND g.gift_year = 2022), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Canada' AND g.receiver_id = 3 AND g.gift_year = 2022), 3, 2);

-- Il tempo è un bastardo
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Il tempo è un bastardo' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Il tempo è un bastardo' AND g.receiver_id = 2 AND g.gift_year = 2022), 2, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Il tempo è un bastardo' AND g.receiver_id = 3 AND g.gift_year = 2022), 3, 4);

-- La più recondita memoria degli uomini
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'La più recondita memoria degli uomini' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'La più recondita memoria degli uomini' AND g.receiver_id = 2 AND g.gift_year = 2022), 2, 3);

-- Lamento di Portnoy
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lamento di Portnoy' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lamento di Portnoy' AND g.receiver_id = 2 AND g.gift_year = 2022), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Lamento di Portnoy' AND g.receiver_id = 3 AND g.gift_year = 2022), 3, 3);

-- Melancolia della resistenza
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Melancolia della resistenza' AND g.receiver_id = 1 AND g.gift_year = 2022), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Melancolia della resistenza' AND g.receiver_id = 3 AND g.gift_year = 2022), 3, 3);

-- 2023
-- Aaron
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Aaron' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Aaron' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Aaron' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 2);

-- All'amico che non mi ha salvato la vita
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'All''amico che non mi ha salvato la vita' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'All''amico che non mi ha salvato la vita' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'All''amico che non mi ha salvato la vita' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 3);

-- Dance! Kremlin Palace
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Dance! Kremlin Palace' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Dance! Kremlin Palace' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Dance! Kremlin Palace' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 3);

-- L'incontro segreto
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''incontro segreto' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''incontro segreto' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''incontro segreto' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 1);

-- Melvill
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Melvill' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Melvill' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 1),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Melvill' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 1);

-- Troppi paradisi
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Troppi paradisi' AND g.receiver_id = 1 AND g.gift_year = 2023), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Troppi paradisi' AND g.receiver_id = 2 AND g.gift_year = 2023), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Troppi paradisi' AND g.receiver_id = 3 AND g.gift_year = 2023), 3, 4);

-- 2024
-- Blast
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Blast' AND g.receiver_id = 1 AND g.gift_year = 2024), 1, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Blast' AND g.receiver_id = 2 AND g.gift_year = 2024), 2, 5),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Blast' AND g.receiver_id = 3 AND g.gift_year = 2024), 3, 5);

-- Guerra
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Guerra' AND g.receiver_id = 1 AND g.gift_year = 2024), 1, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Guerra' AND g.receiver_id = 3 AND g.gift_year = 2024), 3, 3);

-- I Tre Adolf
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'I Tre Adolf' AND g.receiver_id = 1 AND g.gift_year = 2024), 1, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'I Tre Adolf' AND g.receiver_id = 2 AND g.gift_year = 2024), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'I Tre Adolf' AND g.receiver_id = 3 AND g.gift_year = 2024), 3, 3);

-- L'Invincibile
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''Invincibile' AND g.receiver_id = 1 AND g.gift_year = 2024), 1, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'L''Invincibile' AND g.receiver_id = 3 AND g.gift_year = 2024), 3, 2);

-- Testosterrore
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Testosterrore' AND g.receiver_id = 2 AND g.gift_year = 2024), 2, 2);

-- 2025
-- Cold Prison
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cold Prison' AND g.receiver_id = 1 AND g.gift_year = 2025), 1, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cold Prison' AND g.receiver_id = 2 AND g.gift_year = 2025), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Cold Prison' AND g.receiver_id = 3 AND g.gift_year = 2025), 3, 2);

-- Follia
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Follia' AND g.receiver_id = 1 AND g.gift_year = 2025), 1, 2);

-- Fuochi
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Fuochi' AND g.receiver_id = 1 AND g.gift_year = 2025), 1, 4),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Fuochi' AND g.receiver_id = 2 AND g.gift_year = 2025), 2, 3),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Fuochi' AND g.receiver_id = 3 AND g.gift_year = 2025), 3, 4);

-- Tokyo Zombie
INSERT INTO reviews (gift_id, reviewer_id, rating) VALUES
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Tokyo Zombie' AND g.receiver_id = 2 AND g.gift_year = 2025), 2, 2),
((SELECT g.id FROM gifts g JOIN books b ON g.book_id = b.id WHERE b.title = 'Tokyo Zombie' AND g.receiver_id = 3 AND g.gift_year = 2025), 3, 2);

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