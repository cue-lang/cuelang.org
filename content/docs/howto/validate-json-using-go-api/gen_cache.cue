package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "vAyBXPOdztrW0HuPWbf3op6pdq9SGd9GZcr4GreWDRc="
								"good data":  "xzTdGX+Cjm40VSvP8VUD7iIutv87Cm9zZkpWfMYEKco="
								"bad data":   "zdPOG3//I6P2PVLXQyCnd1ACvAZR8TCL+9/JHMquaYo="
								"main go":    "Pmr8F6XlKstEn6LuSqz4yemH6JLwWdec1ISl7SLbN/s="
							}
							multi_step: {
								hash:       "FKM1VHPFP69HMK7VJ8D4I000H9JRAMD07HO3UJVEGJUELK4RDIT0===="
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
