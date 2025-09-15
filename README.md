# Library Management System - SQLite3 Implementation

This project implements a complete Library Management System database using SQLite3.

## Database Schema

The database includes the following tables:
- `members` - Library members information
- `authors` - Book authors
- `publishers` - Book publishers
- `books` - Book inventory
- `book_authors` - Many-to-many relationship between books and authors
- `borrowing_transactions` - Book borrowing records
- `fines` - Fine records for overdue books

## Prerequisites

- SQLite3 installed on your system
- Basic knowledge of SQL commands

## Installation

1. Clone or download this repository
2. Navigate to the project directory

## Setup Instructions

### Method : Run the complete setup script

```bash
# Create and initialize the database
sqlite3 library_management.db < library_database.sql
sqlite3 library_management.db < sample_data.sql
```



## File Structure

- `schema.sql` - Database schema definition
- `sample_data.sql` - Sample data for testing
- `queries.sql` - Example queries
- `setup_database.sql` - Complete setup script (schema + sample data)

## Example Queries

Run queries from the command line:
```bash
sqlite3 library_management.db < queries.sql
```

Or interactively:
```bash
sqlite3 library_management.db
sqlite> .read queries.sql
```

## Common SQLite3 Commands

| Command | Description |
|---------|-------------|
| `sqlite3 database.db` | Open/Create database |
| `.tables` | List all tables |
| `.schema table_name` | Show table structure |
| `.mode column` | Set output to column mode |
| `.headers on` | Show column headers |
| `.quit` | Exit SQLite3 |
| `.read filename.sql` | Execute SQL from file |

## Sample Usage

1. Check all available books:
```sql
SELECT book_id, title, status FROM books WHERE status = 'Available';
```

2. Find books borrowed by a specific member:
```sql
SELECT b.title, t.borrow_date, t.due_date 
FROM borrowing_transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE m.first_name = 'John' AND m.last_name = 'Doe';
```

3. Calculate total fines for each member:
```sql
SELECT m.member_id, m.first_name, m.last_name, 
       SUM(f.amount - f.paid_amount) AS outstanding_balance
FROM fines f
JOIN borrowing_transactions t ON f.transaction_id = t.transaction_id
JOIN members m ON t.member_id = m.member_id
WHERE f.status != 'Paid'
GROUP BY m.member_id;
```

## Notes

- SQLite3 doesn't support ENUM types natively, so we've used TEXT with CHECK constraints
- The AUTO_INCREMENT feature in MySQL is replaced with AUTOINCREMENT in SQLite
- SQLite uses dynamic typing, so some data type differences exist compared to MySQL

## Troubleshooting

If you encounter any issues:
1. Delete the database file: `rm library_management.db`
2. Restart the setup process

For SQL syntax errors, check the SQLite documentation as some MySQL features may not be supported.

## License

This project is for educational purposes.