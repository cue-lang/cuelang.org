package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-go-dependency": {
					page: {
						cache: {
							upload: {
								"deps.go":     "hlcDkuD14ASZxoFjy0/3iciSq4Suk9W3vdlzSbr7TpU="
								"example.cue": "x6j1JpHk9fCQz0lnnRVyI+xAbPo5gFDqudcbBkTpWFQ="
							}
							multi_step: {
								hash:       "B2NE3D5189N6H2CLH0PUPMEA4Q6U4L5PQPSQPE90ILCUACDNG2Q0===="
								scriptHash: "CN5VV8RD1CP4DU7D0I02KSLJU5MESQDV5BDJQ1D6LDEAQ0KICGSG===="
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
