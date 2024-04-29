package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "BHnNGYiXJI6TT8n0RSW4sXUNAbdFQg+eedlpyCgm7pw="
								"config.json":   "h3qaZQaT0Zz0B3vWDYE5FBtto6harlhXolWrS8wYjv8="
								"generated cue": "6GkgwvAonkD3TU2JA1Ve24iQvLk09+Qg+AwFYKtunQ8="
							}
							multi_step: {
								hash:       "R414GTUEC99O01TBCN1BT2EA3TUOHCH2R2J7MO95EFPMN4D3O2M0===="
								scriptHash: "6UAAD66CFTGMM5THMP8M30PSBV83A7A2QAA97VU3GOEK86B3PL1G===="
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
									cmd:      "go mod init an.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init an.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat config.json | go run ."
									exitCode: 0
									output: """
											Config level: 42.
											Val count: 2.
											First val name: "cueckoo".

											"""
								}, {
									doc:      ""
									cmd:      "cue get go --local ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#Config' . config.json"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
