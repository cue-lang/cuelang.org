package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "mwyzp6r8nKxjQsqOa9w3Js8+JiyKKo3QIgZukM3DY7k="
								"good data":  "24Ck5E2h30kNYD7engH0gVvMkn3sC4AxXbOvMw2R/w4="
								"bad data":   "AF6nkOzv7XUwPGWzqv3F4kvALvsZ7vzqBMSW/DSiXBg="
								"main go":    "6T+IFdX/Kb0XrcKAAK/d4mQZOmzBnAOTDMpKbLfRuTU="
							}
							multi_step: {
								hash:       "VBPOAS4ELS46ICIHPT70H9R04A82IIKISFH4GB12KJKC9EVM4IJ0===="
								scriptHash: "16VFEQF68PR5P72B3QDIP0SQI1DOL1C8C91K0M97NRQ1D4KDQFPG===="
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
									cmd:      "cue vet -d '#Schema' schema.cue good.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#Schema' schema.cue bad.json"
									exitCode: 1
									output: """
											age: conflicting values false and int (mismatched types bool and int):
											    ./bad.json:3:12
											    ./schema.cue:3:9

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
									cmd:      "go get cuelang.org/go@v0.8.2"
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
											main.go:42: #Schema.age: conflicting values int and false (mismatched types int and bool)
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
