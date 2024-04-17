package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "xYW/iYsgnrb4hSP273/yHru7Pn8xsHGombGyz4/eFWo="
								"config.json":   "y5gQHms0UlDT1PoHgzQBKzSU7IM71iQpFzH0Po5UuF0="
								"generated cue": "+Q2v8MTGplH2kyDiBgzrZQ2zHwXd4L/FJ+1Dz5Y1OL4="
							}
							multi_step: {
								hash:       "7F05QPO01DQCA244I92VD7JJV4PSEGUTJQLVTTVLSE3GQU88DVK0===="
								scriptHash: "ATF726T51KNSKLTSONV35P6H4E9LQA6GLO0ILUHMFGKB5BTOFC4G===="
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
