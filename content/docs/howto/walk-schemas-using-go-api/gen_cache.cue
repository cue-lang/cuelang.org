package site
{
	content: {
		docs: {
			howto: {
				"walk-schemas-using-go-api": {
					page: {
						cache: {
							upload: {
								schema:       "oOsY08LlY/p+q7IW9pmTX3nQvXTiJqrV7VqUcYOWM4w="
								"go program": "Ck1ooDLlsHsAXW9zTSWUSS0aO/jnUis7RwBUlXc2PQU="
							}
							multi_step: {
								hash:       "ED942SPR2D7SNU0R1MSJ15OHJKIVHUPV13TDEUQMA3T83121IEH0===="
								scriptHash: "VOK2HR2O01C28N2EV1KURQ4PCE1DD67LVGH4BDH36STJKSP5S5IG===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-rc.1.0.20240605220750-a2292241985b"
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
