---
title: K8s tutorial
---

```text { title="TERMINAL" codeToCopy="ZmluZCAuL29yaWdpbmFsIC10eXBlIGYgfCBzb3J0" }
$ find ./original -type f | sort
./original/services/frontend/bartender/kube.yaml
./original/services/frontend/breaddispatcher/kube.yaml
./original/services/frontend/host/kube.yaml
./original/services/frontend/maitred/kube.yaml
./original/services/frontend/valeter/kube.yaml
...
```

```text { title="TERMINAL" codeToCopy="Y3AgLWEgb3JpZ2luYWwgdG1wCmNkIHRtcA==" }
$ cp -a original tmp
$ cd tmp
```

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGs4cy5leGFtcGxl" }
$ cue mod init k8s.example
```

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgazhzLmV4YW1wbGU=" }
$ go mod init k8s.example
go: creating new go.mod: module k8s.example
go: to add module requirements and sums:
	go mod tidy
```

```text { title="TERMINAL" codeToCopy="Y2Qgc2VydmljZXMKY3VlIGltcG9ydCAuLy4uLiAtcCBrdWJl" }
$ cd services
$ cue import ./... -p kube
path, list, or files flag needed to handle multiple objects in file ./services/frontend/bartender/kube.yaml
```

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAuLy4uLiAtcCBrdWJlIC1sICdzdHJpbmdzLlRvQ2FtZWwoa2luZCknIC1sIG1ldGFkYXRhLm5hbWUgLWY=" }
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f
```

```text { title="TERMINAL" codeToCopy="ZmluZCAuIC10eXBlIGYgfCBzb3J0" }
$ find . -type f | sort
./frontend/bartender/kube.cue
./frontend/bartender/kube.yaml
./frontend/breaddispatcher/kube.cue
./frontend/breaddispatcher/kube.yaml
./frontend/host/kube.cue
...
```

```text { title="TERMINAL" codeToCopy="aGVhZCBtb24vcHJvbWV0aGV1cy9jb25maWdtYXAuY3Vl" }
$ head mon/prometheus/configmap.cue
package kube

configMap: prometheus: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: name: "prometheus"
	data: {
		"alert.rules": """
			groups:
			- name: rules.yaml
```

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAuLy4uLiAtcCBrdWJlIC1sICdzdHJpbmdzLlRvQ2FtZWwoa2luZCknIC1sIG1ldGFkYXRhLm5hbWUgLWYgLVI=" }
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R
```

```text { title="TERMINAL" codeToCopy="aGVhZCBtb24vcHJvbWV0aGV1cy9jb25maWdtYXAuY3Vl" }
$ head mon/prometheus/configmap.cue
package kube

import yaml656e63 "encoding/yaml"

configMap: prometheus: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: name: "prometheus"
	data: {
		"alert.rules": yaml656e63.Marshal(_cue_alert_rules)
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLi9tb24vcHJvbWV0aGV1cyAtZSBjb25maWdNYXAucHJvbWV0aGV1cw==" }
$ cue eval ./mon/prometheus -e configMap.prometheus
apiVersion: "v1"
kind:       "ConfigMap"
metadata: {
    name: "prometheus"
}
data: {
    "alert.rules": """
        groups:
          - name: rules.yaml
            rules:
...
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90" }
$ cue eval -c ./... >snapshot
```

```text { title="TERMINAL" codeToCopy="Y3AgZnJvbnRlbmQvYnJlYWRkaXNwYXRjaGVyL2t1YmUuY3VlIC4=" }
$ cp frontend/breaddispatcher/kube.cue .
```

```cue { title="tmp/services/kube.cue" }
package kube

service: [ID=_]: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name: ID
		labels: {
			app:       ID     // by convention
			domain:    "prod" // always the same in the given files
			component: string // varies per directory
		}
	}
	spec: {
		// Any port has the following properties.
		ports: [...{
			port:     int
			protocol: *"TCP" | "UDP" // from the Kubernetes definition
			name:     string | *"client"
		}]
		selector: metadata.labels // we want those to be the same
	}
}

