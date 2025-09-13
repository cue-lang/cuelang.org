package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "T1RaSR8vqTOUxqmcEU1qPmQ9S5haU6+Lxz0gh1kGhaU="
							}
							multi_step: {
								hash:       "EBJUVOPNU62ND703JJ4VDU5064GTDD5R0201BTHLFI4T2GTOEAC0===="
								scriptHash: "5FHAO2418SBEH89NV2P087CD5KGQ9VL59R2IVT4U3UD3G960A2A0===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-alpha.1.0.20250913190050-8572198e1792"
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
