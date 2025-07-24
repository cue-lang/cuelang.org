package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "FEDYr2kPmcrtFIFyMUYOz+eQYsWiKAO/eZ9qQ40AzOc="
								"initial go code":  "sIwjI7mh2MNZlA+GWvh4VJ+GjtkU3Xo7qIp6ydX2DJA="
							}
							multi_step: {
								hash:       "JR3EVARSQJEIVSLFM3D6IEMDSVE7QKAJSFOCFN14GL8HGJ9T2PBG===="
								scriptHash: "S09SDHTKIH345768JOFVFVF5K40KMKJAVIG2QG5TLF9R2CF31J9G===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-rc.1.0.20250724155554-6d101321cb41"
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