deployment: [ID=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: name: ID
	spec: {
		// 1 is the default, but we allow any number
		replicas: *1 | int
		template: {
			metadata: labels: {
				app:       ID
				domain:    "prod"
				component: string
			}
			// we always have one namesake container
			spec: containers: [{name: ID}]
		}
	}
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90Mg==" }
$ cue eval -c ./... >snapshot2
// k8s.example/services/mon/alertmanager:kube
deployment.alertmanager.spec.template.metadata.labels.component: incomplete value string:
    ./kube.cue:36:16
service.alertmanager.metadata.labels.component: incomplete value string:
    ./kube.cue:11:15
service.alertmanager.spec.selector.component: incomplete value string:
    ./kube.cue:11:15
// k8s.example/services/mon/nodeexporter:kube
service."node-exporter".metadata.labels.component: incomplete value string:
    ./kube.cue:11:15
...
```

```text { title="TERMINAL" codeToCopy="c2VkIC1pLmJhayAncy9jb21wb25lbnQ6LipzdHJpbmcvY29tcG9uZW50OiAjQ29tcG9uZW50Lycga3ViZS5jdWUKcm0ga3ViZS5jdWUuYmFrCmNhdCA8PEVPRiA+Pmt1YmUuY3VlCgojQ29tcG9uZW50OiBzdHJpbmcKRU9GCmxzIC1kICovIHwgc2VkICdzLy4kLy8nIHwgeGFyZ3MgLUkgRElSIHNoIC1jICdjZCBESVI7IGVjaG8gInBhY2thZ2Uga3ViZQoKI0NvbXBvbmVudDogXCJESVJcIgoiID4ga3ViZS5jdWU7IGNkIC4uJwpjdWUgZm10IGt1YmUuY3VlICova3ViZS5jdWU=" }
# set the component label to our new top-level field
$ sed -i.bak 's/component:.*string/component: #Component/' kube.cue
$ rm kube.cue.bak

# add the new top-level field to our previous template definitions
$ cat <<EOF >>kube.cue

#Component: string
EOF

# add a file with the component label to each directory
$ ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

#Component: \"DIR\"
" > kube.cue; cd ..'

# format the files
$ cue fmt kube.cue */kube.cue
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDI=" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2
--- snapshot	2024-04-07 15:55:53.129367671 +0000
+++ snapshot2	2024-04-07 15:55:54.637365289 +0000
@@ -1,3 +1,9 @@
+service: {}
+deployment: {}
+// ---
+service: {}
+deployment: {}
+// ---
 service: {
     bartender: {
         apiVersion: "v1"
@@ -208,6 +214,7 @@
             selector: {
                 app:    "maitred"
                 domain: "prod"
+                component: "frontend"
             }
         }
     }
...
```

```text { title="TERMINAL" codeToCopy="Y3Agc25hcHNob3QyIHNuYXBzaG90" }
$ cp snapshot2 snapshot
```

```text { title="TERMINAL" codeToCopy="ZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ find . | grep kube.cue | xargs wc -l | tail -1
 1883 total
```

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0gLi8uLi4KZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim ./...
$ find . | grep kube.cue | xargs wc -l | tail -1
 1308 total
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDIgfCB3YyAtbA==" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2 | wc -l
0
```

```cue { title="tmp/services/kube2.cue" }
package kube

daemonSet: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "DaemonSet"
	_name:      ID
}

statefulSet: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "StatefulSet"
	_name:      ID
}

deployment: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      ID
	spec: replicas: *1 | int
}

configMap: [ID=_]: {
	metadata: name: ID
	metadata: labels: component: #Component
}

_spec: {
	_name: string

	metadata: name: _name
	metadata: labels: component: #Component
	spec: selector: {}
	spec: template: {
		metadata: labels: {
			app:       _name
			component: #Component
			domain:    "prod"
		}
		spec: containers: [{name: _name}]
	}
}
```

```cue { title="tmp/services/kube3.cue" }
package kube

// Define the _export option and set the default to true
// for all ports defined in all containers.
_spec: spec: template: spec: containers: [...{
	ports: [...{
		_export: *true | false // include the port in the service
	}]
}]

for x in [deployment, daemonSet, statefulSet] for k, v in x {
	service: "\(k)": {
		spec: selector: v.spec.template.metadata.labels

		spec: ports: [
			for c in v.spec.template.spec.containers
			for p in c.ports
			if p._export {
				let Port = p.containerPort // Port is an alias
				port:       *Port | int
				targetPort: *Port | int
			},
		]
	}
}
```

```text { title="TERMINAL" codeToCopy="Y2F0IDw8RU9GID4+aW5mcmEvZXZlbnRzL2t1YmUuY3VlCgpkZXBsb3ltZW50OiBldmVudHM6IHNwZWM6IHRlbXBsYXRlOiBzcGVjOiBjb250YWluZXJzOiBbeyBwb3J0czogW3tfZXhwb3J0OiBmYWxzZX0sIF9dIH1dCkVPRgpjYXQgPDxFT0YgPj5pbmZyYS90YXNrcy9rdWJlLmN1ZQoKZGVwbG95bWVudDogdGFza3M6IHNwZWM6IHRlbXBsYXRlOiBzcGVjOiBjb250YWluZXJzOiBbeyBwb3J0czogW3tfZXhwb3J0OiBmYWxzZX0sIF9dIH1dCkVPRgpjYXQgPDxFT0YgPj5pbmZyYS93YXRjaGVyL2t1YmUuY3VlCgpkZXBsb3ltZW50OiB3YXRjaGVyOiBzcGVjOiB0ZW1wbGF0ZTogc3BlYzogY29udGFpbmVyczogW3sgcG9ydHM6IFt7X2V4cG9ydDogZmFsc2V9LCBfXSB9XQpFT0Y=" }
$ cat <<EOF >>infra/events/kube.cue

deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
$ cat <<EOF >>infra/tasks/kube.cue

deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
$ cat <<EOF >>infra/watcher/kube.cue

deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
```

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0gLi8uLi4KZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim ./...
$ find . | grep kube.cue | xargs wc -l | tail -1
 1174 total
```

```text { title="TERMINAL" codeToCopy="aGVhZCBmcm9udGVuZC9icmVhZGRpc3BhdGNoZXIva3ViZS5jdWU=" }
$ head frontend/breaddispatcher/kube.cue
package kube

deployment: breaddispatcher: {
	spec: {
		template: {
			metadata: {
				annotations: {
					"prometheus.io.scrape": "true"
					"prometheus.io.port":   "7080"
				}
```

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0gLi8uLi4gLXMKaGVhZCBmcm9udGVuZC9icmVhZGRpc3BhdGNoZXIva3ViZS5jdWU=" }
$ cue trim ./... -s
$ head frontend/breaddispatcher/kube.cue
package kube

deployment: breaddispatcher: spec: template: {
	metadata: annotations: {
		"prometheus.io.scrape": "true"
		"prometheus.io.port":   "7080"
	}
	spec: containers: [{
		image: "gcr.io/myproj/breaddispatcher:v0.3.24"
		ports: [{
```

```text { title="TERMINAL" codeToCopy="ZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ find . | grep kube.cue | xargs wc -l | tail -1
 1022 total
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3Q=" }
$ cue eval -c ./... >snapshot2
$ cp snapshot2 snapshot
```

```cue { title="tmp/services/frontend/kube2.cue" }
package kube

deployment: [string]: spec: template: {
	metadata: annotations: {
		"prometheus.io.scrape": "true"
		"prometheus.io.port":   "\(spec.containers[0].ports[0].containerPort)"
	}
	spec: containers: [{
		ports: [{containerPort: *7080 | int}] // 7080 is the default
	}]
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDI=" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2
--- snapshot	2024-04-07 15:56:03.049351929 +0000
+++ snapshot2	2024-04-07 15:56:04.293349943 +0000
@@ -190,6 +190,7 @@
                 metadata: {
                     annotations: {
                         "prometheus.io.scrape": "true"
+                        "prometheus.io.port":   "7080"
                     }
                     labels: {
                         app:       "host"
...
```

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0gLi9mcm9udGVuZC8uLi4gLXMKZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim ./frontend/... -s
$ find . | grep kube.cue | xargs wc -l | tail -1
  968 total
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3Q=" }
$ cue eval -c ./... >snapshot2
$ cp snapshot2 snapshot
```

```cue { title="tmp/services/kitchen/kube2.cue" }
package kube

deployment: [string]: spec: template: {
	metadata: annotations: "prometheus.io.scrape": "true"
	spec: containers: [{
		ports: [{
			containerPort: 8080
		}]
		livenessProbe: {
			httpGet: {
				path: "/debug/health"
				port: 8080
			}
			initialDelaySeconds: 40
			periodSeconds:       3
		}
	}]
}
```

```cue { title="tmp/services/kitchen/kube3.cue" }
package kube

deployment: [ID=_]: spec: template: spec: {
	_hasDisks: *true | bool

	// field comprehension using just "if"
	if _hasDisks {
		volumes: [{
			name: *"\(ID)-disk" | string
			gcePersistentDisk: pdName: *"\(ID)-disk" | string
			gcePersistentDisk: fsType: "ext4"
		}, {
			name: *"secret-\(ID)" | string
			secret: secretName: *"\(ID)-secrets" | string
		}, ...]

		containers: [{
			volumeMounts: [{
				name:      *"\(ID)-disk" | string
				mountPath: *"/logs" | string
			}, {
				mountPath: *"/etc/certs" | string
				name:      *"secret-\(ID)" | string
				readOnly:  true
			}, ...]
		}]
	}
}
```

```cue { title="tmp/services/kitchen/souschef/kube2.cue" }
package kube

deployment: souschef: spec: template: spec: {
	_hasDisks: false
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0gLXMgLi9raXRjaGVuLy4uLgpjdWUgZXZhbCAtYyAuLy4uLiA+c25hcHNob3QyCmRpZmYgLXd1IHNuYXBzaG90IHNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3QKZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim -s ./kitchen/...

# check differences
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2
...
$ cp snapshot2 snapshot
$ find . | grep kube.cue | xargs wc -l | tail -1
  801 total
```

```cue { title="tmp/services/kube_tool.cue" }
package kube

objects: [for v in objectSets for x in v {x}]

objectSets: [
	service,
	deployment,
	statefulSet,
	daemonSet,
	configMap,
]
```

```cue { title="tmp/services/ls_tool.cue" }
package kube

import (
	"text/tabwriter"
	"tool/cli"
	"tool/file"
)

command: ls: {
	task: print: cli.Print & {
		text: tabwriter.Write([
			for x in objects {
				"\(x.kind)  \t\(x.metadata.labels.component)  \t\(x.metadata.name)"
			},
		])
	}

	task: write: file.Create & {
		filename: "foo.txt"
		contents: task.print.text
	}
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIGNtZCBscyAuL2Zyb250ZW5kL21haXRyZWQ=" }
$ cue cmd ls ./frontend/maitred
Service      frontend   maitred
Deployment   frontend   maitred

```

```text { title="TERMINAL" codeToCopy="Y3VlIGNtZCBscyAuLy4uLg==" }
$ cue cmd ls ./...
Service       frontend   bartender
Service       frontend   breaddispatcher
Service       frontend   host
Service       frontend   maitred
Service       frontend   valeter
Service       frontend   waiter
Service       frontend   waterdispatcher
Service       infra      download
Service       infra      etcd
Service       infra      events
...
```

```cue { title="tmp/services/dump_tool.cue" }
package kube

import (
	"encoding/yaml"
	"tool/cli"
)

command: dump: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
```

```cue { title="tmp/services/create_tool.cue" }
package kube

import (
	"encoding/yaml"
	"tool/exec"
	"tool/cli"
)

command: create: {
	task: kube: exec.Run & {
		cmd:    "kubectl create --dry-run=client -f -"
		stdin:  yaml.MarshalStream(objects)
		stdout: string
	}

	task: display: cli.Print & {
		text: task.kube.stdout
	}
}
```
```text { title="TERMINAL" codeToCopy="Y3VlIGNtZCBjcmVhdGUgLi9mcm9udGVuZC8uLi4=" }
$ cue cmd create ./frontend/...
apiVersion: v1
kind: Service
metadata:
  name: bartender
  labels:
    app: bartender
    domain: prod
    component: frontend
spec:
  ports:
...
```
