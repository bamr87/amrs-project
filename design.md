# Accounting and Management Reporting System (AMRS)

## Overview

The AMRS is a modular, standalone accounting solution designed to seamlessly integrate with ERP systems or operate independently for SMBs. It offers robust, secure, and scalable financial management features through RESTful APIs, designed with Django, PostgreSQL, and frontend compatibility (Bootstrap 5 and optionally React).

---

## System Architecture

### Technology Stack

* **Backend:** Python, Django, Django REST Framework
* **Frontend:** Bootstrap 5, React-compatible
* **Database:** PostgreSQL
* **Containerization:** Docker, Docker Compose
* **Documentation:** Swagger, Redoc
* **Security:** OAuth2, JWT, Role-based Access
* **Testing:** Pytest, Django Test Framework

---

## Core Modules

### 1. Authentication & Authorization

* **Methods:** JWT, OAuth2
* **Roles:** Admin, Accountant, Viewer, Auditor
* **Audit Logging:** Comprehensive audit trails for security

### 2. Chart of Accounts (COA)

* **Structure:** Hierarchical tree (Assets, Liabilities, Equity, Revenue, Expenses)
* **Fields:** code, name, account\_type, is\_active, parent\_account

### 3. Journal Entries

* **Header:** entry\_number, date, description, status, created\_by
* **Lines:** account linkage, debit/credit amounts, reference documents (enforces double-entry accounting)

### 4. Transactions API

* **Capabilities:** Read-only access, filtering by date, account, and amounts

### 5. Invoices & Payments

* **Invoices:** invoice\_number, customer/vendor, due\_date, status, totals, line\_items
* **Payments:** payment\_reference, amount, payment\_method, linked\_invoice
* **Functionality:** Supports AR/AP management

### 6. Reports Module

* **Types:** Balance Sheet, Profit & Loss, Trial Balance, General Ledger, AR/AP Aging
* **Technical:** Optimized Django ORM queries, optional async job management

---

## Integration Design

### RESTful API Endpoints

* `/api/accounts/`
* `/api/journal-entries/`
* `/api/invoices/`
* `/api/payments/`
* `/api/reports/trial-balance/`

**Features:** Token-based auth, rate limiting, pagination, search/filtering

### ERP Connector Layer

* **Incoming Data:** Sales, Purchases, Inventory adjustments
* **Outgoing Data:** Trial balance synchronization, cost reporting
* **Mechanisms:** Webhooks, Django signals

---

## UI/UX Design

* **Dashboard:** Visual KPIs (Cash balances, AR aging summaries)
* **COA:** Editable hierarchical tree structure
* **Journal Entries:** Step-by-step wizard with validations
* **Invoices:** User-friendly creation, sending, payment tracking
* **Reports:** Tabbed layout with PDF and Excel export

---

## Deployment Design

### Docker Compose Structure

* **web:** Django backend
* **db:** PostgreSQL database
* **worker:** Celery tasks (report generation, notifications)
* **nginx:** Reverse proxy, static file serving

### Environment Management

* `.env` configuration for dev, test, and prod environments

---

## Testing Plan

* **Unit Tests:** Model, view, serializer validations
* **Integration Tests:** End-to-end testing of reports and transactions
* **API Tests:** Comprehensive Postman collections

---

## Roadmap

| Phase | Features                                           |
| ----- | -------------------------------------------------- |
| MVP   | Authentication, COA, Journal Entries, P\&L         |
| v1.1  | Invoicing, Payments, General Ledger, Trial Balance |
| v1.2  | AR/AP Aging Reports, ERP Integration APIs          |
| v1.3  | Role-based Dashboards, Enhanced Filters            |
| v1.4  | Report Exports, Scheduled Task Management          |
