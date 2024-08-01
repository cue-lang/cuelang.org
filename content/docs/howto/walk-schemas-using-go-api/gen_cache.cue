package site
{
	content: {
		docs: {
			howto: {
				"walk-schemas-using-go-api": {
					page: {
						cache: {
							upload: {
								schema:       "Cr1JLnWgMzT5MZLY61DPT2AkKXpIUoUljdMUAaqBqYE="
								"go program": "NeB2LYZL5TUErabxYf7OejzF+3Cr0DdhZLkjteoNZjs="
							}
							multi_step: {
								hash:       "T54LV97VE7D7V0DKKL05N5EIA983KD07MMD8PBOOFGGNNP18688G===="
								scriptHash: "DA8L4SP08QKMBSB9VM3R5Q9CLNPCRAQQ7592640U0VLPRTSCQFR0===="
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
