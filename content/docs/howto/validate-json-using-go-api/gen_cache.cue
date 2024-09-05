package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "1dqjMJeq8+6aViWSmPGUBnh0tf1VMrxCa0j0YYyR9uk="
								"good data":  "5Zs6sUq+JqsH9w8FCKOYmfNsIV3JhZ1svi5y04a3IzM="
								"bad data":   "UHZfr8t+h1143MzbM01pZOFiDdh7tqdSg1DAx1E6FvA="
								"main go":    "EiC2PVmQNT33naDfchAxVk4t4GhD7nSVu5F88l3Bhr0="
							}
							multi_step: {
								hash:       "88BQGC7HGG0LEV6SK96HCUOJE2LBN9P6B3V0C9JO2AJO2I7EH4A0===="
								scriptHash: "MFK1B9P1OSG0D7DKOG1QIPJL2PCD7J65GUKGFO2IGB1UB3HCCO40===="
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
