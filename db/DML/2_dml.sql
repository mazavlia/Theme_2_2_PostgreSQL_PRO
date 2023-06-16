INSERT INTO public.authors
(author_id, author_name)
VALUES
(1, 'Пушкин Александр Сергеевич'),
(2, 'Лермонтов Михаил Юрьевич'),
(3, 'Чехов Антон Павлович'),
(4, 'Достоевский Федор Михалович'),
(5, 'Грибоедов Александр Сергеевич');

INSERT INTO public.publish_houses
(publ_house_id, house_name, city)
VALUES
(1, 'Дрофа', 'Москва'),
(2, 'Феникс', 'Ростов-на-Дону'),
(3, 'Просвещение', 'Москва');

INSERT INTO public.books
(book_id, title, author_id, public_year, amount_pages, price, amount, publ_house_id)
VALUES
(1, 'Евгений Онегин', 1, 1997, 260, 199.70, 7, 1),
(2, 'Палата № 6', 3, 2000, 74, 75.99, 2, 3),
(3, 'Преступление и наказание', 4, 1977, 412, 399.99, 3, 2),
(4, 'Мцыри', 2, 1989, 210, 127.99, 1, 1),
(5, 'Недоросль', 5, 1990, 120, 229.00, 4, 3);

INSERT INTO public.readers
(readers_ticket_id, full_name, adress, telephone)
VALUES
(1, 'Иванов Иван Иванович', 'г.Москва, ул.Чкалова, 15-17', '7(922)572-92-92'),
(2, 'Петров Петр Петрович', 'г.Химки, ул. Франкенштейна, 18', '7(929)929-29-29'),
(3, 'Сидоров Сидор Сидорович', 'г.Москва, набережная космонавта Волкова, 22-157', '7(912)572-11-77');

INSERT INTO public.book_rentals
(rent_id, readers_ticket_id, book_id, start_rental, stop_rental)
VALUES
(1, 2, 4, '2023-06-09', '2023-06-16'),
(2, 3, 3, '2023-06-09', NULL),
(3, 1, 5, '2023-06-11', NULL);

