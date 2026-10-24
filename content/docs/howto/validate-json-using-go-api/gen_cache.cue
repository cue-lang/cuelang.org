package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "iBG32WS6GxUKKiYFnyeWPET8fExSlMUHebGE8u53I9o="
								"good data":  "F2srGCod/DythoXu9VbGSYOSeHe4ztAkfLh1MMaGUuk="
								"bad data":   "esLu1rmYRrHo0gQPx8Y1FmVjRz8mIBDkqTXz8NBkAjo="
								"main go":    "t3kdyKpsJGgQoIJYBT6lGYOP78NBvEa3mxV8erWNBRk="
							}
							multi_step: {
								hash:       "8U227EG1A33R8IQL9LRFP62N8GIH61M2N6MN6TK4I4V2FE22PGV0===="
								scriptHash: "BVN64CBGLOFU7C61J4FDBBV46K07NLPHGCVH39I95GFG29D1V7O0===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c schema.cue good.json -d '#Schema'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c schema.cue bad.json -d '#Schema'"
									exitCode: 1
									output: """
											age: conflicting values "173" and int (mismatched types string and int):
											    ./bad.json:6:12
											    ./schema.cue:3:9
											name: conflicting values ["Moby","Dick"] and string (mismatched types list and string):
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
									cmd:      "go get cuelang.org/go@v0.18.0-rc.1.0.20261023142911-c9393fa32ac5"
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
											#Schema.name: conflicting values string and ["Moby","Dick"] (mismatched types string and list) (and 1 more errors)
											exit status 1

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "staticcheck ./..."
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
