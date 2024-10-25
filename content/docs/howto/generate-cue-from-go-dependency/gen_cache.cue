package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-go-dependency": {
					page: {
						cache: {
							upload: {
								"deps.go":     "r3bIpR7M/1aSQmSW682koxTkRF0xy3qJg02K95l4sQM="
								"example.cue": "2dn8n2zRRADzJ6jn1pqt/7mkeU7+Eq7y4AlU0P5lWlg="
							}
							multi_step: {
								hash:       "P4AMSVU2P8I1IPBPIC96FCFIODA92SVJCJC30KBHOFSQUTBS5P2G===="
								scriptHash: "BU2K04AC6S5ENFVRE9ELG1FD8T7KRODO1BN7K9RKSIEU4I4D256G===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get k8s.io/api/apps/v1@v0.23.4 # \"@latest\" would also work."
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
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
									doc:      "#ellipsis 10"
									cmd:      "tree -d cue.mod/gen"
									exitCode: 0
									output: """
											cue.mod/gen
											└── k8s.io
											    ├── api
											    │\u00a0\u00a0 ├── apps
											    │\u00a0\u00a0 │\u00a0\u00a0 └── v1
											    │\u00a0\u00a0 └── core
											    │\u00a0\u00a0     └── v1
											    └── apimachinery
											        └── pkg
											            ├── api
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											service: {}
											deployment: {}
											daemonSet: {}
											statefulSet: {}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
									exitCode: 0
									output: """
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
