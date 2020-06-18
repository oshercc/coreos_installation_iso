all: pep8 pylint build

build:
	skipper build installer-image-build

.DEFAULT:
	skipper -v $(MAKE) $@
