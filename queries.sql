INSERT INTO Categories(title, allas)
values 
    ('Доски и лыжи', 'boards'),
    ('Крепления', 'attachment'),
    ('Ботинки', 'boots'),
    ('Одежда', 'clothing'),
    ('Инструменты', 'tools'),
    ('Разное', 'other');

INSERT INTO Users(email, username, password)
values
    ('brihmoment@mail.ru', 'Абдул', 'Abdul19578523'),
    ('razbejavshis@gmail.com', 'Сергей', 'qwerty12345'),
    ('prignu@yandex.ru', 'Алексей', 'kj2128siwAl'),
    ('so_skoli@mail.ru', 'Валай', 'ValayBalalay');
			
INSERT INTO Lots(date_create,title,description,image_url, start_price, end_date, bet_step, winner_id, category_id, bet_price, user_id)
values 
    ('2020-03-27 00:00:00', '2014 Rossingnol District Snowboard', 'Описание временно отсутствует', 'img/lot-1.jpg',10999,'2020-03-28 00:00:00',500,2,2,1, 10999),
    ('2020-03-27 00:00:00','DC Ply Mens 2016/2017 Snowboard', 'Легкий маневренный сноуборд, готовый дать жару в любом парке, растопив снег мощным щелчкоми четкими дугами. ', 'img/lot-2.jpg',159999,'2020-03-28 00:00:00',500,2,2,1, 159999),
    ('2020-03-25 00:00:00','Крепления Union Contact Pro 2015 года размер L/XL', 'Описание временно отсутствует', 'img/lot-3.jpg',8000,'2020-03-28 00:00:00',500,1,1,2, 8000),
    ('2020-03-27 00:00:00','Ботинки для сноуборда DC Mutiny Charocal', 'Описание временно отсутствует', 'img/lot-4.jpg',10999,'2020-03-28 00:00:00',500,1,1,3, 10999),
    ('2020-03-25 00:00:00','Куртка для сноуборда DC Mutiny Charocal', 'Описание временно отсутствует', 'img/lot-5.jpg',7500,'2020-03-26 00:00:00',500,1,1,4, 7500),
    ('2020-03-27 00:00:00','Маска Oakley Canopy', 'Описание временно отсутствует', 'img/lot-6.jpg',5400,'2020-03-28 00:00:00',500,3,3,6, 5400);
	
INSERT INTO Bets(bet_date, bet_price, user_id, lot_id)
values
    ('2020-03-27 10:00:00','8600', '2', '3'),
    ('2020-03-27 10:00:00','9400', '3', '3');
	
	
	/*обновление ставки в таблице Lots (на будущее)*/
UPDATE Lots
inner join Bets on Lots.lot_id=Bets.lot_id
set Lots.bet_price=Bets.bet_price
where Bets.bet_price=(select max(bet_price)from Bets);
	
	/*получить все категории;*/
SELECT title from Categories;
/*получить самые новые, открытые лоты*/
SELECT * FROM Lots WHERE end_date>NOW() AND date_create>=SUBDATE(NOW(), 1);
/*показать лот по его id.*/
SELECT *, title FROM Lots INNER JOIN Categories
ON Lots.category_id=Categories.id
WHERE lot_id=2;
/*обновить название лота по его идентификатору*/
UPDATE Lots SET name='Изменение' WHERE lot_id=2;
UPDATE Lots SET name='DC Ply Mens 2016/2017 Snowboard' WHERE lot_id=2;
/*получить список самых свежих ставок для лота по его идентификатору*/
SELECT * FROM Bets WHERE bet_date>=SUBDATE(NOW(), 1) and lot_id=3;
