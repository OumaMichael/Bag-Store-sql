-- Insert sample publishers
INSERT INTO publishers (name, address, phone, email) VALUES
('Penguin Random House', '1745 Broadway, New York, NY 10019', '+1-212-782-9000', 'info@penguinrandomhouse.com'),
('HarperCollins', '195 Broadway, New York, NY 10007', '+1-212-207-7000', 'contact@harpercollins.com'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '+1-212-698-7000', 'info@simonandschuster.com');

-- Insert sample authors
INSERT INTO authors (first_name, last_name, birth_date, nationality, biography) VALUES
('George', 'Orwell', '1903-06-25', 'British', 'Eric Arthur Blair, known by his pen name George Orwell, was an English novelist, essayist, journalist and critic.'),
('J.K.', 'Rowling', '1965-07-31', 'British', 'Joanne Rowling, better known by her pen name J. K. Rowling, is a British author and philanthropist.'),
('Stephen', 'King', '1947-09-21', 'American', 'Stephen Edwin King is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels.');

-- Insert sample books
INSERT INTO books (title, isbn, publication_year, edition, category, publisher_id, shelf_location, status) VALUES
('1984', '9780451524935', 1949, '1st', 'Dystopian Fiction', 1, 'A12', 'Available'),
('Animal Farm', '9780451526342', 1945, '1st', 'Political Satire', 1, 'A13', 'Available'),
('Harry Potter and the Philosopher''s Stone', '9780747532743', 1997, '1st', 'Fantasy', 2, 'B05', 'Available'),
('The Shining', '9780307743657', 1977, '1st', 'Horror', 3, 'C08', 'Available');

-- Link books to authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), -- 1984 by George Orwell
(2, 1), -- Animal Farm by George Orwell
(3, 2), -- Harry Potter by J.K. Rowling
(4, 3); -- The Shining by Stephen King

-- Insert sample members
INSERT INTO members (first_name, last_name, email, phone, membership_date, status) VALUES
('John', 'Doe', 'john.doe@email.com', '555-1234', '2023-01-15', 'Active'),
('Jane', 'Smith', 'jane.smith@email.com', '555-5678', '2023-02-20', 'Active'),
('Robert', 'Johnson', 'robert.j@email.com', '555-9012', '2023-03-10', 'Active');

-- Insert sample borrowing transactions
INSERT INTO borrowing_transactions (book_id, member_id, borrow_date, due_date, return_date, status) VALUES
(1, 1, '2023-10-01', '2023-10-15', '2023-10-14', 'Returned'),
(3, 2, '2023-10-05', '2023-10-19', NULL, 'Active'),
(4, 3, '2023-10-03', '2023-10-17', NULL, 'Active');