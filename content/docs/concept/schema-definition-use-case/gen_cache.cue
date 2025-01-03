package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "qiET7upMFmuwN7ouiNbnpKMOds0VreqCMsFSoWIGnio="
								"api-go":  "wnLfNTtADjmq9RO2mFXi3l1Jzvjr1UR5BjcHcVvnFVM="
							}
							code: {
								"openapi-comparison": "ZaY0QpKLSGqpXB5NKN1ZS8r+5AhgDSe8Fv+GD7oNhwU="
							}
							multi_step: {
								hash:       "V00CB5PMSL8H1BTBB6KF542EFO4PIALFT01TTV7LAP84MHANVA50===="
								scriptHash: "5LE3J9ID6RC9IE4N05DQTDHU13IL2MBR7U1SIE2079GDG1532DD0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-alpha.1.0.20250103143946-3f4e72d4d171"
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
