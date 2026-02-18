# Workstreams & Timeline

## Overview

Work is divided into 4 parallel streams with dependency checkpoints.
**Integration Order**: DO (Base) -> BE (API) -> FE (UI) -> QA (Verify).

---

## 1. DO (DevOps)

**Goal**: Infrastructure ready.
**Scope**: Root files, Docker, Caddy.
**Timeline**:

- **H0-2**: `docker-compose.yml`. Up: Postgres (5437), MinIO (9007/9008), Adminer (8087).
- **H2-4**: `caddy/Caddyfile`. Reverse proxy pointing to containers.
- **H4-6**: Environment config (`.env.example`) matching `/spec/ports.md`.
- **H6-7**: Persistence verification (volumes) & Health checks.

## 2. BE (Backend)

**Goal**: Functional API & Auth.
**Scope**: `/backend` directory (NestJS).
**Timeline**:

- **H0-2**: Initialize NestJS + Prisma. Connect to DB.
- **H2-4**: **Auth Core**. Login/Refresh endpoints. **Critical**: `httpOnly` cookie `fieldclose_sess`.
- **H4-6**: **Guards & Users**. Global AuthGuard (exclude `/auth/*`). CORS Allowlist (`http://localhost:5177`).
- **H6-7**: OpenAPI/Swagger generation & Error Filter (Standardized JSON errors).

## 3. FE (Frontend)

**Goal**: UI connected to API.
**Scope**: `/frontend` directory (Vite/React).
**Timeline**:

- **H0-2**: Initialize Vite. Port 5177.
- **H2-4**: **API Client**. Axios setup. **Critical**: Implement _single-flight_ refresh token logic.
- **H4-6**: **Auth Context**. Session persistence check logic (call `/auth/me`).
- **H6-7**: Routes (`/auth/login`, `/`). Guarded routes implementation.

## 4. QA (Quality)

**Goal**: Verification of standards.
**Scope**: `/spec` validation, `/e2e`.
**Timeline**:

- **H0-2**: Review `/spec` vs implementation plans. Setup E2E repo.
- **H2-4**: Write test scenarios (Gherkin or distinct steps) for Auth flows.
- **H4-6**: **Security/Standards Check**: Verify Cookie flags, CORS, Error responses.
- **H6-7**: Full E2E smoke test & Sign-off matching `/spec/done.md`.
