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
								hash:       "73LHVA359064DFLC4833GSVLSMPGITSI73FLH27N0RGUMM2UN3CG===="
								scriptHash: "GDKIRP8KI7N6QV8BV02JOD5OJ9HSQ80NMNK77QJGH742TLTIFJAG===="
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
									cmd:      "cue eval example.cue"
									exitCode: 0
									output: """
											A: {
											    b: 2
											}
											B: A.x + 10

											"""
								}, {
									doc:      ""
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
