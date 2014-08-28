name=$(shell /usr/libexec/PlistBuddy -c Print:name src/info.plist)

all: build open

open: bin/$(name).alfredworkflow
	open bin/$(name).alfredworkflow

build:
	-pushd src; zip -r ../bin/InterSystems.alfredworkflow .; popd