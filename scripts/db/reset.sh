#!/bin/bash --login
# Script for reset and initialization Topological inventory database
#
# NOTE: Edit your variables below
source ../config.sh
source ../init-common.sh

cd ${root_dir}

cd topological_inventory-core
bundle exec rake db:setup

cd ${SOURCES_API_DIR}
bundle exec rake db:setup
bundle exec rake db:migrate
bundle exec rake db:seed

cd ${TOPOLOGICAL_API_DIR}
bundle exec rake db:migrate
bundle exec rake db:seed

./init-data.sh
