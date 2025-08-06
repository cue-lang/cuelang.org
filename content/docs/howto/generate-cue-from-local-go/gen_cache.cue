package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "5cPnKN5iS6wexe2+Ikcy+GIkjupS3kPv8qrjBp+NO8o="
								"config.json":   "9Puww2Mj8wcWA78//2alXe8bWqev1qxAHgU5WtYmk8o="
								"generated cue": "rLVd2Xv4sumgUt9XO9RVMgKL6yFtaRSb3oL28q6jP9g="
							}
							multi_step: {
								hash:       "2V0Q1N0FEQC0R1MHS9FAO1TSOLNBQ58EMUEF9EF00U44PUVIF6E0===="
								scriptHash: "DF9MSVF3K3RQES8FHOGAE3T2H6R4UD144QBFLUA58NJSEFUPVUT0===="
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
									cmd:      "go mod init an.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init an.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat config.json | go run ."
									exitCode: 0
									output: """
											Config level: 42.
											Val count: 2.
											First val name: "cueckoo".

											"""
								}, {
									doc:      ""
									cmd:      "cue get go --local ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Config' . config.json"
									exitCode: 0
									output:   ""
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
