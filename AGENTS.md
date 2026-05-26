# AGENTS.md

## Stack
Rails 8.1.3 sample todo app. SQLite3 database. Hotwire (turbo-rails + stimulus-rails) for frontend interactivity. Importmap for JavaScript (no Node/webpack). Propshaft for assets. Minitest for testing (no RSpec). Solid Queue for background jobs. No authentication or authorization gem (no Devise, no bcrypt).

## Commands
- Setup: `bin/setup`
- Run dev server: `bin/dev`
- Run tests: `bin/rails test`
- Run system tests: `bin/rails test:system`
- Lint: `bin/rubocop`
- Security scan: `bin/brakeman --no-pager`

## Conventions
- Models live in `app/models/`, controllers in `app/controllers/`, views in `app/views/todos/`
- Use `params.expect()` for strong parameters (Rails 8 API), not `params.require().permit()`
- Controllers respond to HTML and JSON via `respond_to` blocks; Turbo Stream responses go in the same block as `format.turbo_stream`
- Shared view partials live in `app/views/todos/` prefixed with `_`
- Use `bin/rails generate` to create files rather than writing boilerplate by hand
- Migrations must be reversible; keep schema scoped to this todo app only

## Don'ts
- No new gems without explicit approval
- No inline JavaScript in ERB templates
- No `skip_before_action :verify_authenticity_token`
- Do not seed real user data; use `db/seeds.rb` with fake data only
- Do not import models or migrations from other projects
- Do not use `params.require().permit()` — use `params.expect()` instead
