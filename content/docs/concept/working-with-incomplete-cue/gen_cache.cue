package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								"example.cue": "lSc4mQOVt13ucRCN8PW9lvC2rWsKYxeLUDqYiH5Fyb0="
								"data.yaml":   "Sm4bavm+gyoOANH83xv7b1yizv/QDycwh+P/ljI6mw8="
								"main.go":     "2Vp1JchkoEcbNvo3MzItekAwLTG8qQt5mj+0kUsqtDc="
							}
							multi_step: {
								hash:       "FKP56SAUH1G1HQLSP563358UF806RKVQ157STQ1S933NTOF6406G===="
								scriptHash: "HM5OAK3S5DEHBE2F2P3BE8VR7MAC4AA5N8HDRLVT0DO9PA3P8C70===="
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
									doc:      "# The example is valid CUE ..."
									cmd:      "cue eval -s example.cue"
									exitCode: 0
									output: """
											A: b: 2
											B: A.x + 10

											"""
								}, {
									doc:      "# ... but it can't be exported (just yet!):"
									cmd:      "cue export example.cue"
									exitCode: 1
									output: """
											B: undefined field: x:
											    ./example.cue:4:6

											"""
								}, {
									doc:      ""
									cmd:      "cue export example.cue data.yaml"
									exitCode: 0
									output: """
											{
											    "A": {
											        "x": 5,
											        "b": 2
											    },
											    "B": 15
											}

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
									cmd:      "go get cuelang.org/go@v0.11.0"
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
											step1: {
											\tA: {
											\t\tb: 2
											\t}
											\tB: A.x + 10
											}
											step2: {
											\tA: {
											\t\tx: 5
											\t}
											}
											result: {
											\tA: {
											\t\tb: 2
											\t\tx: 5
											\t}
											\tB: 15
											}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
