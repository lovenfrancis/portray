#!/bin/bash -xe

poetry run mypy --ignore-missing-imports portray/
poetry run isort --check --diff --recursive portray/ tests/
poetry run black --check -l 100 portray/ tests/
poetry run flake8 portray/ tests/ --max-line 100 --ignore F403,F401,W503
poetry run safety check
poetry run bandit -r portray
