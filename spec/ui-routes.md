# UI Routes

## Public

- `/auth/login` - Login page
- `/auth/register` - Registration page (optional)

## Private (Guarded)

- `/` - Dashboard / Project List
- `/projects/:id` - Project Details
- `/settings` - User settings

## Notes

- **Guard**: All private routes must check for `fieldclose_sess` cookie.
- **Redirect**: Unauthenticated users on private routes -> `/auth/login`.
- **Redirect**: Authenticated users on verify generic public routes -> `/`.
- **404**: Catch-all route for undefined paths.
