package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "xTUXe7iZE/pNPd9+szeUsE6ZKFewT23sVocb3kcFWOA="
								"initial go code":  "Z26jPssPvsL7fYV9F9LMy4Fi4JtnQEwGbMzsZsxLqqI="
							}
							multi_step: {
								hash:       "ALEFFD4UIHB4JLVNLSK7L6CCJ2UFO3JJ2MLQV46DJKFLFNKRUS20===="
								scriptHash: "DG4UQ2E3BMEGTHOUMOR9DAKM18U338NO5GPE18FO127ADLRE259G===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-rc.1.0.20251031142455-4ba957271db1"
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
