package site
{
	content: {
		docs: {
			draft: {
				"cbe-003_kubernetes_tutorial": {
					page: {
						cache: {
							upload: {
								"initial template":  "GOjhCjE0PMFcFeRDq6LKJse5spqefdDTe8U6HIbgN7Q="
								kube2:               "ccdJrFUHCguGKOIMPXU+aB7GV1VvpYHq/XUXQ+V/pb8="
								kube3:               "2HEr8V5lPZuiWEGF0xVvzdsdIqskAkErfoPezA+xGvU="
								"template frontend": "8uhtqVRe4LbNyXU3Kj0iE4RnBfAbQaRxgZoopdyroH8="
								"template kitchen":  "2VCkqBqeDhoO4wvc+d4Nm0ZjGf510xvgVFyhdsQ5bnU="
								kitchen3:            "jlYzKOTlA/zru4IHfy34AuZW5fCf/PejjwSEtOojQU8="
								sous:                "OP04Eisy35j6lldqBqlW9/BcwszzVkn9Q7vsJzqaWtM="
								"kube tool":         "DRcNvzkYsJkphZnkvRfWHcyi77wrF0Oit11nzgWkLf0="
								"ls tool":           "4oIBpoqX4JVmVHqmxjuBPFM1ZBNvT18liXRQsVpzMyA="
								"dump tool":         "0Yx6371iF/vIngNHN2q29k+cPlOIB5+5Q7ywVjSmKNk="
								"create tool":       "ddN05FqGf0c/oGRf9NDnZVbubStzv7WCYrkUoKMz+1E="
								kubectl:             "YjdhLaq02qOTUCPd1Y9c1u48VGQPh1p3awd8wBruaIk="
							}
							multi_step: {
								hash:       "89BQFIPNC1M1FBNSE5TTAFFB6AC9J6DQ2S2FB21RS84RRUJG5SN0===="
								scriptHash: "L2DE6E9PKJL1HVTL4RM43Q87A1098Q7DRNSC1J9KJ8HRP7VJDIK0===="
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

											import "encoding/yaml"

											configMap: prometheus: {
											\tapiVersion: "v1"
											\tkind:       "ConfigMap"
											\tmetadata: name: "prometheus"
											\tdata: {
											\t\t"alert.rules": yaml.Marshal(_cue_alert_rules)

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
											// k8s.example/services/mon/alertmanager@v0:kube
											deployment.alertmanager.spec.template.metadata.labels.component: incomplete value string:
											    ./kube.cue:36:16
											service.alertmanager.metadata.labels.component: incomplete value string:
											    ./kube.cue:11:15
											service.alertmanager.spec.selector.component: incomplete value string:
											    ./kube.cue:11:15
											// k8s.example/services/mon/nodeexporter@v0:kube
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
									cmd:      "diff -wu snapshot snapshot2 --label snapshot --label snapshot2"
									exitCode: 1
									output: """
											--- snapshot
											+++ snapshot2
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
											 1835 total

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
											 1277 total

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
											587

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
											 1214 total

											"""
								}, {
									doc:      ""
									cmd:      "head frontend/breaddispatcher/kube.cue"
									exitCode: 0
									output: """
											package kube

											service: breaddispatcher: {
											\tspec: {
											\t\tports: [{}]
											\t}
											}
											deployment: breaddispatcher: {
											\tspec: {
											\t\ttemplate: {

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

											service: breaddispatcher: spec: ports: [{}]
											deployment: breaddispatcher: spec: template: {
											\tmetadata: annotations: {
											\t\t"prometheus.io.scrape": "true"
											\t\t"prometheus.io.port":   "7080"
											\t}
											\tspec: containers: [{
											\t\timage: "gcr.io/myproj/breaddispatcher:v0.3.24"

											"""
								}, {
									doc:      ""
									cmd:      "find . | grep kube.cue | xargs wc -l | tail -1"
									exitCode: 0
									output: """
											 1022 total

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
									cmd:      "diff -wu snapshot snapshot2 --label snapshot --label snapshot2"
									exitCode: 1
									output: """
											--- snapshot
											+++ snapshot2
											@@ -170,6 +170,7 @@
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
											 1007 total

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
									cmd:      "diff -wu snapshot snapshot2 --label snapshot --label snapshot2"
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
											  999 total

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
