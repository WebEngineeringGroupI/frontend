
.PHONY: test
test:
	dart analyze
	flutter test --platform chrome
