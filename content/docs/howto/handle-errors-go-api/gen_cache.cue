package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "O4PUKBfaMe3+aHbWTD8mlkEPGDi7qX0Fxk6t94AgMog="
								"initial go code":  "ytVIfCG65SMpLUsa0cX7EScMlhjbQmd+tp9vacXr/b0="
							}
							multi_step: {
								hash:       "H47H4MBQUO79I42PO9N6UJTETH99FBQV504IQ06ABR8RJC5ES81G===="
								scriptHash: "21TRKMNVSNJNK5VBUQVGC4UGLAQ25JPMVEIS9LJU36F8G84SVUEG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0"
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
