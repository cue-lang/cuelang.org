package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "OtH/cGJki13mbYzoz/aQDsgPw2IowHfDn5SmyT/U+Rc="
								"config.json":   "G0xMdfQykxo+tz6kcOtY6+rLWS4SWOPKqonfbSfTNEY="
								"generated cue": "mxDzDasTJ3QHKkKVW1xuC3sRGWoo/JNacy1vwo9av5U="
							}
							multi_step: {
								hash:       "JNIB8CBSNMFT7R6739N7I830FSS1U1E1Q4OD2RA7KTOHHN09AKCG===="
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
