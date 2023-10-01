use Ювелир;
INSERT INTO material (material_name) VALUES
  ('Золото'),
  ('Серебро');

INSERT INTO rolee (role_name) VALUES
  ('Администратор'),
  ('Покупатель');

INSERT INTO kind (kind_name) VALUES
  ('Кольца'),
  ('Серьги'),
  ('Ожерелья'),
  ('Браслеты');

INSERT INTO manufacturer (manufacturer_name, manufacturer_phone, manufacturer_adress) VALUES
  ('Золотая мастерская', '123-456-789', 'Улица Золотая, 1'),
  ('Серебряный мир', '987-654-321', 'Улица Серебряная, 2');

INSERT INTO userr (userr_name, userr_phone, userr_surname, userr_patronymic, manufacturer_adress, id_role) VALUES
  ('Иван', '111-111-111', 'Иванов', 'Иванович', 'Улица Золотая, 1', 1),
  ('Мария', '222-222-222', 'Петрова', 'Ивановна', 'Улица Серебряная, 2', 2),
  ('Алексей', '333-333-333', 'Сидоров', 'Петрович', 'Улица Золотая, 1', 2);

INSERT INTO product (product_name, product_quantity, product_price, product_description, product_photo, id_kind, id_material, id_manufacturer) VALUES
  ('Золотое кольцо с бриллиантом', 10, 10000, 'Элегантное золотое кольцо с бриллиантом', 'photo1.jpg', 1, 1, 1),
  ('Серебряные серьги', 20, 5000, 'Прекрасные серебряные серьги', 'photo2.jpg', 2, 2, 2),
  ('Изумрудное ожерелье', 5, 15000, 'Изысканное изумрудное ожерелье', 'photo3.jpg', 3, 1, 1);

INSERT INTO ord (manufacturer_datetime, id_userr) VALUES
  ('2023-09-30 14:00:00', 2),
  ('2023-09-30 15:30:00', 3);

INSERT INTO descrition (descrition_quantity, id_product, id_order) VALUES
  (2, 1, 1),
  (1, 3, 2);
  
SET SQL_SAFE_UPDATES = 0;
UPDATE product
SET product_photo = 'https://egelge.com/upload/images/2593_781508_10.jpg'
WHERE product_name = 'Золотое кольцо с бриллиантом';

UPDATE product
SET product_photo = 'https://diamant-online.ru/uploads/shop/94020517.jpg'
WHERE product_name = 'Серебряные серьги';

UPDATE product
SET product_photo = 'https://ae04.alicdn.com/kf/H4f02532b2be643d590c99d71e8957fa60.jpg'
WHERE product_name = 'Изумрудное ожерелье';
SET SQL_SAFE_UPDATES = 1;