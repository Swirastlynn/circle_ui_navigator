# Makefile only allow Tabs when indenting code! "missing separator" error otherwise.
check: format analyze
format:
	@echo "\033[32m Formatting code... \033[0m"
	@fvm dart format lib test example
analyze:
	@echo "\033[32m Flutter static analysis and linter... \033[0m"
	@fvm flutter analyze lib test example
	@echo "\033[1;32m GOOD JOB, THE CODE IS SPOTLESS CLEAN AND READY FOR PULL REQUEST! \n\033[42m Make sure to commit any code changes \033[0m  \n\n"