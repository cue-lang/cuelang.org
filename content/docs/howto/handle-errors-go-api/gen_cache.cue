package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "lCaOAT+LMLlXEe0GC5rqHcLhpe3cPE33+9Gv1QkeidA="
								"initial go code":  "W1lnwS2d9e85mkyb3A0a1uXt4V1Z62g56BsqZUFqYGQ="
							}
							multi_step: {
								hash:       "NHGMCD6AC65B880C5JN0MMQD572E824D3HUB6KKP7V3JFICF8VOG===="
								scriptHash: "57BS5PIS4L7ECMKVH660VR0O2BK9AESDHDOC7BN0QQS4U2OCK870===="
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
											    ./bad.cue:9:5
											val.s: conflicting values 42 and string (mismatched types int and string):
											    ./bad.cue:5:5
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
									cmd:      "go get cuelang.org/go@v0.13.2"
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
											    /home/runner/bad.cue:9:5
											val.s: conflicting values 42 and string (mismatched types int and string):
											    /home/runner/bad.cue:5:5
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
