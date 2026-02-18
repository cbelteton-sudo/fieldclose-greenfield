# Port Configuration

| Service      | Port   | Configuration Location                     | Note                    |
| ------------ | ------ | ------------------------------------------ | ----------------------- |
| **WEB**      | 5177   | `frontend/vite.config.ts`, `frontend/.env` | Vite dev server         |
| **API**      | 4010   | `backend/src/main.ts`, `backend/.env`      | NestJS app              |
| **POSTGRES** | 5437   | `docker-compose.yml`, `backend/.env`       | External mapped port    |
| **MINIO**    | 9007   | `docker-compose.yml`, `backend/.env`       | S3 API                  |
| **CONSOLE**  | 9008   | `docker-compose.yml`                       | MinIO Browser (Console) |
| **ADMINER**  | 8087   | `docker-compose.yml`                       | DB GUI                  |
| **PROD**     | 80/443 | `reverse-proxy/Caddyfile`                  | Production entry point  |
