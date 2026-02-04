package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "VvCbcMIFXM74S5PUVU54D585BGTWaty6KMrft3r0VRk="
								"initial go code":  "B+kP14kR2+MZEXwAQuIfcBI1PudJ41MR4j5X7rJEuDM="
							}
							multi_step: {
								hash:       "3LMFH4K84AU6H0OM3R5PUQCKCDS2MQNDO4NH3CDMJFKUCDQ83H50===="
								scriptHash: "F8PNEQ8QJMKP51LIJUF1QJ5AOQ7KLFG2E2B4V81EBEUGT016E26G===="
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
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c"
									exitCode: 1
									output: """
											val.i: conflicting values "hello" and int (mismatched types string and int):
											    ./bad.cue:4:5
											    ./bad.cue:8:6
											    ./bad.cue:9:5
											val.s: conflicting values 42 and string (mismatched types int and string):
											    ./bad.cue:5:5
											    ./bad.cue:8:6
											    ./bad.cue:10:5

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.16.0-alpha.1.0.20260204102828-049d6e12211e"
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
											# Error summary [err]:
											val.i: conflicting values "hello" and int (mismatched types string and int) (and 1 more errors)

											# Error details [errors.Details(err)]:
											val.i: conflicting values "hello" and int (mismatched types string and int):
											    /home/runner/bad.cue:4:5
											    /home/runner/bad.cue:8:6
											    /home/runner/bad.cue:9:5
											val.s: conflicting values 42 and string (mismatched types int and string):
											    /home/runner/bad.cue:5:5
											    /home/runner/bad.cue:8:6
											    /home/runner/bad.cue:10:5

											# Error count [len(errs)]:
											2

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
