package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-go-dependency": {
					page: {
						cache: {
							upload: {
								"deps.go":     "VAdEy8f51wU9FZ+nRQTdxCXBcjVSwsGHhRrzOcqKFow="
								"example.cue": "Bk21xqEtXv8gVe966dQwxgRvaOeots1KDiK9odjmeFk="
							}
							multi_step: {
								hash:       "EU0NHA9K4P1HA3KJ3QU45C229QRH1LG1F5G812HFGRT6KHOSSM80===="
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
