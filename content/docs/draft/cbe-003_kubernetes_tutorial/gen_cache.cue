package site
{
	content: {
		docs: {
			draft: {
				"cbe-003_kubernetes_tutorial": {
					page: {
						cache: {
							upload: {
								"initial template":  "vcAyskJl4uwp4WgI8J6beX+igumAqg/v7eDJjq2lBL8="
								kube2:               "9MCY4+Fzsc83IRTS48TmQKR3pwf9e8xRB7Xwb5hXqE0="
								kube3:               "fgGF+whxu1w7PGjZWl9cEJOlUCshgKlw2FdmS3NB6VU="
								"template frontend": "wcIhoptgYOl0CNwAgp66/ysLB5k6hNz60aN5KwoXKwg="
								"template kitchen":  "MRF9Zoq0zAwqvMxZY3nM2hQkNL5tReIBEA+d1hWku2c="
								kitchen3:            "hIusBzIse1/j0l0vue4ZJ8UIMSEfttczenawRxsPCxc="
								sous:                "XqHWkdgs44sC6be0/0XZNwvbSt6TlGK1HPOm2Ixx/I0="
								"kube tool":         "8kxwMyMwnd5DsGAXWp8dobBTHQCGMTAUGPf1oLcNVe4="
								"ls tool":           "j2QhWEbZ4yIXSweR/Eb5y1DIYnPVSPbsVIzux/Fb158="
								"dump tool":         "0NmDHre/FSYhMMQ4mKpS1l5kr9bsxRe5K13TZNOA8ro="
								"create tool":       "ZebZa890V/Y3WwfkxzR/Hn/+1t24evWIFjVA1cgu76w="
								kubectl:             "+7FVrykidZrRKTczJhA0UN1aic+aeiKX/Jx1WmWeaTA="
							}
							multi_step: {
								hash:       "I4FGPHRTJ320J6CJ0EHTAAAJSTQ7FOQL42STTSS9IMSDOBO38TJ0===="
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
											 1275 total

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
											 1212 total

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
											 1020 total

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
											 1005 total

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
											  997 total

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
