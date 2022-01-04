
.PHONY: test
test:
	dart analyze
	flutter test --platform chrome

fmt:
	flutter format ./..
