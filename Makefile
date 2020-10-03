setup:
	swift package update

run:
	ice run

build:
	ice build

test:
	ice test

outdated:
	ice outdated

MAKEFILE=Makefile
README=README.md
PACKAGE_FILE=Package.swift
SOURCE_DIR=Sources/${TARGET}
TEST_DIR=Tests/${TARGET}Tests
MAIN_TEST_FILE=${TEST_DIR}/${TARGET_BY_DEFINE}Tests.swift
TEST_MANIFEST_FILE=Tests/${TARGET}Tests/XCTestManifests.swift
LINUX_MAIN_TEST_FILE=Tests/LinuxMain.swift

rename-project:
	@[ "${RENAMED_NAME}" ] && echo "validated all parameter" || ( echo "required 'name=' parameter"; exit 1 )

	sed -i -e "s/${TARGET}/${RENAMED_NAME}/" ${README}
	sed -i -e "s/${TARGET}/${RENAMED_NAME}/" ${README}
	sed -i -e "s/${TARGET}/${RENAMED_NAME}/" ${PACKAGE_FILE}
	sed -i -e "s/${TARGET_BY_DEFINE}Tests:/${RENAMED_NAME_BY_DEFINE}Tests:/" ${MAIN_TEST_FILE}
	sed -i -e "s/\"${TARGET}\"/\"${RENAMED_NAME}\"/" ${LINUX_MAIN_TEST_FILE}
	sed -i -e "s/${TARGET_BY_DEFINE}/${RENAMED_NAME_BY_DEFINE}/" ${LINUX_MAIN_TEST_FILE}
	sed -i -e "s/${TARGET_BY_DEFINE}/${RENAMED_NAME_BY_DEFINE}/" ${TEST_MANIFEST_FILE}
	sed -i -e "s/${TARGET}/${RENAMED_NAME}/" ${MAKEFILE}

	mv ${SOURCE_DIR} Sources/${RENAMED_NAME}
	mv ${TEST_DIR} Tests/${RENAMED_NAME}Tests
	mv Tests/${RENAMED_NAME}Tests/${TARGET_BY_DEFINE}Tests.swift Tests/${RENAMED_NAME}Tests/${RENAMED_NAME_BY_DEFINE}Tests.swift

DEFAULT_TEMPLATE_PROJECT_NAME := swift-cli-boilerplate
ifdef target
	TARGET=${target}
else
	TARGET=${DEFAULT_TEMPLATE_PROJECT_NAME}
endif
TARGET_BY_DEFINE=$(shell echo $(TARGET) | tr - _)
ifdef name
	RENAMED_NAME=${name}
else
	RENAMED_NAME=
endif
RENAMED_NAME_BY_DEFINE=$(shell echo $(RENAMED_NAME) | tr - _)
