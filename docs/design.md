```mermaid
erDiagram
  PATIENT ||--o{ PRESCRIPTION : receives
  PRESCRIBER ||--o{ PRESCRIPTION : writes
  DRUG ||--o{ PRESCRIPTION : "is dispensed in"
  DRUG ||--o{ DRUG_GENE : "affected by"
```