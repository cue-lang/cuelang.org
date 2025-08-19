package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "SBdJ9Zk5iqRy4K3FP2WZ2rVXqj9SD6/CxXossoQT+W8="
								"config.json":   "H8kGWrl/WLQy6/E4hCNI8l0eYLi6u8n9rcbnNyAsgIE="
								"generated cue": "4z/wAkWHODogXM+s/pX/F4yt2xXAPlSG8Vh9RuhplCk="
							}
							multi_step: {
								hash:       "L0NLT70OUQ6QMPD7A7FD0763FJEI68VB2LRRR6D6QQ91UNPM9E8G===="
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
