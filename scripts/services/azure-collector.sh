#!/bin/bash --login
echo "Starting Azure source collector"
source config.sh
source init-common.sh

cd ${AZURE_DIR}
bin/azure-collector --source=${AZURE_SOURCE_UID} --client-id=${AZURE_CLIENT_ID} --client-secret=${AZURE_CLIENT_SECRET} --tenant-id=${AZURE_SUBSCRIPTION_ID} --metrics-port ${METRICS_PORT}
