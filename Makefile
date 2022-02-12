DOMAIN = example.com
EMAIL = example@example.com

-include .env

CONFIG_DIR = $(PWD)/config
WORK_DIR = $(PWD)/work
LOGS_DIR = $(PWD)/logs

CERTBOT_FLAGS = --agree-tos --eff-email \
    --config-dir $(CONFIG_DIR) --work-dir $(WORK_DIR) --logs-dir $(LOGS_DIR) \
    --preferred-challenges dns \
    --domain $(DOMAIN) --email $(EMAIL)

.PHONY: help manual renew
help:
	@echo \
	usage: make DOMAIN=example.com EMAIL=example@example.com \{ manual \| renew  \}

manual:
	certbot certonly --manual $(CERTBOT_FLAGS)

renew:
	certbot certonly --standalone $(CERTBOT_FLAGS) --keep-until-expiring
