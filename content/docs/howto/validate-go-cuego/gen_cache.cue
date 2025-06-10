package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "B3rdFYSRCDCjJjujhd459KN9MqKkioFA6ydabQ8wxn8="
							}
							multi_step: {
								hash:       "3HIM0HLN97PABFAEMR62KV49F17A5M1ATOF7JBTTPMEPD6MJIRQG===="
								scriptHash: "N7TQ1KECDIIC7NDS3S10DN62LKSAK9JLCDVID40VT32LDID883VG===="
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
									cmd:      "go get cuelang.org/go@v0.13.1"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
