# AMRS (Accounting & Management Reporting System)

A modular, Django-based accounting and financial management system designed to run standalone or integrate seamlessly with larger ERP platforms. AMRS provides core accounting functionality exposed via RESTful APIs, secure authentication, and a modern Bootstrap 5–ready frontend scaffold.

---

## 📦 Technology Stack

* **Backend:** Python 3.11, Django, Django REST Framework
* **Database:** PostgreSQL
* **Authentication:** JSON Web Tokens (JWT) via `djangorestframework-simplejwt`
* **API Docs:** Swagger & ReDoc (`drf-yasg`)
* **Task Queue:** Celery (with Redis or RabbitMQ)
* **Containerization:** Docker & Docker Compose
* **Frontend (Scaffold):** Bootstrap 5 (optional React integration)
* **Testing:** Pytest, Django Test Framework

---

## 🚀 Getting Started

### Prerequisites

* Python 3.11+
* Docker & Docker Compose (for containerized development)
* Git

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/AMRS.git
cd AMRS
```

### 2. (Optional) Local Virtual Environment

```bash
python3.12 -m venv .venv
source .venv/bin/activate
```

### 3. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables

Copy the example env file and update credentials:

```bash
cp .env.example .env
# Edit .env: set POSTGRES_PASSWORD and any secret keys
```

### 5. Start Services with Docker Compose

```bash
docker-compose up --build -d
```

### 6. Apply Migrations & Create Superuser

```bash
docker-compose exec web python manage.py migrate
# (Optional) create admin user
docker-compose exec web python manage.py createsuperuser
```

### 7. Access the Application

* API Root: `http://localhost:8000/`
* Swagger UI: `http://localhost:8000/swagger/`
* ReDoc: `http://localhost:8000/redoc/`
* Admin Panel: `http://localhost:8000/admin/`

---

## 🗂 Project Structure

```
AMRS/                  # Django project settings
├── settings.py
├── urls.py
coa/                   # Chart of Accounts app
journal/               # Journal Entries app
invoices/              # Invoices & Payments app
reports/               # Reporting endpoints app
accounts/              # Authentication & User Roles app
Dockerfile
docker-compose.yml
requirements.txt
README.md
```

---

## 🔌 API Endpoints Overview

| Path                          | Method   | Description                              |
| ----------------------------- | -------- | ---------------------------------------- |
| `/api/auth/login/`            | POST     | Obtain JWT access & refresh tokens       |
| `/api/auth/refresh/`          | POST     | Refresh JWT token                        |
| `/api/coa/accounts/`          | GET/POST | List or create Chart of Accounts entries |
| `/api/journal/entries/`       | GET/POST | List or create Journal Entries           |
| `/api/invoices/invoices/`     | GET/POST | Manage Invoices                          |
| `/api/invoices/payments/`     | GET/POST | Manage Payments                          |
| `/api/reports/trial-balance/` | GET      | Retrieve trial balance report            |

Refer to the Swagger or ReDoc UI for full schema details.

---

## 🛠 Development Workflow

1. **Branching**: Create feature branches (`git checkout -b feature/xyz`).
2. **Committing**: Follow semantic commit messages.
3. **Testing**: Add/Run tests with `pytest` or `manage.py test`.
4. **Documentation**: Update models, serializers, and add API docs via `drf-yasg`.
5. **Code Review**: Open a PR and request reviews before merging.

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and the code of conduct.

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
