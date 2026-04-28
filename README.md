# Calendar Booking

## Hexlet tests and linter status

[![Actions Status](https://github.com/AfifeAblyakimova/ai-for-developers-project-386/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AfifeAblyakimova/ai-for-developers-project-386/actions)

API-контракт описан в `main.tsp`. Фронтенд находится в `frontend/` и работает только через HTTP API по этому контракту.

Перед запуском используйте версию Node из `.nvmrc`:

```bash
nvm use
npm install
npm run backend:dev
```

Команда `backend:dev` запускает реальный API с хранением данных в памяти на `http://localhost:3000`.
После перезапуска сервиса созданные типы событий и бронирования сбрасываются.

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

Команда `mock:api` остается доступной для проверки контракта через Prism: она генерирует OpenAPI из TypeSpec и запускает mock API на `http://127.0.0.1:3000`.
