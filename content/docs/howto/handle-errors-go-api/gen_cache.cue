package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "GfEKdCNj2bgLLjZrIdsNZ4AGsiqiIWFUUqVzk6qvjK4="
								"initial go code":  "yaD0R+Lnn3sh3/aYwU1I2woSN/6jtoiZTQlZVORruT8="
							}
							multi_step: {
								hash:       "FA8QQT0CNNUOHBROGF5EEBRM2LTNFDHQRR6I45T544TCE2TDRDT0===="
								scriptHash: "GQPSKBFMU25GDM6TO1PO4FK2RC8KTFE88SRSOT2LQ631DQLBJMM0===="
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
									cmd:      "cue vet"
									exitCode: 1
									output: """
											val.i: conflicting values int and "hello" (mismatched types int and string):
											    ./bad.cue:4:5
											    ./bad.cue:9:5
											val.s: conflicting values string and 42 (mismatched types string and int):
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
											# Error summary [err]:
											val.i: conflicting values int and "hello" (mismatched types int and string) (and 1 more errors)

											# Error details [errors.Details(err)]:
											val.i: conflicting values int and "hello" (mismatched types int and string):
											    /home/runner/bad.cue:4:5
											    /home/runner/bad.cue:9:5
											val.s: conflicting values string and 42 (mismatched types string and int):
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
