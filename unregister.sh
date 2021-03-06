#!/usr/bin/env bash

instance_id=${1:-localhost-9403}
tenant_id=${2:-demo_tenant}
module_id=${3:-mod-inventory-7.0.0-SNAPSHOT}

./okapi-registration/unmanaged-deployment/unregister.sh \
  ${instance_id} \
  ${module_id} \
  ${tenant_id}
