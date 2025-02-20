package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Gmng5EYzq50B2NLanD0x/mz/DOuEZoTbwT/cdtCKOd8="
								"schema.cue":         "schSe2pjPwvKX2nnBENqD3a9XneQPZWd89YhaEZR8dk="
								"split_pea.yml":      "/8OlE/SJwSNPHjGKrlRqJg+dDKV8Yc6WslE3btISbss="
								"pomodoro.yml":       "lupQf15ZgyrbLwoOIUVKCsB7GpxKWqPIpV8Ojhpl8qI="
								"pomodoro.yml fixed": "VKZ9IKbRjRPfWs1MCP+h4ft4YW/4N+RFXh1n3dRE+4w="
							}
							multi_step: {
								hash:       "T85S5AV6R48FM8DF49TO1HESJBBG8KCEAF3QUQ4BPD2EQLR8U5O0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
