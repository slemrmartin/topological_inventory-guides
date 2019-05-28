#!/bin/bash --login

source config.sh
source init-common.sh

cd ${root_dir}

echo "Migrating Topological Inventory..."
cd topological_inventory-core
bundle exec rake db:migrate
cd ..
echo "[DONE] Migrating Topological Inventory"

echo "Migrating Sources"
cd sources-api
bundle exec rake db:migrate
cd ..
echo "[DONE] Migrating Sources"
