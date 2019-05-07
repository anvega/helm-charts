# Catalog

## TL;DR;

```console
$ helm install catalog
```

## Introduction

This chart bootstraps a gm-catalog deployment on a [Kubernetes](http://kubernetes.io) or [OpenShift](https://www.openshift.com/) cluser using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `<my-release>`:

```console
$ helm install gm-catalog --name <my-release>
```

The command deploys gm-catalog on the cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `<my-release>` deployment:

```console
$ helm delete <my-release>
```

The command removes all components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the gm-catalog chart and their default values.

| Parameter                                               | Description                | Default                                                        |
| ------------------------------------------------------- | -------------------------- | -------------------------------------------------------------- |
| catalog.image                                           | Image                      | docker.production.deciphernow.com/deciphernow/gm-catalog:0.3.6 |
| catalog.source                                          |                            | xds                                                            |
| catalog.debug                                           | Enable Logging             | 'false'                                                        |
| catalog.version                                         | Catalog Version            | 0.3.6                                                          |
| catalog.imagePullPolicy                                 | Image pull policy          | Always                                                         |
| catalog.port                                            |                            | 9080                                                           |
|                                                         |                            |                                                                |
| catalog.services.service_0.capability                   | Service Capability         | 'Grey Matter'                                                  |
| catalog.services.service_0.documentation                | Service Documentation Path | ''                                                             |
| catalog.services.service_0.name                         | Service Name               | 'Grey Matter Catalog'                                          |
| catalog.services.service_0.owner                        | Service Owner              | 'Decipher'                                                     |
| catalog.services.service_0.version                      | Service Version            | "{{ \$.Values.catalog.version \| trunc 3 }}"                   |
| catalog.services.service_0.zookeeper_announcement_point | Service ZK announce point  | "/services/catalog/{{ $.Values.catalog.version }}/metrics"     |
|                                                         |                            |                                                                |
| catalog.services.service_1.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_1.documentation                |                            | ''                                                             |
| catalog.services.service_1.name                         |                            | 'Grey Matter Control'                                          |
| catalog.services.service_1.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_1.version                      |                            | "{{ \$.Values.xds.version \| trunc 3 }}"                       |
| catalog.services.service_1.zookeeper_announcement_point |                            | "/services/xds/{{ $.Values.xds.version }}/metrics"             |
|                                                         |                            |                                                                |
| catalog.services.service_2.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_2.documentation                |                            | ''                                                             |
| catalog.services.service_2.name                         |                            | 'Grey Matter Dashboard'                                        |
| catalog.services.service_2.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_2.version                      |                            | "{{ \$.Values.dashboard.version \| trunc 3 }}"                 |
| catalog.services.service_2.zookeeper_announcement_point |                            | "/services/dashboard/{{ $.Values.dashboard.version }}/metrics" |
|                                                         |                            |                                                                |
| catalog.services.service_3.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_3.documentation                |                            | '/services/data/{{ $.Values.data.version }}/'                  |
| catalog.services.service_3.name                         |                            | 'Grey Matter Data'                                             |
| catalog.services.service_3.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_3.version                      |                            | "{{ \$.Values.data.version \| trunc 3 }}"                      |
| catalog.services.service_3.zookeeper_announcement_point |                            | "/services/data/{{ $.Values.data.version }}/metrics"           |
|                                                         |                            |                                                                |
| catalog.services.service_4.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_4.documentation                |                            | ''                                                             |
| catalog.services.service_4.name                         |                            | 'Grey Matter JWT Security'                                     |
| catalog.services.service_4.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_4.version                      |                            | "{{ \$.Values.jwt.version \| trunc 3 }}"                       |
| catalog.services.service_4.zookeeper_announcement_point |                            | "/services/jwt-security/{{ $.Values.jwt.version }}/metrics"    |
|                                                         |                            |                                                                |
| catalog.services.service_5.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_5.documentation                |                            | ''                                                             |
| catalog.services.service_5.name                         |                            | 'Grey Matter Edge'                                             |
| catalog.services.service_5.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_5.version                      |                            | "{{ \$.Values.sidecar.version \| trunc 3 }}"                   |
| catalog.services.service_5.zookeeper_announcement_point |                            | "/services/edge/{{ $.Values.sidecar.version }}/metrics"        |
|                                                         |                            |                                                                |
| catalog.services.service_6.capability                   |                            | 'Grey Matter'                                                  |
| catalog.services.service_6.documentation                |                            | ''                                                             |
| catalog.services.service_6.name                         |                            | 'Grey Matter Service Level Objectives'                         |
| catalog.services.service_6.owner                        |                            | 'Decipher'                                                     |
| catalog.services.service_6.version                      |                            | "{{ \$.Values.slo.version \| trunc 3 }}"                       |
| catalog.services.service_6.zookeeper_announcement_point |                            | "/services/slo/{{ $.Values.slo.version }}/metrics"             |
|                                                         |                            |                                                                |
| sidecar.version                                         | Proxy Version              | 0.7.1                                                          |
| sidecar.image                                           | Proxy Image                | 'docker.production.deciphernow.com/deciphernow/gm-proxy:0.7.1' |
| sidecar.proxy_dynamic                                   |                            | 'true'                                                         |
| sidecar.metrics_key_function                            |                            | depth                                                          |
| sidecar.ingress_use_tls                                 | Enable TLS                 | 'true'                                                         |
| sidecar.imagePullPolicy                                 | Image pull policy          | Always                                                         |
| sidecar.create_sidecar_secret                           | Create Certs               | false                                                          |
| sidecar.certificates.ca                                 |                            | '...'                                                          |
| sidecar.certificates.cert                               |                            | '...'                                                          |
| sidecar.certificates.key                                |                            | '...'                                                          |
|                                                         |                            |                                                                |
| xds.version                                             | Xds Version                | 0.2.6                                                          |
| xds.port                                                | Xds Port                   | 18000                                                          |
| xds.cluster                                             | XDS Cluster                | greymatter                                                     |
|                                                         |                            |                                                                |
| dashboard.version                                       | Dashboard Version          | 2.5.0                                                          |
| data.version                                            | Data Version               | 0.2.3                                                          |
| jwt.version                                             | JWT Version                | 0.2.0                                                          |
| slo.version                                             | Slo Version                | 0.4.0                                                          |
| exhibitor.replicas                                      | Exhibitor Version          | 1                                                              |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

- All the files listed under this variable will overwrite any existing files by the same name in gm-catalog config directory.
- Files not mentioned under this variable will remain unaffected.

```console
$ helm install gm-catalog --name <my-release> \
  --set=jwt.version=v0.2.0, sidecar.ingress_use_tls='false'
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example :

```console
$ helm install catalog --name <my-release> -f custom.yaml
```

### Adding services

The catalog deployment template will generate additional services if more are provided. These services are defined as a series of values:

```console
catalog:
    services:
        service_#:
            capability: ''
            documentation: '<documentation_path>'
            name: '<service_name>'
            owner: '<owner>'
            version: "{{ $.Values.a_service_name.version | trunc 3 }}"
            zookeeper_announcement_point: "/services/slo/{{ $.Values.a_service_name.version }}/metrics"

a_service_name:
    version: 1.2.3
```

- Note the service version is defined outside the service.