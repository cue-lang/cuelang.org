package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "r56aWgdsHiaS7P+ZLAGEHHBJNIGhxLaZxWmEn5Femio="
								"api-go":  "9wFrlXOp/9ZMR/oyHxOBUGGbGTcCdLcmQQtjFJLaW+0="
							}
							code: {
								"openapi-comparison": "dBHmiqKeiNgbPvp+uW6oJJpWUGO0sGnSw0+3ZxzphGA="
							}
							multi_step: {
								hash:       "2MIKGS0ESLOENU0D7LDEMAUIN8VRL0B16GINSGHMF2I3DV2S3MUG===="
								scriptHash: "V0AAELIOI6TT56E92KN0QRHGKACJGPR2ADHCE3D0CDKC24R0ELT0===="
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
									cmd:      "go get cuelang.org/go@v0.10.1"
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
