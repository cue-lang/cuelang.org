package site
{
	content: {
		docs: {
			howto: {
				"validate-go-cuego": {
					page: {
						cache: {
							upload: {
								"main.go": "AeOnok0YuO6RaaZi+jl6rE1R1ByHgdIZNiJaMKLHNMc="
							}
							multi_step: {
								hash:       "VMI9EAEQT325UKCL295VO0QQV8JGOIH01ADE13H4H4G3QUD2IHD0===="
								scriptHash: "DNHGE5N9Q7IA00DH9214R4ILDPT9D7ILL7R76K8NN2CP3QV3HDPG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0"
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
