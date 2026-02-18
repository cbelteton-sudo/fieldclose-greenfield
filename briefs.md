# Briefs para Agentes

Copia y pega el bloque correspondiente para cada agente/workstream.

---

## 🔒 Contracts Freeze + Ownership

### 🚫 FREEZE (Immutable)

- `/spec/openapi.yaml`
- `/spec/prisma-schema.md`
- `/spec/ports.md`
- `/spec/ui-routes.md`

### 🏠 Ownership (Dueños)

- **DO**: `docker-compose*.yml`, `Caddyfile`, `scripts/*`, `.env*`
- **BE**: `apps/api/*`, `prisma/*`
- **FE**: `apps/web/*`
- **QA**: `tests/*`, `e2e/*`

### 🛡️ PROTOCOL

- **Cross-cutting Changes**: SOLO OA (Orchestrator) aprueba cambios a `/spec/*`.
- **Status Reporting**: Entregar diff/PR pequeño cada **60–90 min** con STATUS:
  - ✅ Succeeded
  - 🔄 In Progress
  - ⛔ Blocked
  - 🧩 Partial
  - ▶️ Starting

---

## DO (DevOps) Brief

**Role**: DO (DevOps)
**Scope**: `docker-compose*.yml`, `Caddyfile`, `scripts/**`, `.env*`, `README*`.
**FORBIDDEN**: Do NOT touch `apps/web`, `apps/api`, `prisma`.

**Fixed Ports**:

- WEB: 5177
- API: 4010
- POSTGRES_HOST: 5437
- MINIO: 9007 (API), 9008 (Console)
- ADMINER: 8087
- PROD: 80/443

**Objective**:

1. **Docker Compose**: Create `docker-compose.dev.yml` and `docker-compose.prod.yml`.
2. **Caddy**: Reverse proxy configuration where routes `/api` -> `api:4010` and `/` -> `web:5177`.
3. **Environment**: Create `.env.example` (root) + document environment variables for apps.
4. **Non-technical Scripts**:
   - `scripts/prod-init.sh`: Wizard for domain/email, TLS, secrets setup.
   - `scripts/prod-up.sh`: `up` + `migrate` + `seed`.
   - `scripts/backup.sh` and `restore.sh`.

**Output**:

- List of touched files.
- Commands to run the setup.
- Verification checklist.

---

## BE (Backend) Brief

**Role**: BE (Backend)
**Scope**: `apps/api/**` and `prisma/**`.
**Follow**: `/spec/openapi.yaml` and `/spec/prisma-schema.md`.

**Fixed Port**:

- API_PORT: 4010 (DO NOT CHANGE)

**Objective**:

1. **Stack**: NestJS + Prisma + Postgres.
2. **Auth**:
   - Refresh token in **httpOnly cookie** (`COOKIE_NAME=fieldclose_sess`).
   - Short-lived access tokens.
   - Refresh token rotation.
3. **CORS**: Enable credentials. Allow origin `http://localhost:5177`.
4. **Features**:
   - Evidence: Presigned URLs for MinIO.
   - `/health` endpoint.
5. **Contract**:
   - Expose `/openapi.json` (or generated `openapi.yaml`).
   - **STRICT**: Do NOT break compatibility without OA approval.

**Output**:

- List of implemented endpoints + `curl` examples for testing.
- List of touched files (strictly within your zone).

---

## FE (Frontend) Brief

**Role**: FE (Frontend)
**Scope**: `apps/web/**`.
**Follow**: `/spec/ui-routes.md` and `/spec/openapi.yaml`.

**Fixed Ports**:

- Vite: 5177
- API Base: `http://localhost:4010`

**Objective (UX)**:

1. **Flow**: "Today" + "Report Today" should be ≤ 3 taps.
2. **Activity Detail**: Timeline feed + toggle for "Timeline" vs "Photos Only".
3. **Indicators**: ✅ (done), ⚠️ (warning), 📝 (draft/note), ⏳ (pending).
4. **Offline**: Queue updates/evidence in **IndexedDB**.
5. **Auth**:
   - Refresh token **single-flight** (deduplicate simultaneous refresh requests).
   - Stable axios interceptors.
   - Exclude `/auth/login` and `/auth/refresh` from auth checks.
6. **Types**: Use auto-generation (`openapi-typescript` or `orval`) from OpenAPI.
   - **STRICT**: Do NOT duplicate interfaces manually.

**Output**:

- List of implemented routes + happy path walkthrough.
- List of touched files (strictly within your zone).

---

## QA (Quality) Brief

**Role**: QA (Quality)
**Scope**: `tests/**` (and `e2e/**` if exists).
**Follow**: `/spec/done.md`.

**Objective**:

1. **API Tests**: Write 5–10 critical tests (auth refresh, create, update, presign, inbox).
2. **Web Tests**: Write 2–3 smoke tests (login, report today, timeline).
3. **Report**: Verify DoD checklist + report risks/bugs.

**Output**:

- Instructions on how to run tests + final checklist.
- List of risks with severity levels.
