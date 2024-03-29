SHELL := /bin/bash

PROJECT = cyclegan

.PHONY: venv
venv:
	test -d venv.$(PROJECT) || virtualenv -p python3 venv.$(PROJECT)

define install_requirements
source venv.$(PROJECT)/bin/activate; pip install --upgrade pip; pip install --upgrade -r requirements.txt
endef

.PHONY: requirements
requirements:
	$(install_requirements)

.PHONY: setup
setup: venv update

define clean
find . -name '__pycache__' | xargs rm -rf
find . -name '*.pyc' | xargs rm -rf
endef

.PHONY: clean
clean:
	$(clean)

.PHONY: update
update:
	git pull
	$(clean)
	$(install_requirements)

.PHONY: download-hurricane
download-hurricane:
	test -d datasets/hurricane || bash datasets/download_bob2colour_dataset.sh hurricane

.PHONY: train-hurricane
train-hurricane:
	source venv.$(PROJECT)/bin/activate; \
	bash scripts/train_hurricane.sh

.PHONY: test-hurricane
test-hurricane:
	source venv.$(PROJECT)/bin/activate; \
	bash scripts/test_hurricane.sh

.PHONY: push-results-hurricane
push-results-hurricane:
	sftp home:/home/orde/data/web/bob_colourisation/checkpoints/hurricane2colour <<< $$'put checkpoints/hurricane2colour/latest*.pth'

.PHONY: pull-results-hurricane
pull-results-hurricane:
	sftp home:/home/orde/data/web/bob_colourisation/checkpoints/hurricane2colour/latest*.pth checkpoints/hurricane2colour/

.PHONY: download-bob
download-bob:
	test -d datasets/bob || bash datasets/download_bob2colour_dataset.sh bob

.PHONY: train-bob
train-bob:
	source venv.$(PROJECT)/bin/activate; \
	bash scripts/train_bob.sh

.PHONY: test-bob
test-bob:
	source venv.$(PROJECT)/bin/activate; \
	bash scripts/test_bob.sh

.PHONY: push-results-bob
push-results-bob:
	sftp home:/home/orde/data/web/bob_colourisation/checkpoints/bob2colour <<< $$'put checkpoints/bob2colour/latest*.pth'

.PHONY: pull-results-bob
pull-results-bob:
	sftp home:/home/orde/data/web/bob_colourisation/checkpoints/bob2colour/latest*.pth checkpoints/bob2colour/
