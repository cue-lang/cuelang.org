package site
{
	content: {
		docs: {
			howto: {
				"walk-schemas-using-go-api": {
					page: {
						cache: {
							upload: {
								schema:       "gfpseVbiCmak0IxKGXP/NBsUTMNpTGfQH8x3GRToL6s="
								"go program": "1SzKj8mjtWW2PFdVvQkSvGsbN/2EhskFJPQWu8eVRfA="
							}
							multi_step: {
								hash:       "ODAU12IDH0LU84SN49GCFJETG4CEJRQ8DNB6Q3LHC4B435FQK3LG===="
								scriptHash: "MO62G59LQ7VSIEE4QT0MLR1NOFT9JHKQ714T0667AK8JLNG4DSMG===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-rc.1.0.20240606084806-889da91cd963"
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
