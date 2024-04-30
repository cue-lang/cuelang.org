package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "rOtkBylMWQbQg0hOf3YMHRUVk/Hjtg6OQlE+deuUs3U="
								"config.json":   "9VElBv5JR05ZQEnJcdDWXRBXvYJGszzeQOSOj2d7BBk="
								"generated cue": "1/KcOIZTF5Z7/zdUD4ZKY8yKVSZqe0aEs/Ib5r+1woA="
							}
							multi_step: {
								hash:       "BR4O5RMPSTS83AGL7D3BU7HTDFQLLI3VON62TFIEJD9UMIMUIGVG===="
								scriptHash: "QFS5OUV0NDBU6QA2J1N1LVQINQCJ5C8448NFLQ1TR2DT6DDJROPG===="
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
									cmd:      "mv main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#Config' . config.json"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
