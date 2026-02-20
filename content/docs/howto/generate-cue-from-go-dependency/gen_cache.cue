package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-go-dependency": {
					page: {
						cache: {
							upload: {
								"deps.go":     "qVH5JmqQVfNZS9i5wI2Oibykk0Kmh4ohTd2SILx0xkg="
								"example.cue": "97tWAIHf8ggUgi0yW++F2Lk+NsPqEGhGEGdwJbZyUmU="
							}
							multi_step: {
								hash:       "HO2MBFB302AOI5EALN9SV62IBSVCHG24H5NL2L7OBQ1NKG89SDGG===="
								scriptHash: "PF5DBCV9CI4E6HNDIBT29BMQD0R0SV7HNUUMU6JE3O5GC6KAUL20===="
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
									doc:      ""
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "staticcheck ./..."
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
