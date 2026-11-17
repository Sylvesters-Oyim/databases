# pharmacy-db

A small relational database for a community pharmacy: patients, prescribers, drugs, prescriptions and gene-drug links. Built while studying databases.
ALL people in the data are invented


## What it shows
- A schema in third normal form with primary keys, foreign keys and CHECK constraints
- Queries: joins, grouping, common table expressions, window functions
- A python function that dispenses a drug inside one transaction


## Run it
    sqlite3 pharmacy.db < schema.sql
    sqlite3 pharmacy.db < seed.sql
    sqlite3 pharmacy.db < queries/02_joins.sql

## Design
see docs/design.md for the entity-relationship diagram and the normalisation steps.

## Tools
SQLite 3, PostgreSQL, Python 3