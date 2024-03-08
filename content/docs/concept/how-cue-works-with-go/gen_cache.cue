package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"main cue":               "ciGvrwnnmglvstbp6TIP7uxP+orV7nMjaRwM7DC9tvQ="
								"cue load sample cue":    "dqqRzZaVgsrNMpKa96RhqciNOxSq6496gM8Yvw4o1uc="
								"load cue main":          "uZ+Z607WKT33+V6YK8BmyL4WXZOXuDHgT6pKktK6XyU="
								"load non cue yaml file": "VcLWCfqeBiCDeaaq4D/eI6l0GeUWMvUqmiKuDJp2JZ8="
								"load non cue main":      "3LzEn1LyAywMc9xgYhVEO/XzNkm1LX6Qu5VNdwcKToU="
								"checking go schema CUE": "T5j9kmLPQWU6HoS+KiZOG0p+RJH/KWhBciDVtfAoLRs="
								"checking go main":       "etvF8YlBGe021vCJ88Q5OeKJs+N3En0Cpsudg77I+qk="
							}
							multi_step: {
								"I640J209A7LP4EITI0HTP9BKFN1MJK2MTA1LI0U8OJTRJC2H5CHG====": [{
									doc:      ""
									cmd:      "export LC_ALL=C"
									exitCode: 0
									output:   ""
								}, {
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
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get k8s.io/api/apps/v1@v0.29.3"
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
									doc:      "#ellipsis 20"
									cmd:      "tree cue.mod/gen/k8s.io"
									exitCode: 0
									output: """
											cue.mod/gen/k8s.io
											|-- api
											|   |-- apps
											|   |   `-- v1
											|   |       |-- register_go_gen.cue
											|   |       `-- types_go_gen.cue
											|   `-- core
											|       `-- v1
											|           |-- annotation_key_constants_go_gen.cue
											|           |-- doc_go_gen.cue
											|           |-- register_go_gen.cue
											|           |-- types_go_gen.cue
											|           |-- well_known_labels_go_gen.cue
											|           `-- well_known_taints_go_gen.cue
											`-- apimachinery
											    `-- pkg
											        |-- api
											        |   `-- resource
											        |       |-- amount_go_gen.cue
											        |       |-- math_go_gen.cue
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue eval ."
									exitCode: 0
									output: """
											service: {}
											deployment: {}
											daemonSet: {}
											statefulSet: {}

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.8.0"
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											{
											\tl: [1, 2, 3]
											\tv: "hello"
											}

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.8.0"
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											Your YAML was ok!

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.8.0"
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											Your Person was ok!

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
