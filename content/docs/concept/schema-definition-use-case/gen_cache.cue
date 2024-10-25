package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "3ejn2wQ9oXW8PbFM4SjtJ4EFLFrmFt1G4IUVf+bz58Y="
								"api-go":  "yfyqV2KC/9HaG04QXlCpwqeRiST/OAhccydJlJxNvho="
							}
							code: {
								"openapi-comparison": "G0IdAlmqIw0H7rdvoEK5H8fEwjqzvp4A+nzM3469bXo="
							}
							multi_step: {
								hash:       "3RLE7RUV382QAK06435HD544ILK9AVTJ64FTBECJRSIVHCRF834G===="
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
