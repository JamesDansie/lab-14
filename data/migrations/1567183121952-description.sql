-- This query will make a second table called bookshelves.
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- this will pull unique bookshelves names in to the new bookshelf table
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- this will add a bookshelf id to the books table
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- This will connect the two tables using the id from bookshelves to replace the bookshelves in books
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- this removes the bookshelf column from books table
ALTER TABLE books DROP COLUMN bookshelf;

-- this links up the bookshelf id as a foreign key so the tables are linked
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
