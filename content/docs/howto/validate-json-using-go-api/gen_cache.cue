package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "mldt/nQqvWNv9QYRJ4w1LH8EphD5vYXwsIedk6S35mM="
								"good data":  "P4w1K9eHqpLe5VyGhJG1Mwk1LqKV7+gVs2YwIQN1hEk="
								"bad data":   "gTPlOqGgdK1gg55kitOkV1efzWYPuo5ljWwoK+XHA/8="
								"main go":    "Nv1GGf4gzXHlz5SEUhGHbbfQANV5IUSAiP/Gcf1tPsk="
							}
							multi_step: {
								hash:       "GIUCGEQF5QP1NB6693J0DF03G4TJ7Q4E0U3CEJ460JGI3DD2KISG===="
								scriptHash: "0F4DIBIUP9K6L2EN1RSG06RL1SK3PHSP887TOOFVOHKH4H145GBG===="
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
