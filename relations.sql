----- Отношение один ко многим  (в текущей таблице) 1 -> 1 , 1 , 1 (в другой таблице)  ------------------------------------------------------------------------------

CREATE TABLE book (
    book_id INT PRIMARY KEY,
	title_book VARCHAR(255) NOT NULL,
	ISBN VARCHAR(30) NOT NULL,
    fk_publisher_id INT NOT NULL REFERENCES publisher(publisher_id)
);

CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY,
	name_library VARCHAR(255) NOT NULL,
	adress VARCHAR(255) NOT NULL
);

----- Отношение один к одному  (в текущей) 1 -> 1 (в другой таблице)   ------------------------------------------------------------------

CREATE TABLE book (
    book_id INT PRIMARY KEY,
	title_book VARCHAR(255) NOT NULL,
	ISBN VARCHAR(30) NOT NULL,
    fk_publisher_id INT UNIQUE NOT NULL REFERENCES publisher(publisher_id)
);

CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY,
	name_library VARCHAR(255) NOT NULL,
	adress VARCHAR(255) NOT NULL
);

----- Отношение многие ко многим  (текущая) 1,2,3 + (другая) 1,2,3 -> (тертья таблица) 1,2,3 - 1,2,3  ----------------------------------------------------

CREATE TABLE book (
    book_id INT PRIMARY KEY,
	title_book VARCHAR(255) NOT NULL,
	ISBN VARCHAR(30) NOT NULL
);

CREATE TABLE publisher(
	publisher_id INT PRIMARY KEY,
	name_library VARCHAR(255) NOT NULL,
	adress VARCHAR(255) NOT NULL
);

-- создаеться третья таблица из внешними ключами из етих двох таблиц
CREATE TABLE book_publisher(
    book_id INT REFERENCES book(book_id),
    publisher_id INT REFERENCES publisher(publisher_id),
    CONSTRAINT book_publisher_pkey PRIMARY KEY (book_id,publisher_id)
);


----- Заповлнение Таблиц -------------------------------------------------------------------

INSERT INTO BOOK VALUES
(1,'Name_Book_1','3950281'),
(2,'Name_Book_2','3950281'),
(3,'Name_Book_3','3950281'),
(4,'Name_Book_4','3950281'),
(5,'Name_Book_5','3950281');


INSERT INTO publisher VALUES 
(1, 'Name_Library_1','NY'),
(2, 'Name_Library_2','Washington'),
(3, 'Name_Library_3','Chicago'),
(4, 'Name_Library_4','Miami'),
(5, 'Name_Library_5','Los Angeles');





















