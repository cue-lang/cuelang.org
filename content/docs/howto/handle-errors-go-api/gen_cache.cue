package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "KM/tVC6GWpJQ+ak5/uYz3qVnPGWC7/o1FGt1QeEFtXw="
								"initial go code":  "Q5zTaoPl+XzGkgZg1w3C+86SEXTntUWY7vEpeUSCXpM="
							}
							multi_step: {
								hash:       "22TF9LJ9H834E9LISJURM6AM8FC1LRSD4HOV256DQO3T8GMR11M0===="
								scriptHash: "M1QOBP6ICMEGQRA2B4510PQLI1HB7OOVN2FJ1BSRASVUD60IPGG0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-0.dev.0.20241208100708-432c1141e6e7"
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
