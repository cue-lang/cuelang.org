package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "WjEzMpX8mNpb+a7Dl7EISJFL92sY0FspYgjZxU7OymY="
								"api-go":  "QDn3pALLFyA/fZLsm3pYRuA/zDiJEG4gwyOBpfbairk="
							}
							code: {
								"openapi-comparison": "fAvRto2ZrzZsxhFePMoECSxs3ckeVEFr0Q/oSco/MvE="
							}
							multi_step: {
								hash:       "HPKQBK29MFJQCS0J60AH0FF10IS64QBH3GGTKHR0LOLL5FOQFRUG===="
								scriptHash: "D4HLH44BEJR50DNSD7NUB8A2D7ES4FUBP5MLKN322RH0GV3PF2N0===="
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
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.2"
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
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

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
