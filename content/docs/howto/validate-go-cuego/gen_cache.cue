package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "jxRQ6qIzYJBFb/OfsUH3pfHJP9kmpUXVTtFzjStl0Nc="
							}
							multi_step: {
								hash:       "QDA8PV5COA6612UTR0OQ6UI3DHS54LG8Q8VOM3UQ6L3FLTIDBA7G===="
								scriptHash: "2RCT4KGNF25L939J2ARCO4SHSU4VB9O8IBCD1S79O9LDBQL1GKQ0===="
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											good: ok
											bad: Action: 2 errors in empty disjunction:
											Action: conflicting values "Allow" and "Apples":
											    <field:>:1:5
											Action: conflicting values "Deny" and "Apples":
											    <field:>:1:14
											Level: invalid value 5 (out of bound >10):
											    <field:>:1:1


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
