### Hexlet tests and linter status:
[![Actions Status](https://github.com/AfifeAblyakimova/ai-for-developers-project-386/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AfifeAblyakimova/ai-for-developers-project-386/actions)

## Calendar Booking

API-контракт описан в `main.tsp`. Фронтенд находится в `frontend/` и работает только через HTTP API по этому контракту.

Перед запуском используйте версию Node из `.nvmrc`:

```bash
nvm use
npm install
npm run mock:api
```

Команда `mock:api` генерирует OpenAPI из TypeSpec и запускает Prism на `http://127.0.0.1:3000`.

В другом терминале запустите фронтенд:

```bash
cd frontend
cp .env.example .env
npm install
npm run dev
```

Основные страницы:

- `http://localhost:5173/booking` — публичная страница для гостя.
- `http://localhost:5173/admin` — админка владельца календаря.