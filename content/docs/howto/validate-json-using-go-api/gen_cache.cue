package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "mgpgLrnQ6KlrwUUJTJAmvvhHFM2Y409x5g2Ay7tWpaA="
								"good data":  "MKelmLpd+OIYa2oSd+Ca+xkLWGgXdXrhq9fEzsmHXaM="
								"bad data":   "hXHQG/dHRsU7FKn50QXspOFPXn8mAsnVYF8bfj860so="
								"main go":    "xFGAy/B0ektZX7Qsf6vhOCWxNZfo4lbcebC113OGxCE="
							}
							multi_step: {
								hash:       "IP4J2PL1738DPFTH5NQDKF2MKR1QQEDR1K2GC53EEB5DDJI0EIH0===="
								scriptHash: "LETCV6KL4MA6NNFFTH01E5DSSA4JUK2IJJIOJ31IH60P2QNQ2TAG===="
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
									cmd:      "cue vet schema.cue good.json -d '#Schema'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet schema.cue bad.json -d '#Schema'"
									exitCode: 1
									output: """
											age: conflicting values "173" and int (mismatched types string and int):
											    ./bad.json:6:12
											    ./schema.cue:3:9
											name: conflicting values string and ["Moby","Dick"] (mismatched types string and list):
											    ./bad.json:2:13
											    ./schema.cue:2:9

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
									cmd:      "go run . good.json"
									exitCode: 0
									output: """
											✅ JSON: ok

											"""
								}, {
									doc:      ""
									cmd:      "go run . bad.json"
									exitCode: 1
									output: """
											❌ JSON: NOT ok
											main.go:42: #Schema.name: conflicting values string and ["Moby","Dick"] (mismatched types string and list) (and 1 more errors)
											exit status 1

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
