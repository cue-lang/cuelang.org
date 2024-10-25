package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								"example.cue": "MaJMrxRuvu20eX4d41isSjsM+EvzBDawXaQfQvMqiM4="
								"data.yaml":   "02EB5v/qje5IArOU8nZztmockDKhlFbU8q0YaBTC67E="
								"main.go":     "2Vp1JchkoEcbNvo3MzItekAwLTG8qQt5mj+0kUsqtDc="
							}
							multi_step: {
								hash:       "H1BNEO34K78BJG82QT5FD8N6NJU9H6UVJ26DDL5SEBLB7D6PTUR0===="
								scriptHash: "DIR0PJ6PCIVCHO7K8KKGIVQ7B11B4GAEO5PSL5VK3241GHK46KVG===="
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
											    x: 2
											}
											B: A.x + A.o + 100

											"""
								}, {
									doc:      ""
									cmd:      "cue export example.cue"
									exitCode: 1
									output: """
											B: undefined field: o:
											    ./example.cue:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue export example.cue data.yaml"
									exitCode: 0
									output: """
											{
											    "A": {
											        "o": 5,
											        "x": 2
											    },
											    "B": 107
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
											\t\tx: 2
											\t}
											\tB: A.x + A.o + 100
											}
											step2: {
											\tA: {
											\t\to: 5
											\t}
											}
											result: {
											\tA: {
											\t\tx: 2
											\t\to: 5
											\t}
											\tB: 107
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
