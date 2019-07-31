#!/usr/bin/env sh

echo "Reading services from $SERVICE_LIST_FILE"

echo "Got other Kubernetes configuration"
echo "k8s Namespace: $KUBERNETES_NAMESPACE"

services=$(cat $SERVICE_LIST_FILE)
echo "Got: $services"

delay=10
echo "Waiting $delay seconds for SPIRE registration API to be enabled"
sleep $delay

echo "Checking existing registration entries"

entries=$(/opt/spire/bin/spire-server entry show -registrationUDSPath $REGISTRATION_API_PATH)
echo "$entries"


echo "Creating entry for nodes ..."
{ # try
    /opt/spire/bin/spire-server \
        entry create -node \
        -spiffeID spiffe://deciphernow.com/nodes \
        -selector k8s_sat:cluster:$CLUSTER_NAME \
        -selector k8s_sat:agent_ns:$AGENT_NAMESPACE \
        -selector k8s_sat:agent_sa$AGENT_SERVICEACCOUNT \
        -registrationUDSPath $REGISTRATION_API_PATH &&
    echo "Done with nodes"
} || { # catch
    echo "Failed to register nodes"
    continue
}

if echo "$entries" | grep -vq "Found 0 entries"; then
    echo "Entries already created. Continuing..."
else
    echo "Creating registration entries..."
    for service in $services; do
        echo "Creating entry for service: $service"
        { # try
            /opt/spire/bin/spire-server \
                entry create \
                -parentID spiffe://deciphernow.com/nodes \
                -spiffeID spiffe://deciphernow.com/$service \
                -ttl 30 \
                -selector k8s:pod-name:$service \
                -selector k8s:pod-label:app=$service \
                -selector k8s:ns:$KUBERNETES_NAMESPACE \
                -registrationUDSPath $REGISTRATION_API_PATH &&
            /opt/spire/bin/spire-server \
                entry create \
                -parentID spiffe://deciphernow.com/$service \
                -spiffeID spiffe://deciphernow.com/$service/mTLS \
                -ttl 30 \
                -selector k8s:pod-name:$service \
                -selector k8s:pod-label:app=$service \
                -selector k8s:ns:$KUBERNETES_NAMESPACE \
                -registrationUDSPath $REGISTRATION_API_PATH &&
            echo "Done with service: $service"
        } || { # catch
            echo "Failed to register service: $service"
            continue
        }
    done;
fi