package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "tV5pLVxlT3Bx5D6cgeSGK3ONxwjyPFyTm5ne0TLCRhc="
								"initial go code":  "O0OPVwSEUnSkGt9avdpMb9UZHn862IggClswTxnd+VE="
							}
							multi_step: {
								hash:       "KO3RMNBCVI6V7CL3H2I1QSPHUPNT5ATQ1OL1V557N5FM9S277J4G===="
								scriptHash: "B4PAC1HTD2T3Q7D83ARVNQ15B0ECLEAARM7OAAR34CT90DHD2K4G===="
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
