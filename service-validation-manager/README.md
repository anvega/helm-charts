# Service-validation-manager

## TL;DR;

```console
$ helm install Service-validation-manager
```

## Introduction

This chart bootstraps an Service-validation-manager deployment on a [Kubernetes](http://kubernetes.io) or [OpenShift](https://www.openshift.com/) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `<my-release>`:

```console
$ helm install Service-validation-manager --name <my-release>
```

The command deploys Service-validation-manager on the cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `<my-release>` deployment:

```console
$ helm delete <my-release>
```

The command removes all components associated with the chart and deletes the release.

## Configuration

The following tables list the configurable parameters of the Service-validation-manager chart and their default values.

### Global Configuration

| Parameter                        | Description       | Default    |
| -------------------------------- | ----------------- | ---------- |
| global.environment               |                   |            |
| global.domain                    | edge-ingress.yaml |            |
| global.route_url_name            | edge-ingress.yaml |            |
| global.remove_namespace_from_url | edge-ingress.yaml | ''         |
| global.exhibitor.replicas        |                   | 1          |
| global.xds.port                  |                   | 18000      |
| global.xds.cluster               |                   | greymatter |

### Service Configuration

| Parameter                                  | Description | Default                                                                         |
| ------------------------------------------ | ----------- | ------------------------------------------------------------------------------- |
| Service-validation-manager.name            |             | Service-validation-manager                                                      |
| Service-validation-manager.base_path       |             | "services/service-validation-manager/0.5.0/"                                    |
| Service-validation-manager.version         |             | 0.5.0                                                                           |
| Service-validation-manager.image           |             | "docker.production.deciphernow.com/deciphernow/service-validation-manager:0.5.0 |
| Service-validation-manager.imagePullPolicy |             | Always                                                                          |

Environment variables set in values.yaml:

| Environment variable | Default                                      |
| -------------------- | -------------------------------------------- |
| base_path            | "services/Service-validation-manager/0.5.0/" |
| db_host              |                                              |
| db_name              |                                              |
| db_user              |                                              |
| svm_superusers       |                                              |
| client_cert          |                                              |
| private_key          |                                              |
| ca_cert              |                                              |

### Sidecar Configuration

| Parameter                         | Description | Default                                                       |
| --------------------------------- | ----------- | ------------------------------------------------------------- |
| sidecar.version                   |             | 0.7.1                                                         |
| sidecar.image                     |             | docker.production.deciphernow.com/deciphernow/gm-proxy:0.7.1' |
| sidecar.imagePullPolicy           |             | Always                                                        |
| sidecar.resources.limits.cpu      |             | 200m                                                          |
| sidecar.resources.limits.memory   |             | 4Gi                                                           |
| sidecar.resources.requests.cpu    |             | 1                                                             |
| sidecar.resources.requests.memory |             | 2Gi                                                           |
| sidecar.create_sidecar_secret     |             | false                                                         |
| sidecar.certificates              |             | Set in values.yaml                                            |

Environment variables set in values.yaml:

| Environment variable    | Default                             |
| ----------------------- | ----------------------------------- |
| ingres_use_tls          | 'true'                              |
| ingres_ca_cert_path     | '/etc/proxy/tls/sidecar/ca.crt'     |
| ingress_cert_path       | '/etc/proxy/tls/sidecar/server.crt' |
| ingress_key_path        | '/etc/proxy/tls/sidecar/server.key' |
| metrics_key_function    | 'depth'                             |
| metrics_port            | '8081                               |
| port                    | '9080'                              |
| proxy_dynamic           | 'true'                              |
| service_port            | '8080'                              |
| service_host            | '127.0.0.1                          |
| osb_enabled             | 'false'                             |
| obs_enforce             | 'false'                             |
| kafka_zk_discover       | 'false'                             |
| kafka-server_connection | 'kafka:9091,kafka2:9091'            |
| kafka_enabled           | 'false'                             |
| kafka_topic             | 'gm-Service-validation-manager'     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

- All the files listed under this variable will overwrite any existing files by the same name in the Service-validation-manager config directory.
- Files not mentioned under this variable will remain unaffected.

```console
$ helm install Service-validation-manager --name <my-release> \
  --set=jwt.version=v0.2.0, sidecar.ingress_use_tls='false'
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example :

```console
$ helm install Service-validation-manager --name <my-release> -f custom.yaml
```
