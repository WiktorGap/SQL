
INSERT INTO Books (title, description, publishing_year, numbers_of_books, publishing_house_id, category_id)
VALUES 
    ('Władca Pierścieni: Drużyna Pierścienia', 'Fantastyczna powieść o podróży hobbita Froda Bagginsa, mającej na celu zniszczenie Jedynego Pierścienia.', '1954', '5', '1', '1'),
    ('Harry Potter i Kamień Filozoficzny', 'Pierwsza część serii o młodym czarodzieju Harrym Potterze, który odkrywa swoje magiczne dziedzictwo.', '1997', '7', '2', '2'),
    ('Zbrodnia i Kara', 'Klasyczna powieść rosyjskiego pisarza Fiodora Dostojewskiego, opowiadająca o psychologicznych skutkach popełnienia zbrodni.', '1866', '3', '3', '3'),
    ('1984', 'Antyutopijna powieść George\'a Orwella, opisująca totalitarny reżim i manipulację masami.', '1949', '4', '4', '4'),
    ('To', 'Przerażająca powieść Stephena Kinga o złowieszczym klaunie, który terroryzuje małe miasteczko.', '1986', '6', '5', '5'),
    ('Mistrz i Małgorzata', 'Klasyczna powieść Bułhakowa, łącząca elementy groteski, satyry i filozofii.', '1967', '2', '6', '6'),
    ('Duma i Uprzedzenie', 'Romantyczna powieść Jane Austen, opowiadająca o miłości i klasowych uprzedzeniach w XIX wieku.', '1813', '8', '7', '7'),
    ('Mały Książę', 'Niezwykła opowieść Antoine\'a de Saint-Exupéry\'ego o małym księciu, który podróżuje między planetami.', '1943', '5', '8', '8'),
    ('Wichrowe Wzgórza', 'Klasyczna powieść Emily Brontë o namiętnej miłości i tragicznych losach dwóch rodzin na pustkowiach Anglii.', '1847', '3', '9', '9'),
    ('Makbet', 'Tragedia szekspirowska opowiadająca historię ambitnego szkockiego lorda, który dopuszcza się krwawych czynów, aby osiągnąć władzę.', '1606', '5', '10', '10');

INSERT INTO Elementary_books (book_id, library_id, status_id, wear)
VALUES 
    ('1', '1', '1', 'Bardzo dobry'),
    ('2', '2', '1', 'Dobry'),
    ('3', '3', '1', 'Średni'),
    ('4', '4', '1', 'Bardzo dobry'),
    ('5', '5', '1', 'Dobry'),
    ('6', '6', '1', 'Nowy'),
    ('7', '7', '1', 'Bardzo dobry'),
    ('8', '8', '1', 'Dobry'),
    ('9', '9', '1', 'Średni'),
    ('10', '10', '1', 'Bardzo dobry');


INSERT INTO Rents (user_id, elementary_book_id, rent_date, return_date, rental_time)
VALUES 
    ('1', '1', '2024-04-07', '2024-04-14', '7'),
    ('2', '2', '2024-04-07', '2024-04-21', '14'),
    ('3', '3', '2024-04-07', '2024-04-28', '21'),
    ('4', '4', '2024-04-07', '2024-04-14', '7'),
    ('5', '5', '2024-04-07', '2024-04-14', '7'),
    ('6', '6', '2024-04-07', '2024-04-14', '7'),
    ('7', '7', '2024-04-07', '2024-04-14', '7'),
    ('8', '8', '2024-04-07', '2024-04-14', '7'),
    ('9', '9', '2024-04-07', '2024-04-14', '7'),
    ('10', '10', '2024-04-07', '2024-04-14', '7');


 INSERT INTO Users (name, email, phone_number, status_id, indeks)
 VALUES
     ('Jan Kowalski', 'jan.kowalski@example.com', '123456789', '1', '123456'),
     ('Anna Nowak', 'anna.nowak@example.com', '987654321', '1', '654321'),
     ('Adam Wiśniewski', 'adam.wisniewski@example.com', '567890123', '1', '456789'),
     ('Maria Lewandowska', 'maria.lewandowska@example.com', '098765432', '1', '987654'),
     ('Piotr Duda', 'piotr.duda@example.com', '345678901', '1', '345678'),
     ('Katarzyna Wójcik', 'katarzyna.wojcik@example.com', '678901234', '1', '678901'),
     ('Michał Kowalczyk', 'michal.kowalczyk@example.com', '210987654', '1', '210987'),
     ('Alicja Mazur', 'alicja.mazur@example.com', '543210987', '1', '543210'),
     ('Robert Jankowski', 'robert.jankowski@example.com', '891234567', '1', '891234'),
    ('Karolina Szymańska', 'karolina.szymanska
