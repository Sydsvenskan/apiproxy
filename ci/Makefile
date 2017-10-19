.PHONY: pipeline

TARGET ?= hds-web
APP ?= apiproxy
PIPELINE ?= $(APP)
BRANCH ?= master
IMAGE ?=  235007911888.dkr.ecr.eu-west-1.amazonaws.com/$(APP)
REPO ?= git@github.com:Sydsvenskan/$(APP).git
PACKAGE ?= github.com/Sydsvenskan/$(APP)
ECS_SERVICE ?= $(APP)
ECS_TASK ?= $(ECS_SERVICE)

pipeline: concourse_$(TARGET)_secrets.yml
	fly -t $(TARGET) set-pipeline -p $(PIPELINE) -c pipeline.yml \
		-l concourse_$(TARGET)_secrets.yml \
		--var "docker_image=$(IMAGE)" \
		--var "repository=$(REPO)" \
		--var "branch=$(BRANCH)" \
		--var "package=$(PACKAGE)" \
		--var "ecs_service=$(ECS_SERVICE)" \
		--var "ecs_test_task=$(ECS_TASK)-test" \
		--var "ecs_prod_task=$(ECS_TASK)-prod" \
    --var "ecs_test_role=$(ECS_TASK)-testing" \
    --var "ecs_prod_role=$(ECS_TASK)-production"

concourse_$(TARGET)_secrets.yml:
	echo Missing secrets file "concourse_$(TARGET)_secrets.yml"
	exit 1
