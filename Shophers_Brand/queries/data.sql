-- Shophers is an African female clothing brand located in Lagos Nigeria. They opened their online store in Febraruay 2023 and would like to get insights from the first month. 

-- -----------------------
--   CREATE TABLE SCHEMA
-- -----------------------
CREATE SCHEMA shophers

-- -------------------
--   CREATE TABLES
-- -------------------

-- Category --
CREATE TABLE shophers.category (
    id int IDENTITY(2001,1) NOT NULL,
    name nvarchar(50)
    CONSTRAINT PK_category_id PRIMARY KEY (id)
)


-- Clothing Items --
CREATE TABLE shophers.items (
    id int IDENTITY(1001,1) NOT NULL,
    name nvarchar(50),
    price smallmoney,
    currency nvarchar(3),  
    category_id int,
    photo_url nvarchar(200),
    has_discount nvarchar(10),
    description nvarchar(250),
    rating int,
    CONSTRAINT PK_item_id PRIMARY KEY (id),
    CONSTRAINT FK_category_id FOREIGN KEY (category_id)
        REFERENCES shophers.category (id)
)


-- Customers --
CREATE TABLE shophers.customers (
    id int IDENTITY(3001,1) NOT NULL,
    name nvarchar(250),
    email nvarchar(50),
    CONSTRAINT PK_customer_id PRIMARY KEY (id),
)


-- Orders --
CREATE TABLE shophers.orders (
    id int IDENTITY(4001, 1) NOT NULL,
    item_id int,
    category_id int,
    customer_id int,
    date datetime,
    quantity int,
    total_price smallmoney,
    city nvarchar(50),
    country nvarchar(50),
    CONSTRAINT PK_order_id PRIMARY KEY (id),
    CONSTRAINT FK_ordercategory_id FOREIGN KEY (category_id)
        REFERENCES shophers.category (id),
    CONSTRAINT FK_customer_id FOREIGN KEY (customer_id)
        REFERENCES shophers.customers (id)
)


-- -----------------------------
--    INSERT DATA INTO TABLES
-- -----------------------------

-- PRODUCT CATEGORIES
INSERT INTO 
    shophers.category (
        name
    )
VALUES
    ('Co-ords'),
    ('Maxis'),
    ('Skirts'),
    ('Tops'),
    ('Dresses')



-- ITEMS
INSERT INTO 
    shophers.items (
        name,
        price,
        currency,
        category_id,
        photo_url,
        description,
        rating
    )
