
-- SQL script to create the schema for a pizza database and populate it with same records.

DROP TABLE IF EXISTS Likes, Sells, Contains, Customers, Restaurants, Pizzas CASCADE;

CREATE TABLE Pizzas (
	pizza 			TEXT,
	PRIMARY KEY (pizza)
);

CREATE TABLE Restaurants (
	rname 			TEXT,
	area			TEXT,
	PRIMARY KEY (rname)
);

CREATE TABLE Customers (
	cname 			TEXT,
	area			TEXT,
	PRIMARY KEY (cname)
);

CREATE TABLE Sells (
	rname 			TEXT,
	pizza			TEXT,
	price			INTEGER,
	PRIMARY KEY (rname,pizza),
	FOREIGN KEY (rname) REFERENCES Restaurants (rname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Likes (
	cname 			TEXT,
	pizza			TEXT,
	PRIMARY KEY (cname,pizza),
	FOREIGN KEY (cname) REFERENCES Customers (cname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Contains (
	pizza			TEXT,
	ingredient		TEXT,
	PRIMARY KEY (pizza,ingredient),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

INSERT  INTO Pizzas VALUES 
('Diavola'),
('Funghi'),
('Hawaiian'),
('Margherita'),
('Marinanra'),
('Sciliana');

INSERT  INTO Customers VALUES 
('Homer','West'),
('Lisa','South'),
('Maggie','East'),
('Moe','Central'),
('Ralph','Central'),
('Willie','North');

INSERT  INTO Restaurants VALUES 
('Corleone Corner','North'),
('Gambino Oven','Central'),
('Lorenzo Tavern','Central'),
('Mamma''s Place','South'),
('Pizza King','East'),
('NoSell','East');

INSERT  INTO Sells VALUES 
('Corleone Corner','Diavola',24),
('Corleone Corner','Hawaiian',25),
('Corleone Corner','Margherita',19),
('Gambino Oven','Sciliana',16),
('Lorenzo Tavern','Funghi',23),
('Mamma''s Place','Margherita',23),
('Pizza King','Diavola',17),
('Pizza King','Hawaiian',21);

INSERT  INTO Likes VALUES 
('Homer','Hawaiian'),
('Homer','Margherita'),
('Lisa','Funghi'),
('Maggie','Funghi'),
('Moe','Funghi'),
('Moe','Sciliana'),
('Ralph','Diavola');

INSERT  INTO Contains VALUES 
('Diavola','cheese'),
('Diavola','chilli'),
('Diavola','salami'),
('Funghi','ham'),
('Funghi','mushroom'),
('Hawaiian','ham'),
('Hawaiian','pineapple'),
('Margherita','cheese'),
('Margherita','tomato'),
('Marinanra','seafood'),
('Sciliana','anchovies'),
('Sciliana','capers'),
('Sciliana','cheese');


