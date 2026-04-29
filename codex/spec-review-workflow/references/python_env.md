# Python Environment

For Python projects, prefer a project-local `.venv`.

If no virtual environment exists:

- Create `.venv` before installing dependencies.
- Use `.venv/bin/python`, `.venv/bin/pip`, and `.venv/bin/pytest`.
- Do not install packages globally.
- Add `.venv/` to `.gitignore`.
- If dependency files exist, install from them first: `requirements.txt`, `pyproject.toml`, `poetry.lock`, or `uv.lock`.
- If no dependency file exists, ask before adding new runtime dependencies.
