# chat AI

A Rails-based AI assistant for bug reporting, feature submission, and grooming support. This app integrates with OpenAI and provides both an API and web interface. Secured via OAuth using Doorkeeper and Dockerized for isolated local development.

---

## 🚀 Features

- 🧠 AI-powered assistant via OpenAI (supports GPT-3.5 or GPT-4o)
- 💬 Chat-based bug/feature reporting system
- 📌 Integration-ready with Monday.com or other task systems
- 🔐 Internal OAuth2 provider via Doorkeeper
- 🐳 Full Docker support
- 🔄 Auto-seed OAuth client + create DB on startup

---

## 📦 Stack

- **Backend:** Ruby on Rails (API + Hotwire)
- **AI:** OpenAI GPT API (`ruby-openai`)
- **Auth:** Doorkeeper OAuth 2.0
- **DB:** PostgreSQL
- **Cache:** Redis
- **Containerization:** Docker + Docker Compose

---

## 🛠 Setup Instructions

### 🔧 1. Clone and Configure

```bash
git clone https://github.com/your-org/chat_ai.git
cd chat_ai
cp .env.example .env

MONDAY_API_KEY=your_token
OPENAI_API_KEY=your_openai_key
OPENAI_MODEL=gpt-4o
REDIS_URL=redis://redis:6379/1
OAUTH_CLIENT_ID=client_id
OAUTH_CLIENT_SECRET=secret
DATABASE_HOST=db
DATABASE_USERNAME=username
DATABASE_PASSWORD=pwd


docker-compose down --volumes --remove-orphans
docker-compose up --build
