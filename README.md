# Database Schema Conversion Project

## Overview
This project converts a MySQL-style factory database schema to an Oracle-compatible schema, following best practices for Oracle database design. The schema models a factory system with tables for factories, machines, workers, and products, and includes sample data for testing.

## Source MySQL Schema
The original MySQL schema consists of four tables:
- **Factory**: Stores factory details (ID, name, location).
- **Machine**: Stores machine details (ID, name, factory ID).
- **Worker**: Stores worker details (ID, name, role, machine ID).
- **Product**: Stores product details (ID, name, machine ID that produces it).

Key features:
- Primary keys use `INT AUTO_INCREMENT`.
- Foreign keys link `Machine` to `Factory`, `Worker` to `Machine`, and `Product` to `Machine`.
- `VARCHAR` for strings, `INT` for IDs.

## Oracle-Compatible Schema Design
### Data Type Conversions
- MySQL `INT AUTO_INCREMENT` → Oracle `NUMBER` with `SEQUENCE` and `TRIGGER`.
- MySQL `INT` (foreign keys) → Oracle `NUMBER`.
- MySQL `VARCHAR(n)` → Oracle `VARCHAR2(n)`.

### Auto-Increment Handling
- Oracle does not support `AUTO_INCREMENT`. Instead, we use:
  - **Sequences**: Generate unique IDs (e.g., `FACTORY_SEQ`).
  - **Triggers**: Populate primary key columns with sequence values during `INSERT`.

### Constraints
- **Primary Keys**: Defined on `xxx_id` columns.
- **Foreign Keys**: Maintained as in MySQL, with dependencies respected.
- **NOT NULL**: Applied to `name` columns.

### Naming Conventions
- Table names are uppercase (e.g., `FACTORY`) for Oracle consistency.
- Column names remain lowercase (e.g., `factory_id`) to match the source schema.

## Files
- **create_tables.sql**: Creates the `FACTORY`, `MACHINE`, `WORKER`, and `PRODUCT` tables with primary and foreign key constraints.
- **create_sequences.sql**: Defines sequences for auto-incrementing primary keys.
- **create_triggers.sql**: Defines triggers to populate primary keys using sequences.
- **insert_data.sql**: Inserts sample data for testing (2 factories, 3 machines, 4 workers, 3 products).

## Execution Instructions
1. Run `create_tables.sql` to create the tables.
2. Run `create_sequences.sql` to create the sequences.
3. Run `create_triggers.sql` to create the triggers.
4. Run `insert_data.sql` to populate the tables with sample data.
5. (Optional) Query the tables to verify the data (e.g., `SELECT * FROM FACTORY;`).

Execute the scripts in Oracle SQL*Plus, SQL Developer, or another Oracle-compatible tool, ensuring the user has sufficient privileges to create tables, sequences, and triggers.

## Sample Data
The `insert_data.sql` file includes:
- 2 factories: North Plant (Chicago, IL), South Plant (Austin, TX).
- 3 machines: CNC Machine A (North Plant), Assembly Line B (North Plant), 3D Printer C (South Plant).
- 4 workers: Alice Smith (Operator), Bob Johnson (Technician), Carol White (Supervisor), David Lee (Operator).
- 3 products: Gearbox, Widget, Gizmo (each linked to a machine).

## Notes
- The schema assumes a basic Oracle setup without specific tablespaces or storage clauses.
- Foreign key constraints require tables to be created in the order: `FACTORY`, `MACHINE`, `WORKER`, `PRODUCT`.
- Triggers check if the primary key is `NULL` before assigning a sequence value, allowing manual ID insertion if needed.
- Sample data respects foreign key constraints and uses triggers for ID generation.

## Future Steps
- Optimize with indexes on foreign keys for large datasets.
- Consider Oracle-specific features like partitioning for scalability.
- Add more complex queries or views for reporting (e.g., production summaries).
