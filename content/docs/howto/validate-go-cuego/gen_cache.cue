package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "nQTFC3idA7aPbL550RsUOVA3rTT6vrINt9YnD9hMp78="
							}
							multi_step: {
								hash:       "5EUEDFD1JKL1NVCVSL4QE5BQRTG1F1JGCHODAJO7FFKU6VJNGPIG===="
								scriptHash: "PFS09EA9LAL72BMA75LO63UMQGUA8EVJ31A2KS1T8A6OTDB30DL0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
