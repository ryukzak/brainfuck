PHONY: lint-fix lint

lint-fix:
	markdownlint -c .markdownlint.yaml --fix .

lint:
	markdownlint -c .markdownlint.yaml .
