CREATE DATABASE my_tab(

    my_id INT PRIMARY KEY -- создание и писвоение первичного ключа
    
    my_id INT
    PRIMARY KEY (my_id) -- присвоение внешнего ключа (колонка заранее созданая)


    my_foreign_key INT REFERENCES my_tab2 (my_id2) -- создание и писвоение внешнего ключа
    
    my_foreign_key INT
    FOREIGN KEY (my_foreign_key) REFERENCES my_tab2(my_id2) -- только присвоение внешнего ключа (колонка уже заранее созданая)
    

    my_value1 INT NULL -- можно передавать занчение NULL
    my_value2 INT NOT NULL -- нельзя перевавать NULL
    my_value3 INT UNIQUE -- может ханить только уникальныне значения
    мy_value4 INT DEFAULT 3 -- если не указываее значение, тогда ставить значение по умолчанию
    my_value5 INT CHECK my_value > 5 -- вписыват значение, если условие TRUE
    

    my_value6 CONSTRAINT my_name PRIMARY KEY 
    CONSTRAINT my_name PRIMARY KEY ( my_value6 )  -- создаеться название для ограничения (нужно передвать колонку)
);