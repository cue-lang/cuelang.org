package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-go-dependency": {
					page: {
						cache: {
							upload: {
								"deps.go":     "F5ofFVwcIqMOB0MJ3iliMk5ISJ5A5Wh2gfWIb3RRmYo="
								"example.cue": "degLF/bZIRFDW/yu5oPuyl3XAcfXYKcaBm2DniSPIzc="
							}
							multi_step: {
								hash:       "TKELNAQ27RH750K5R4PULJR7GHEI6LD36JUPTBGGSSCAUGQDO9A0===="
								scriptHash: "HL0BGQ7QI55CIU51GIHAESIGH9K0ITGG8DDHHG2BLBNJQHC95TOG===="
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
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init mod.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get k8s.io/api/apps/v1@v0.23.4"
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
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "service": {},
											    "deployment": {},
											    "daemonSet": {},
											    "statefulSet": {}
											}

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
