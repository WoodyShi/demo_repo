#!/usr/bin/env zsh
# setup.sh — One-shot onboarding for new team members

set -e

# STEP 1 — Install uv
echo 'Installing uv...'
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
echo 'uv installed.'

# STEP 2 — Add `activateuv` alias to ~/.zshrc
ZSHRC="$HOME/.zshrc"
ALIAS_LINE='alias activateuv="source $(git rev-parse --show-toplevel)/.venv/bin/activate"'

echo '' >> "$ZSHRC"
echo '# Added by dbt-snowflake-project setup.sh' >> "$ZSHRC"
echo "$ALIAS_LINE" >> "$ZSHRC"
echo "Added 'activateuv' alias to ~/.zshrc."

# STEP 3 — Create .venv and install Python dependencies
echo 'Running uv sync...'
uv sync
echo 'Python environment ready.'

# STEP 4 — Install dbt packages
echo 'Installing dbt packages...'
uv run dbt clean
uv run dbt deps
echo 'dbt packages installed.'

# STEP 5 — Export Snowflake credentials to ~/.zshrc
echo 'Setting up Snowflake environment variables...'
read 'SF_USER?Your Snowflake username / email (e.g. you@company.com): '

echo "export DBT_SF_USER=\"$SF_USER\"" >> "$ZSHRC"
echo 'Added DBT_SF_USER to ~/.zshrc.'
export DBT_SF_USER="$SF_USER"

# Done
echo 'Setup complete! Next steps:'
echo '  1. Reload your shell:     source ~/.zshrc'
echo '  2. Activate the venv:     activateuv'
echo '  3. Verify the connection: dbt debug'
echo '     (A browser window will open for SSO login.)'
echo '  4. Run the models:  dbt run'
