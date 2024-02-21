----- Отношение один ко многим  (текущая таблица) 1 -> 1 , 1 , 1 (внешняя таблица)  ------------------------------------------------------------------------------

CREATE TABLE book (
    book_id INT PRIMARY KEY,
	title_book VARCHAR(255) NOT NULL,
	ISBN VARCHAR(30) NOT NULL,
    fk_publisher_id INT REFERENCES publisher(publisher_id)
);

CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY,
	name_library VARCHAR(255) NOT NULL,
	adress VARCHAR(255) NOT NULL
);


----- Отношение один к одному  (текущая) 1 -> 1 (внешняя таблица)   ------------------------------------------------------------------














----- Создание Таблиц и их заполнение ---------------------------------------------------------
CREATE TABLE book (
    book_id INT PRIMARY KEY,
	title_book VARCHAR(255) NOT NULL,
	ISBN VARCHAR(30) NOT NULL
);
-- заполнение таблици данными
INSERT INTO BOOK VALUES
(1,'Name_Book_1','3950281'),
(2,'Name_Book_2','3950281'),
(3,'Name_Book_3','3950281'),
(4,'Name_Book_4','3950281'),
(5,'Name_Book_5','3950281');


CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY,
	name_library VARCHAR(255) NOT NULL,
	adress VARCHAR(255) NOT NULL
);

INSERT INTO publisher VALUES 
(1, 'Name_Library_1','NY'),
(2, 'Name_Library_2','Washington'),
(3, 'Name_Library_3','Chicago'),
(4, 'Name_Library_4','Miami'),
(5, 'Name_Library_5','Los Angeles');




-- добавление к таблице колонки, где будут ханиться внешние ключи 
ALTER TABLE book  
ADD COLUMN fk_publisher_id

-- добавляем ограничение в виде внешнего ключа, который ссылаеться на другую таблица и даем название етому ограничению
ALTER TABLE book
ADD CONSTRAINT fk_book_pusliher_id FOREIGN KEY (fk_publisher_id) REFERENCES publisher(publisher_id)






















