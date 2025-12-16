--1 TABLO OLUŞTURMA--
CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    country VARCHAR(255),
    founded_year INT
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    release_date DATE,
    rating DECIMAL(3,1),
    developer_id INT NOT NULL,
    
    CONSTRAINT fk_games_developer
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
        ON DELETE CASCADE
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE games_genres (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    genre_id INT NOT NULL,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_game_genre
        UNIQUE (game_id, genre_id)
);
--2.VERİ EKLEME İŞLEMİ--
INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland','2002'),
('Rockstar Games', 'USA', '1998'),
('Bethesda', 'USA', '2001'),
('Ubisoft', 'France', '1986'),
('Valve', 'USA', '1996');
INSERT INTO genres (name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'Open world exploration'),
('Horror', 'Scary and suspenseful gameplay'),
('FPS', 'First Person Shooter'),
('Sports', 'Sports based games');
INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 799.99, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 999.99, '2020-12-10', 8.0, 1),
('GTA V', 899.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 1099.99, '2018-10-26', 9.8, 2),
('Skyrim', 499.99, '2011-11-11', 9.4, 3),
('DOOM Eternal', 699.99, '2020-03-20', 9.0, 3),
('Assassins Creed Valhalla', 899.99, '2020-11-10', 8.7, 4),
('FIFA 23', 599.99, '2022-09-30', 8.1, 4),
('Half-Life 2', 299.99, '2004-11-16', 9.6, 5),
('Counter-Strike 2', 0.00, '2023-09-27', 8.9, 5)
INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),        -- The Witcher 3 → RPG, Open World
(2, 1), (2, 2),        -- Cyberpunk 2077
(3, 2),                -- GTA V
(4, 2),                -- RDR 2
(5, 1),                -- Skyrim
(6, 4),                -- DOOM Eternal
(7, 1), (7, 2),        -- AC Valhalla
(8, 5),                -- FIFA 23
(9, 4),                -- Half-Life 2
(10, 4);               -- CS2

--GÜNCELLEME VE SİLME---
--Tüm oyunların fiyatını %10 düşüren bir güncelleme sorgusu yazın
--update sorgusu--
SELECT*FROM developers
SELECT*FROM games
select*from games_genres
select*from genres
Update games set price=price* 0.90    
--Bir oyunun puanını (rating) güncelleyin (Örn: 8.5'i 9.0 yapın).
update games set rating= 9.0 where id=1 
--: Veritabanından bir oyunu tamamen silin. 
DELETE FROM games where id=1
--RAPORLAMA İŞLEMLERİ--
-- Oyunun adı, Fiyatı ve Geliştirici Firmanın Adını yan yana getirin 
select title,price,company_name,country
from games 
INNER JOIN developers on developer_id=developer_id
order by price asc
--Sadece "RPG" türündeki oyunların adını ve puanını listeleyin 
SELECT name,title,price,rating
FROM games
INNER JOIN games_genres ON games.id = games_genres.game_id
INNER JOIN genres on games_genres.genre_id=genres.id
where name='RPG'
order by price desc
-- Fiyatı 500 TL üzerinde olan oyunları pahalıdan ucuza doğru sıralayın.
select*
from games
where price>500
order by price desc
--: İçinde "er" kelimesi geçen oyunları bulun 
select*
from games
where title ilike('%er%')
