# Thank you @Earthly https://www.youtube.com/watch?v=w2UeLF7EEwk
# Can be adapted to pipenv, and poetry
# Other languages coming soon especially R and Julia

# .ONESHELL tells make to run each recipe line in a single shell
.ONESHELL:

# .DEFAULT_GOAL tells make which target to run when no target is specified
.DEFAULT_GOAL := all

# Specify python location in virtual environment
# Specify pip location in virtual environment
PYTHON := .venv/bin/python3
PIP := .venv/bin/pip3

venv/bin/activate: requirements.txt
	# create virtual environment
	python3 -m venv .venv
	# make command executable
	chmod +x .venv/bin/activate
	# activate virtual environment
	. .venv/bin/activate
  
activate:
	# activate virtual environment
	. .venv/bin/activate

install: venv/bin/activate requirements.txt # prerequisite
	# install commands
	$(PIP) --no-cache-dir install --upgrade pip &&\
		$(PIP) --no-cache-dir install -r requirements.txt
    
docstring: activate
	# format docstring
	pyment -w -o numpydoc *.py
  
format: activate 
	# format code
	black *.py utils/*.py testing/*.py
  
clean:
	# clean directory of cache
	rm -rf __pycache__ &&\
	rm -rf utils/__pycache__ &&\
	rm -rf testing/__pycache__ &&\
	rm -rf .pytest_cache &&\
	rm -rf .venv
  
lint: activate install format
	# flake8 or #pylint
	pylint --disable=R,C --errors-only *.py utils/*.py testing/*.py
  
test: activate install format
	# test
	$(PYTHON) -m pytest testing/*.py
  
run: activate install format lint
	# run application
  	# example $(PYTHON) app.py
  
docker_build: Dockerfile
	# build container
	sudo docker build -t bioenv .
  
docker_run_test: Dockerfile
	# linting Dockerfile
	sudo docker run --rm -i hadolint/hadolint < Dockerfile
	
docker_clean: Dockerfile
	# remove dangling images, containers, volumes and networks
	sudo docker system prune -a
  
docker_run: Dockerfile docker_build
	# run docker container
	sudo docker run -p 9090:9090 bioenv

docker_push: docker_build
  # push to registry
  # docker tag <my-image> registry.digitalocean.com/<my-registry>/<my-image>
  # docker push registry.digitalocean.com/<my-registry>/<my-image>  
  
 
# .PHONY tells make that these targets do not represent actual files
.PHONY: activate format clean lint test build run docker_build docker_run docker_push docker_clean docker_run_test
  
all: install format lint test run docker_build docker_run