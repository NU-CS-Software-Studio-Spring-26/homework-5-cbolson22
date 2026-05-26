# Homework 5 Submission

## Links

- [hw5 repository / branch](https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/tree/hw5)
- [.cursorignore](https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/blob/hw5/.cursorignore)
- [AGENTS.md](https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/blob/hw5/AGENTS.md)
- [.cursor/rules/rails-conventions.mdc](https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/blob/hw5/.cursor/rules/rails-conventions.mdc)
- [.cursor/rules/security.mdc](https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/blob/hw5/.cursor/rules/security.mdc)

---

## Part 3

### Ask mode

**Prompt used:**
> "Where in this codebase is the todo create form's error rendering currently implemented? Cite the exact files and line numbers. Do not propose changes."

**Files and line numbers Cursor returned:**
- `app/views/todos/_form.html.erb` lines 2–12 — the `todo.errors.any?` block that renders validation errors
- `app/controllers/todos_controller.rb` lines 30–32 — the `else` branch of `create` that renders `:new` with `:unprocessable_content`
- `app/views/todos/new.html.erb` line 5 — `<%= render "form", todo: @todo %>`

**Verified / hallucinated?**
All three citations verified against actual files — no hallucinations.

### Plan mode

**Prompt used:**
> "I want to change the todo create form so that a todo description must be at least 5 characters long; submitting a blank or too-short description should re-render the form with a validation error. Propose a plan as a numbered list of changes, including files to edit, new tests to add, and any migration. Do not write code."

**Plan from Cursor:**

1. Update `app/models/todo.rb` — add presence and minimum length (5) validation on `description`.
2. No controller change needed — the existing `create` action already renders `:new` with `:unprocessable_content` on save failure.
3. No view change needed — `app/views/todos/_form.html.erb` already renders `todo.errors`.
4. Add model tests in `test/models/todo_test.rb` — valid (≥5 chars), blank (invalid), too-short (invalid).
5. Add controller tests in `test/controllers/todos_controller_test.rb` — POST with blank and too-short description does not change `Todo.count`, returns `:unprocessable_content`, renders error text.
6. No migration needed — this is an application-level validation only.
7. Run `bin/rails test test/models/todo_test.rb test/controllers/todos_controller_test.rb`, then full suite.

**My edits to the plan:**
- Removed migration as a separate step — Cursor correctly identified it wasn't needed, but I confirmed this: the `description` string column already exists and a DB constraint isn't required for form validation behavior.
- Tightened step 2 and 3 to be explicit that those files require zero changes, so Agent mode won't touch them unnecessarily.

### Agent mode

**Prompt used:**
> "Implement only step 1 from the plan: add a validation to `app/models/todo.rb` that requires `description` to be present and at least 5 characters long. Do not touch any other file."

**Commit link:**
https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-cbolson22/commit/ec29ada

### Bad → Good prompt rewrite

**Bad:** `fix the bug in todos`

**Good:**
> **Context:** `config/routes.rb` (line 15 — root route is commented out)
>
> **Task:** Uncomment and set the root route so that visiting `localhost:3000` renders the todos index instead of the Rails default welcome page.
>
> **Expected vs. actual:** Visiting `localhost:3000` should show the todos index page. Currently it shows the Rails default welcome screen (Rails logo, version info) because `root` is commented out in `config/routes.rb`.
>
> **Constraints:** Touch only `config/routes.rb`. Do not add new routes or change existing ones. Follow the existing `resources :todos` pattern already in the file.
>
> **Done when:** Visiting `localhost:3000` in the browser loads the todos index page with no redirect.

---

## Part 4

### Turbo Streams explanation

### What I verified against the Turbo Streams handbook

### Pull request URL
