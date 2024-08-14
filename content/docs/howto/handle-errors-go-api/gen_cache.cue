package site
{
	content: {
		docs: {
			howto: {
				"handle-errors-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "rYb5axLnzGUHacW0xPdaNXG/CYuftH1WQu+8C92bAbg="
								"initial go code":  "LeS7r6h9QPwtM/oUtDRCpzcL6CtqOcKuJfNwbkISFYE="
							}
							multi_step: {
								hash:       "057A5T5CNSF2V29LMKMCFOS4LMPJLH8D8E449LEAG0VL6R1O0JF0===="
								scriptHash: "Q0A73E5MFVNMOPFUU76Q20K9R3B974A9CN14R0LUJKELSC8CGEDG===="
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
									cmd:      "go get cuelang.org/go@v0.10.0-rc.1.0.20240814100303-dc3ba30322ca"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
