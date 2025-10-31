package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "0UPLZ9sjJVN5c7eSa7fs6/5Zrhbz/sIi/YjOYJhGSJU="
							}
							multi_step: {
								hash:       "A1UL481JR2623RQ47HKG7NJRBGTUGFGL4BIGTUF7PPG343G82B60===="
								scriptHash: "S4V6D041S2G9K3A2I96ROVFBU84MA43OB5DFF8FR99Q8HJAABLI0===="
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
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.15.0-rc.1.0.20251031142455-4ba957271db1"
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
											good: ✅ ok
											bad: Action: 2 errors in empty disjunction:
											Action: conflicting values "Allow" and "Bypass":
											    <field:>:1:2
											Action: conflicting values "Deny" and "Bypass":
											    <field:>:1:12
											Level: invalid value 5 (out of bound >10):
											    <field:>:1:1


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
