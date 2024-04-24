package site
{
	content: {
		docs: {
			tutorial: {
				k8s: {
					page: {
						cache: {
							upload: {
								"initial template":  "OLsMHfQJOBZeasv25GsGccgj/nbZYX7NcNCBwYc5w0M="
								kube2:               "orpxsd5Zk6kGFxL1jb9m7WFk1j6vtvks80jvv6zL4qI="
								kube3:               "KROGJLE/Sr9Sr7ewapLmONtfeuNLD3Ib8SoRcU6hMj4="
								"template frontend": "QYh9p5JnTLsuX0BPr2A1Z7a3/9tb7IyAWxUB0iqgOAo="
								"template kitchen":  "7WuKbHO8znmbzHxDe4Qxu7/LrkQA/p7cHw7Yc5NVCUo="
								kitchen3:            "j6eiR344cyX44g8lVCd0It//ebdtQ7in5Aw9BZ4OSEw="
								sous:                "an0H0Cjx2FWZxf91yfM/3XlyyPcUnwAoH2OD+AcUboE="
								"kube tool":         "t0SbgZbYLL/x9u2iB34LNpVSTs4itHqqJwDZ5wrWZrw="
								"ls tool":           "uHuF54anJvaJ+Qp3SROKNh9Y8aqPqLSYVohUxEoySd4="
								"dump tool":         "w48GLbICZYrxHmjrb8/yM/XfpBQdyamf/TuWkVJnB+s="
								"create tool":       "dEzE6iPKjNvvRJMpemhSVPPMVWP2TKGV4ZvsMkVy5yo="
								kubectl:             "YwEHlvYhOqJE+CUyYB4V9cP7b5KM6xTLiBIToNMjYzM="
							}
							multi_step: {
								hash:       "R8J9VQBFD128LFU3MFCC8HQPGRIOS2NFD2RHALDELP16I1CCTGRG===="
								scriptHash: "VPBDOT4K1OVRLN2B826PPIO4SS7248GCSBUBUAITEFQAKCDR2J0G===="
								steps: [{
									doc:      "#ellipsis 5"
									cmd:      "find ./original -type f | sort"
									exitCode: 0
									output: """
											./original/services/frontend/bartender/kube.yaml
											./original/services/frontend/breaddispatcher/kube.yaml
											./original/services/frontend/host/kube.yaml
											./original/services/frontend/maitred/kube.yaml
											./original/services/frontend/valeter/kube.yaml
											...

											"""
								}, {
									doc:      ""
									cmd:      "cp -a original tmp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd tmp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init k8s.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init k8s.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module k8s.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      ""
									cmd:      "cd services"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import ./... -p kube"
									exitCode: 1
									output: """
											path, list, or files flag needed to handle multiple objects in file ./services/frontend/bartender/kube.yaml

											"""
								}, {
									doc:      ""
									cmd:      "cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 5"
									cmd:      "find . -type f | sort"
									exitCode: 0
									output: """
											./frontend/bartender/kube.cue
											./frontend/bartender/kube.yaml
											./frontend/breaddispatcher/kube.cue
											./frontend/breaddispatcher/kube.yaml
											./frontend/host/kube.cue
											...

											"""
								}, {
									doc:      ""
									cmd:      "head mon/prometheus/configmap.cue"
									exitCode: 0
									output: #"""
											package kube

											configMap: prometheus: {
											\#tapiVersion: "v1"
											\#tkind:       "ConfigMap"
											\#tmetadata: name: "prometheus"
											\#tdata: {
											\#t\#t"alert.rules": """
											\#t\#t\#tgroups:
											\#t\#t\#t- name: rules.yaml

											"""#
								}, {
									doc:      ""
									cmd:      "cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "head mon/prometheus/configmap.cue"
									exitCode: 0
									output: """
											package kube

											import yaml656e63 "encoding/yaml"

											configMap: prometheus: {
											\tapiVersion: "v1"
											\tkind:       "ConfigMap"
											\tmetadata: name: "prometheus"
											\tdata: {
											\t\t"alert.rules": yaml656e63.Marshal(_cue_alert_rules)

											"""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "cue eval ./mon/prometheus -e configMap.prometheus"
									exitCode: 0
									output: #"""
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

											"""#
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp frontend/breaddispatcher/kube.cue ."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 1
									output: """
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

											"""
								}, {
									doc:      "# set the component label to our new top-level field"
									cmd:      "sed -i.bak 's/component:.*string/component: #Component/' kube.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm kube.cue.bak"
									exitCode: 0
									output:   ""
								}, {
									doc: "# add the new top-level field to our previous template definitions"
									cmd: """
											cat <<EOF >>kube.cue

											#Component: string
											EOF
											"""
									exitCode: 0
									output:   ""
								}, {
									doc: "# add a file with the component label to each directory"
									cmd: """
											ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

											#Component: \\"DIR\\"
											" > kube.cue; cd ..'
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      "# format the files"
									cmd:      "cue fmt kube.cue */kube.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 20"
									cmd:      "diff -wu snapshot snapshot2"
									exitCode: 1
									output: """
											--- snapshot\t2024-04-24 11:03:56.343865776 +0000
											+++ snapshot2\t2024-04-24 11:03:56.623865919 +0000
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

											"""
								}, {
									doc:      ""
									cmd:      "cp snapshot2 snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											 1833 total

											"""
								}, {
									doc:      ""
									cmd:      "cue trim ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											 1266 total

											"""
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -wu snapshot snapshot2 | wc -l"
									exitCode: 0
									output: """
											0

											"""
								}, {
									doc: ""
									cmd: """
											cat <<EOF >>infra/events/kube.cue

											deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
											EOF
											"""
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOF >>infra/tasks/kube.cue

											deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
											EOF
											"""
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOF >>infra/watcher/kube.cue

											deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
											EOF
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											 1132 total

											"""
								}, {
									doc:      ""
									cmd:      "head frontend/breaddispatcher/kube.cue"
									exitCode: 0
									output: """
											package kube

											deployment: breaddispatcher: {
											\tspec: {
											\t\ttemplate: {
											\t\t\tmetadata: {
											\t\t\t\tannotations: {
											\t\t\t\t\t"prometheus.io.scrape": "true"
											\t\t\t\t\t"prometheus.io.port":   "7080"
											\t\t\t\t}

											"""
								}, {
									doc:      ""
									cmd:      "cue trim ./... -s"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "head frontend/breaddispatcher/kube.cue"
									exitCode: 0
									output: """
											package kube

											deployment: breaddispatcher: spec: template: {
											\tmetadata: annotations: {
											\t\t"prometheus.io.scrape": "true"
											\t\t"prometheus.io.port":   "7080"
											\t}
											\tspec: containers: [{
											\t\timage: "gcr.io/myproj/breaddispatcher:v0.3.24"
											\t\tports: [{containerPort: 7080}]

											"""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											  980 total

											"""
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp snapshot2 snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "diff -wu snapshot snapshot2"
									exitCode: 1
									output: """
											--- snapshot\t2024-04-24 11:03:58.647866959 +0000
											+++ snapshot2\t2024-04-24 11:03:58.727867000 +0000
											@@ -190,6 +190,7 @@
											                 metadata: {
											                     annotations: {
											                         "prometheus.io.scrape": "true"
											+                        "prometheus.io.port":   "7080"
											                     }
											                     labels: {
											                         app:       "host"
											...

											"""
								}, {
									doc:      ""
									cmd:      "cp snapshot2 snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim ./frontend/... -s"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											  938 total

											"""
								}, {
									doc:      ""
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp snapshot2 snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim -s ./kitchen/..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "# check differences"
									cmd:      "cue eval -c ./... >snapshot2"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis"
									cmd:      "diff -wu snapshot snapshot2"
									exitCode: 1
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cp snapshot2 snapshot"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											  785 total

											"""
								}, {
									doc:      ""
									cmd:      "cue cmd ls ./frontend/maitred"
									exitCode: 0
									output: """
											Service      frontend   maitred
											Deployment   frontend   maitred


											"""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "cue cmd ls ./..."
									exitCode: 0
									output: """
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

											"""
								}, {
									doc:      ""
									cmd:      "chmod +x $HOME/.bin/kubectl"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export PATH=\"$HOME/.bin:$PATH\""
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "cue cmd create ./frontend/..."
									exitCode: 0
									output: """
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

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
