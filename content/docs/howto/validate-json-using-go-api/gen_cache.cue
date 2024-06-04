package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-go-api": {
					page: {
						cache: {
							upload: {
								"cue schema": "LqY4lOuBGdOqEt7xetT7cM0EV9XH+4ODBP9NNLM6rg4="
								"good data":  "w+hs71d9ecAivv2jcZj/9oxgyTIF+OgzeC9vUBkCJuQ="
								"bad data":   "qAr9moC5M8OcNVr56CXWrVFNdie/9Z8G70DwzKISluQ="
								"main go":    "488trh1TqIw6JEeStm2uLOTO28WqlBAP66rE8Vlh9ME="
							}
							multi_step: {
								hash:       "J57P3B52Q2P88UP5SLF7UB73QPSARC4RQNF0EH356U7QMQ07SGK0===="
								scriptHash: "D7AL3UDDJL6UIBJ1L3ASO3RB5JHESRQ6II1N9R88SETKGSR84LI0===="
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
