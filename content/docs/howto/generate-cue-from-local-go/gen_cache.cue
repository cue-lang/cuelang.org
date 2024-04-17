package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "nDTYzcfGia+ugUMMtFBe3qHBSteL+zC/RtfDkfxHlLk="
								"config.json":   "omIRLBks/xfQyxd7iaeJbr92DCjfvYA2h8XPrSLDjSw="
								"generated cue": "rCyQ0sZrYlzWeYC1fmY/62ox6Lrwv05oCJyFDETefp0="
							}
							multi_step: {
								hash:       "Q8D1VR6AIO3HLBKPM54ASIVLKRA4OAHI57SBGJ6R2CI9F519OJ10===="
								scriptHash: "UALN1KAJMAC5LIQKF20HRLQCFNP9M09L0KFMADNIT10IOEF5PJJ0===="
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
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module mod.example

											"""
								}, {
									doc:      ""
									cmd:      "go run . <config.json"
									exitCode: 0
									output: """
											Your config is level: 42
											It specifies 2 vals
											The first val is named "cueckoo"

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init mod.example"
									exitCode: 0
									output:   ""
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
