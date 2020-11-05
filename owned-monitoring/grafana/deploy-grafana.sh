#!/bin/bash

set -o nounset
set -o errexit

# install grafana operator
if ! oc get packagemanifest/grafana-operator -n openshift-marketplace &> /dev/null; then
    echo "Please check community-operators, packagemanifest not include grafana-operator"
    exit 1
else
	oc create -f grafana-operator.yaml
fi

# wumii-ca is used for authentication with ldaps
oc create configmap wumii-ca --from-file=./wumii-internal.crt

# The grafana configuration file must be deployed first or grafana will fail to deploy
oc create -f ldap-config.yaml

# deploy grafana app
oc create -f grafana.yaml

# deploy prometheus datasource for grafana
oc create -f prometheusDataSource.yml

# deploy apache-exporter dashboard
oc create -f dashboards/lbWorkerStatus.yml
