package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "DnU5+PgYkxv2BJfMtYNYNrbUtxZ0AbtSTalKJ3DBzVk="
								"config.json":   "+DkGKy0JHu/snxXrx+qvl2n85CQ25zahc/O4waOnMuk="
								"generated cue": "4QTC7HWx2PLI05cQrgRyDfX9fVxGkNBy8f0vwkj1fWY="
							}
							multi_step: {
								hash:       "S2T4F49RAM9T7B1D3C6225J6PTAMUFI61SHVVDTVOFSVT75804CG===="
								scriptHash: "0RQ8RVSNQUNNNMA2NE0MC219CD0QGKAAQ601JTFASE94NQCDRNJG===="
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
