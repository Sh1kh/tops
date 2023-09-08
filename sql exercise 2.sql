/*-----------------------------------------PieceDb--------------------------*/


use piece_db;

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);






-- 5.1 Select the name of all the pieces. 
select name from pieces;

-- 5.2  Select all the providers' data. 
select * from providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).

select code, avg(price) from pieces
 join provides on
 pieces.code = provides.piece
 group by code;
 
 
-- 5.4  Obtain the names of all providers who supply piece 1.
select providers.name, piece from providers 
join provides on providers.code = provides.provider
where piece = 1
;
-- 5.5 Select the name of pieces provided by provider with code "HAL".

select name, provider from pieces 
join provides on
 pieces.code = provides.piece
 having provider ="HAL";

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece 
-- and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------

select pieces.name as piece_name, max(price) as expensive,providers.name as provider_name
 from pieces
join provides on
 pieces.code = provides.piece
join providers on providers.code = provides.provider
group by pieces.name
;

-- 5.7 Add an entry to the database to indicate that
-- "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'TNBC',7);

-- 5.8 Increase all prices by one cent.


update provides set price= price + 1 ;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).


delete from  Provides where provider = "RBT" and piece =4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." 
-- (code "RBT") will not supply any pieces 

    -- (the provider should still remain in the database).
delete from  Provides where provider = "RBT";




/*---------------------------------------------versiondb-------------------------*/


use version;
select * from data;

-- 9.1 give the total number of recordings in this table
select count(*) from data;

-- 9.2 the number of packages listed in this table?
select count(package)as package from data;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(package) from data
 where package ='Rcpp';

-- 9.4 How many recordings are from China ("CN")?

select * from data where country ='cn';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package, count(package)as download
 from data group by package
 order by download desc;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package, count(package)as download 
from data group by package ;
select * from data;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select country, count(country) as recording
 from data where country ='jp'
 or country ='cn' or country ='sg' group by country;

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")

select country,count(*) A
 from data
 group by package
 having count(*)> A;

-- 9.9 Print the1 average length of the package name of all the UNIQUE packages
select distinct package, avg(length( package)) 
as avg_length from data
group by package;



-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select package, count(*) as downloading_count from data 
group by package
order by  downloading_count desc
 limit 2;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package
 from data
 group by package
 having count(*)>1000 ;
 
-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have
    -- (ignore version number), the relevant counts, and the proportion (in percentage).
    
   
   