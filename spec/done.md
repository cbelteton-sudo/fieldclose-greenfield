# Definition of Done (DoD)

## Code Quality

- [ ] No lint errors (ESLint/Prettier clean).
- [ ] Typescript strict mode enabled (no implicit `any`).
- [ ] Consistent naming conventions.

## Functionality

- [ ] **Refresh Cookie**: Must be `httpOnly`, name=`fieldclose_sess`.
- [ ] **CORS**: Credentials enabled, allowlist `http://localhost:5177`.
- [ ] **Auth**: `/auth/login` and `/auth/refresh` excluded from global guards.
- [ ] **Frontend**: Implement single-flight for refresh token logic (prevent multiple refresh calls).

## Testing

- [ ] Happy path verified manually.
- [ ] Error states handled gracefully (consistent error format).

## Ops/Dev

- [ ] Ports match `/spec/ports.md`.
- [ ] Docker compose services healthy.
