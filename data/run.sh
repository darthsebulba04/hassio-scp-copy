#!/usr/bin/with-contenv bashio

bashio::log.info "Starting SCP copy..."

exec /usr/bin/scp -i "$(bashio::config 'private_key')" -o \
	StrictHostKeyChecking=no \
	`find /backup -name *.tar -maxdepth 1 -mtime -1` $(bashio::config 'remote_user')@$(bashio::config 'remote_host'):$(bashio::config 'remote_path')

bashio::log.info "SCP copy complete..."
