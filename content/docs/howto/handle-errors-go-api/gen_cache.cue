package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "8lMPrgDpzuXM1R65b8enY0BSh4tKWKQM+Lr6MSeKzSA="
								"initial go code":  "OKR0nzVPsWcrSxbkrt6OviCbpjtK1jpgKRpy/o3Kq+I="
							}
							multi_step: {
								hash:       "VHPIAGFQAVCS2TVS53ACINBAP41CGI3QBVO36D7R2BNUFVTKGBC0===="
								scriptHash: "T2NKVP5CMLISNHOVT7G54O59PBKCOUJN2TRI8H9EUNHRBOSKE490===="
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
									cmd:      "cue mod init mod.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 1
									output: """
											val.i: conflicting values int and "hello" (mismatched types int and string):
											    ./some.cue:4:5
											    ./some.cue:9:5
											val.s: conflicting values string and 1 (mismatched types string and int):
											    ./some.cue:5:5
											    ./some.cue:10:5

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											...

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
											err: val.i: conflicting values int and "hello" (mismatched types int and string) (and 1 more errors)
											errors.Details(err): val.i: conflicting values int and "hello" (mismatched types int and string):
											    /home/runner/some.cue:4:5
											    /home/runner/some.cue:9:5
											val.s: conflicting values string and 1 (mismatched types string and int):
											    /home/runner/some.cue:5:5
											    /home/runner/some.cue:10:5
											len(errs): 2

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
