#!/usr/bin/env bash

#Requires Okapi to be running on localhost:9301

tenant_id=test_tenant
okapi_proxy_address="http://localhost:9130"
inventory_direct_address=http://localhost:9603
inventory_instance_id=localhost-9603
#Needs to be the specific version of Inventory Storage you want to use for testing
inventory_storage_module_id="mod-inventory-storage-6.0.1-SNAPSHOT"

echo "Check if Okapi is contactable"
curl -w '\n' -X GET -D -   \
     "${okapi_proxy_address}/_/env" || exit 1

echo "Create ${tenant_id} tenant"
./create-tenant.sh ${tenant_id}

echo "Activate inventory storage for ${tenant_id}"
activate_json=$(cat ./registration/activate.json)
activate_json="${activate_json/moduleidhere/$inventory_storage_module_id}"

curl -w '\n' -X POST -D - \
     -H "Content-type: application/json" \
     -d "${activate_json}"  \
     "${okapi_proxy_address}/_/proxy/tenants/${tenant_id}/modules"

#generate the descriptors needed for registration (need to be in target, due to registration)
mvn clean compile -Dmaven.test.skip=true -q

echo "Register inventory module"
./register.sh ${inventory_direct_address} ${inventory_instance_id} ${tenant_id}

gradle -Dokapi.address="${okapi_proxy_address}" clean cleanTest testApiViaOkapi

test_results=$?

echo "Unregister inventory module"
./unregister.sh ${inventory_instance_id} ${tenant_id}

echo "Deactivate inventory storage for ${tenant_id}"
curl -X DELETE -D - -w '\n' "${okapi_proxy_address}/_/proxy/tenants/${tenant_id}/modules/${inventory_storage_module_id}"

echo "Deleting ${tenant_id}"
./delete-tenant.sh ${tenant_id}

echo "Need to manually remove test_tenant storage as Tenant API no longer invoked on deactivation"

if [ $test_results != 0 ]; then
    echo '--------------------------------------'
    echo 'BUILD FAILED'
    echo '--------------------------------------'
    exit 1;
else
    echo '--------------------------------------'
    echo 'BUILD SUCCEEDED'
    echo '--------------------------------------'
    exit 1;
fi
