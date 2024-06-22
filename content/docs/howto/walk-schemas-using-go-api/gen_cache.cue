package site
{
	content: {
		docs: {
			howto: {
				"walk-schemas-using-go-api": {
					page: {
						cache: {
							upload: {
								schema:       "02laaoRDjLPODTmK7VameQu9TU1yVKMD1Oy3/IN3hd8="
								"go program": "DA9+ZIPSCCZcizOFw6PjyjtG0gIG4M0cbQF1Z/FZ9IE="
							}
							multi_step: {
								hash:       "JA00PC60ODH9USNU8M67KCARBV4407AJSIPGMDMQ5BFSV38A4JV0===="
								scriptHash: "8FAO14UBQ6KBK5UQRVC6482AAB25LV9I8BMBPIKB4RPR2MLB6DA0===="
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
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.1"
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
											package p

											type Person struct {
											\tname string
											\tage int
											}
											type Address struct {
											\tline1 string
											\tline2 string
											\tline3 string
											\tcountry string
											}

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
