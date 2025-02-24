package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"k8s-io-moving-from-cue-get-go-to-central-registry": {
						page: {
							cache: {
								upload: {
									manifest: "n4pJHJKw5zfhowHHPuK47sAvdS6s7v2W4E6gj80kHkg="
								}
								multi_step: {
									hash:       "F5GDIJ0JLCUVM71E52RNPG5CEICB94PDS7492IO1RS65EL59BJP0===="
									scriptHash: "5T9J3AA8PARBSSDBVOHSVDJSI38KD7FAGA3OILPEPKTGS4C3K7T0===="
									steps: [{
										doc:      "# Caches."
										cmd:      "export GOMODCACHE=/caches/gomodcache"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export GOCACHE=/caches/gobuild"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# Access \"cue refactor imports\" command."
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250220115648-09effdb2ae3d:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# Registry access."
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod init kube.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod init kube.example"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go get k8s.io/api"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go get k8s.io/apimachinery"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go get k8s.io/kube-aggregator"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue get go k8s.io/api/apps/v1"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue get go k8s.io/api/authentication/v1"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue get go k8s.io/api/authorization/v1"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue get go k8s.io/api/core/v1"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 10"
										cmd:      "tree -d cue.mod/gen/k8s.io"
										exitCode: 0
										output: """
												cue.mod/gen/k8s.io
												├── api
												│\u00a0\u00a0 ├── apps
												│\u00a0\u00a0 │\u00a0\u00a0 └── v1
												│\u00a0\u00a0 ├── authentication
												│\u00a0\u00a0 │\u00a0\u00a0 └── v1
												│\u00a0\u00a0 ├── authorization
												│\u00a0\u00a0 │\u00a0\u00a0 └── v1
												│\u00a0\u00a0 └── core
												│\u00a0\u00a0     └── v1
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue export --outfile manifest-before.yaml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat manifest-before.yaml"
										exitCode: 0
										output: """
												apiVersion: apps/v1
												kind: Deployment
												metadata:
												  name: example1
												  labels:
												    app: example1
												spec:
												  replicas: 1
												  selector:
												    matchLabels:
												      app: example1
												  template:
												    metadata:
												      labels:
												        app: example1
												    spec:
												      containers:
												        - name: nginx
												          image: nginx:latest

												"""
									}, {
										doc:      ""
										cmd:      "cue refactor imports k8s.io github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat cue.mod/module.cue"
										exitCode: 0
										output: """
												module: "kube.example"
												language: {
												\tversion: "v0.13.0"
												}
												deps: {
												\t"github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0": {
												\t\tv: "v0.0.0"
												\t}
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export --outfile manifest-after.yaml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -tyW75 manifest-before.yaml manifest-after.yaml"
										exitCode: 1
										output: """
												apiVersion: apps/v1                    apiVersion: apps/v1
												kind: Deployment                       kind: Deployment
												metadata:                              metadata:
												  name: example1                     <
												  labels:                                labels:
												    app: example1                          app: example1
												                                     >   name: example1
												spec:                                  spec:
												  replicas: 1                            replicas: 1
												  selector:                              selector:
												    matchLabels:                           matchLabels:
												      app: example1                          app: example1
												  template:                              template:
												    metadata:                              metadata:
												      labels:                                labels:
												        app: example1                          app: example1
												    spec:                                  spec:
												      containers:                            containers:
												        - name: nginx                |         - image: nginx:latest
												          image: nginx:latest        |           name: nginx

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
}
