# documentation Configuration Options

Autogenerated by `gen-docs.py` at 2019-09-12 16:58:58

### Global Configuration

|           Parameter            |Description| Default  |
|--------------------------------|-----------|----------|
|global.environment              |           |kubernetes|
|global.domain                   |           |          |
|global.route_url_name           |           |          |
|global.remove_namespace_from_url|           |          |
|global.exhibitor.replicas       |           |         1|
|global.xds.port                 |           |     18000|
|global.xds.cluster              |           |greymatter|

### Service Configuration

|          Parameter          |Description|                               Default                               |
|-----------------------------|-----------|---------------------------------------------------------------------|
|documentation.name           |           |documentation                                                        |
|documentation.base_path      |           |/services/documentation/3.0.0/                                       |
|documentation.version        |           |3.0.0                                                                |
|documentation.image          |           |docker.production.deciphernow.com/deciphernow/gm-documentation:v3.0.0|
|documentation.imagePullPolicy|           |IfNotPresent                                                         |

#### Environment Variables

|     Environment Variable     |            Default            |
|------------------------------|-------------------------------|
|documentation.envvars[0].type |value                          |
|documentation.envvars[0].name |base_path                      |
|documentation.envvars[0].value|/services/documentation/latest/|
|documentation.envvars[1].type |value                          |
|documentation.envvars[1].name |hidden_content_titles          |
|documentation.envvars[1].value|Setup,FAQ                      |
|documentation.envvars[2].type |value                          |
|documentation.envvars[2].name |port                           |
|documentation.envvars[2].value|8090                           |

### Sidecar Configuration

|            Parameter            |Description|                                           Default                                            |
|---------------------------------|-----------|----------------------------------------------------------------------------------------------|
|sidecar.version                  |           |{{- $.Values.global.documentation.sidecar.version \| default $.Values.global.sidecar.version }}|
|sidecar.image                    |           |docker.production.deciphernow.com/deciphernow/gm-proxy:{{ tpl $.Values.sidecar.version $ }}   |
|sidecar.imagePullPolicy          |           |IfNotPresent                                                                                  |
|sidecar.resources.limits.cpu     |           |200m                                                                                          |
|sidecar.resources.limits.memory  |           |512Mi                                                                                         |
|sidecar.resources.requests.cpu   |           |100m                                                                                          |
|sidecar.resources.requests.memory|           |128Mi                                                                                         |
|sidecar.create_sidecar_secret    |           |False                                                                                         |
|sidecar.certificates.name        |           |sidecar                                                                                       |
|sidecar.certificates.ca          |           |-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----                                     |
|sidecar.certificates.cert        |           |-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----                                     |
|sidecar.certificates.key         |           |-----BEGIN RSA PRIVATE KEY----- ... -----END RSA PRIVATE KEY-----                             |

#### Environment Variables

|      Environment Variable       |   Default   |
|---------------------------------|-------------|
|sidecar.envvars.xds_cluster.type |value        |
|sidecar.envvars.xds_cluster.value|documentation|

