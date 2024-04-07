---
title: K8s tutorial
draft: true
---

{{{uploaddir "_ref"}}}

{{{with script "en" "find original"}}}
#ellipsis 5
find ./original -type f | sort
{{{end}}}

{{{with script "en" "original cp"}}}
cp -a original tmp
cd tmp
{{{end}}}

{{{with script "en" "cue mod init k8s.example"}}}
cue mod init k8s.example
{{{end}}}

{{{with script "en" "go mod init k8s.example"}}}
go mod init k8s.example
{{{end}}}

{{{with script "en" "import attempt 1"}}}
cd services
! cue import ./... -p kube
{{{end}}}

{{{with script "en" "import attempt 2"}}}
cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f
{{{end}}}

{{{with script "en" "find post import attempt 2"}}}
#ellipsis 5
find . -type f | sort
{{{end}}}

{{{with script "en" "check import attempt 2 result"}}}
head mon/prometheus/configmap.cue
{{{end}}}

{{{with script "en" "import attempt 3"}}}
cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R
{{{end}}}

{{{with script "en" "check import attempt 3 result"}}}
head mon/prometheus/configmap.cue
{{{end}}}

{{{with script "en" "eval initial import"}}}
#ellipsis 10
cue eval ./mon/prometheus -e configMap.prometheus
{{{end}}}

{{{with script "en" "snapshot initial import"}}}
cue eval -c ./... >snapshot
{{{end}}}

{{{with script "en" "start creating template"}}}
cp frontend/breaddispatcher/kube.cue .
{{{end}}}

{{{with upload "en" "initial template"}}}
#force
-- tmp/services/kube.cue --
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
{{{end}}}

{{{with script "en" "test template"}}}
#ellipsis 10
! cue eval -c ./... >snapshot2
{{{end}}}

{{{with script "en" "fix things up"}}}
# set the component label to our new top-level field
sed -i.bak 's/component:.*string/component: #Component/' kube.cue
rm kube.cue.bak

# add the new top-level field to our previous template definitions
cat <<EOF >> kube.cue

#Component: string
EOF

# add a file with the component label to each directory
ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

#Component: \"DIR\"
" > kube.cue; cd ..'

# format the files
cue fmt kube.cue */kube.cue
{{{end}}}

{{{with script "en" "test template again"}}}
cue eval -c ./... >snapshot2
#ellipsis 20
! diff -wu snapshot snapshot2
{{{end}}}

{{{with script "en" "save snapshot 2"}}}
cp snapshot2 snapshot
{{{end}}}

{{{with script "en" "boilerplate count 1"}}}
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with script "en" "cue trim 1"}}}
cue trim ./...
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with script "en" "verify boilerplate removal 1"}}}
cue eval -c ./... >snapshot2
diff -wu snapshot snapshot2 | wc -l
{{{end}}}

{{{with upload "en" "kube2"}}}
-- tmp/services/kube2.cue --
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
{{{end}}}

{{{with upload "en" "kube3"}}}
-- tmp/services/kube3.cue --
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
{{{end}}}

{{{with script "en" "patches"}}}
cat <<EOF >>infra/events/kube.cue

deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
cat <<EOF >>infra/tasks/kube.cue

deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
cat <<EOF >>infra/watcher/kube.cue

deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
{{{end}}}

{{{with script "en" "verify template improvement"}}}
cue trim ./...
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with script "en" "view unsimplified version"}}}
head frontend/breaddispatcher/kube.cue
{{{end}}}

{{{with script "en" "simplify"}}}
cue trim ./... -s
head frontend/breaddispatcher/kube.cue
{{{end}}}

{{{with script "en" "check lines post simplify"}}}
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with script "en" "save snapshot post simplfiy"}}}
cue eval -c ./... >snapshot2
cp snapshot2 snapshot
{{{end}}}

{{{with upload "en" "template frontend"}}}
-- tmp/services/frontend/kube2.cue --
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
{{{end}}}

{{{with script "en" "check differences post frontend template"}}}
cue eval -c ./... >snapshot2
#ellipsis 10
! diff -wu snapshot snapshot2
{{{end}}}

{{{with script "en" "trim post frontend template"}}}
cue trim ./frontend/... -s
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with script "en" "save snapshot post frontend template"}}}
cue eval -c ./... >snapshot2
cp snapshot2 snapshot
{{{end}}}

{{{with upload "en" "template kitchen"}}}
-- tmp/services/kitchen/kube2.cue --
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
{{{end}}}

{{{with upload "en" "kitchen3"}}}
-- tmp/services/kitchen/kube3.cue --
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
{{{end}}}

{{{with upload "en" "sous"}}}
-- tmp/services/kitchen/souschef/kube2.cue --
package kube

deployment: souschef: spec: template: spec: {
	_hasDisks: false
}
{{{end}}}

{{{with script "en" "post kitchen tweaks"}}}
cue trim -s ./kitchen/...

# check differences
cue eval -c ./... >snapshot2
#ellipsis
! diff -wu snapshot snapshot2
cp snapshot2 snapshot
find . | grep kube.cue | xargs wc -l | tail -1
{{{end}}}

{{{with upload "en" "kube tool"}}}
-- tmp/services/kube_tool.cue --
package kube

objects: [for v in objectSets for x in v {x}]

objectSets: [
	service,
	deployment,
	statefulSet,
	daemonSet,
	configMap,
]
{{{end}}}

{{{with upload "ls" "ls tool"}}}
-- tmp/services/ls_tool.cue --
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
{{{end}}}

{{{with script "en" "ls 1"}}}
cue cmd ls ./frontend/maitred
{{{end}}}

{{{with script "en" "ls 2"}}}
#ellipsis 10
cue cmd ls ./...
{{{end}}}

{{{with upload "en" "dump tool"}}}
-- tmp/services/dump_tool.cue --
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
{{{end}}}

{{{with upload "en" "create tool"}}}
-- tmp/services/create_tool.cue --
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
{{{end}}}

{{{with _upload_ "en" "kubectl"}}}
#nofmt
-- .bin/kubectl --
#!/bin/sh

cat -
{{{end}}}

{{{with _script_ "en" "make kubectl exec"}}}
chmod +x $HOME/.bin/kubectl
export PATH="$HOME/.bin:$PATH"
{{{end}}}

{{{with script "en" "run create"}}}
#ellipsis 10
cue cmd create ./frontend/...
{{{end}}}