VALUES
    ('Ada''s set', 60.29, 'USD', 2001, 'https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njl8fHR3byUyMHBpZWNlJTIwZHJlc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60', 'Red poka-dots two piece blouse and skirt', 5),
    ('TG skirt', 23.79, 'USD', 2003, 'https://images.unsplash.com/photo-1561932850-f13404855e53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNraXJ0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'That girl yellow skirt', 3),
    ('Minas dress', 100.50, 'USD', 2005, 'https://images.unsplash.com/photo-1551803091-e20673f15770?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fGNyb2NoZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60', 'Blue knitted picnic dress', 4),
    ('Retro TP', 125.00, 'USD', 2001, 'https://images.unsplash.com/photo-1584998316204-3b1e3b1895ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHNraXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60', 'Grey two-piece set', 5),
    ('Sapphire M', 99.98, 'USD', 2002, 'https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBhdHRlcm4lMjBkcmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Flower patterned maxi dress', 5),
    ('Work girl CO', 79.19, 'USD', 2001, 'https://images.unsplash.com/flagged/photo-1574877164014-e48c5a4b7e5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGJsb3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Sage green satin-like top with checkered trouser', 4),
    ('Syre', 50.00, 'USD', 2004, 'https://images.unsplash.com/photo-1612889002991-fbfaf775d231?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJsb3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Champagne gold satin long-sleeve blouse', 4),
    ('KnitU Cardigan', 120.69, 'USD', 2004, 'https://images.unsplash.com/photo-1516810773736-19a71ee11dab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGtuaXR3ZWFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60', 'Orange-cream hand knitted cardigan', 3),
    ('Metallic Sinda Skirt', 50.00, 'USD', 2003, 'https://images.unsplash.com/photo-1604075545151-1fe89e2f406f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA1fHxza2lydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Black leather', 3),
    ('Farmgirl denim', 98.69, 'USD', 2005, 'https://images.unsplash.com/photo-1591369822096-ffd140ec948f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAyfHxKRUFOU3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Farmgirl style denim dress', 3),
    ('Ly skorts', 39.00, 'USD', 2003, 'https://images.unsplash.com/photo-1630643003424-f179381f0561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njl8fGJsb3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Cotton skorts', 5),
    ('B.Shower M', 76.66, 'USD', 2002, 'https://images.unsplash.com/photo-1534237595178-0e961584ce73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHBhdHRlcm4lMjBkcmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Pink maxi dress', 2),
    ('Mila''s Print', 22.99, 'USD', 2001, 'https://images.unsplash.com/photo-1603343494107-0b2c428ff9b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzh8fGJsb3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60', 'Leopard print blouse with tie', 4)



-- CUSTOMERS
INSERT INTO 
    shophers.customers (
        name,
        email
    )
VALUES
    ('Shila Koumans', 'shilakoumas@sk.com'),
    ('Ebele Abrahamsen', 'ebeleabrahamsen@ea.com'),
    ('Alma Dreier', 'almadreier@ad.com'),
    ('Tullia Lohrenz', 'tullialohrenz.tl.com'),
    ('Camilla Rose', 'camillarose@cr.com'),
    ('Prudence Russo', 'prudencerisso@pr.com'),
    ('Barnabé Leslie', 'barnabeleslie@bl.com'),
    ('Tochukwu Irving', 'tochukwuirving@ti.com'),
    ('Nekesa Taurai', 'nekesataurai@nt.com')



-- ORDERS
INSERT INTO 
    shophers.orders (
        item_id,
        category_id,
        customer_id,
        date,
        quantity,
        total_price,
        city,
        country
    )
VALUES
    (1004, 2001, 3005, '2023-02-02 12:35:10:999', 2, 250.00, 'Abuja', 'Nigeria' ),
    (1007, 2004, 3005, '2023-02-02 12:40:43:124', 1, 50.00, 'Abuja', 'Nigeria' ),
    (1011, 2003, 3001, '2023-02-10 07:13:01:87', 1, 50.00, 'Johannesburg', 'South Africa' ),
    (1001, 2001, 3001, '2023-02-10 07:35:10:17', 3, 180.87, 'Johannesburg', 'South Africa' ),
    (1012, 2002, 3009, '2023-02-10 14:00:00:03', 1, 76.66, 'Lagos', 'Nigeria' ),
    (1009, 2003, 3002, '2023-02-13 01:46:24:73', 1, 50.00, 'Lagos', 'Nigeria' ),
    (1004, 2001, 3006, '2023-02-13 06:09:45:673', 1, 125.00, 'Lagos', 'Nigeria' ),
    (1004, 2001, 3008, '2023-02-13 09:55:35:521', 1, 125.00, 'Port-Harcort', 'Nigeria' ),
    (1008, 2004, 3003, '2023-02-13 15:26:13:101', 1, 120.69, 'Johannesburg', 'South Africa' ),
    (1010, 2005, 3004, '2023-02-13 21:44:46:11', 1, 98.69, 'Kumasi', 'Ghana' ),
    (1013, 2001, 3004, '2023-02-13 22:01:00:168', 2, 45.98, 'Kumasi', 'Ghana' ),
    (1002, 2003, 3006, '2023-02-14 11:38:40:18', 1, 23.79, 'Lagos', 'Nigeria' ),
    (1003, 2005, 3008, '2023-02-20 21:51:25:199', 2, 100.50, 'Port-Harcort', 'Nigeria' ),
    (1006, 2001, 3007, '2023-02-20 22:45:55:93', 1, 79.19, 'Accra', 'Ghana' ),
    (1005, 2002, 3008, '2023-02-27 13:00:31:343', 4, 399.92, 'Port-Harcort', 'Nigeria' ),
    (1007, 2004, 3002, '2023-02-27 18:47:00:291', 2, 100.00, 'Lagos', 'Nigeria' ),
    (1011, 2003, 3001, '2023-02-27 18:47:00:291', 3, 150.00, 'Johannesburg', 'South Africa' )

