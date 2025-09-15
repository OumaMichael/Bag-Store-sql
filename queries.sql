-- Query 1: Find all books currently borrowed
SELECT 
    b.title, 
    CONCAT(m.first_name, ' ', m.last_name) AS borrower_name,
    t.borrow_date, 
    t.due_date
FROM borrowing_transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.return_date IS NULL;

-- Query 2: Find books by a specific author
SELECT 
    b.title, 
    b.publication_year,
    p.name AS publisher,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name
FROM books b
JOIN book_authors ba ON b.book_id = ba.book_id
JOIN authors a ON ba.author_id = a.author_id
JOIN publishers p ON b.publisher_id = p.publisher_id
WHERE a.last_name = 'Orwell';

-- Query 3: Calculate total fines for each member
SELECT 
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    SUM(f.amount - f.paid_amount) AS outstanding_balance
FROM fines f
JOIN borrowing_transactions t ON f.transaction_id = t.transaction_id
JOIN members m ON t.member_id = m.member_id
WHERE f.status != 'Paid'
GROUP BY m.member_id;