package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "kK1k+DuYAfQMT6yUy0kRC+ql/J9JcrCbhAbLI6EBhIw="
								"x.cue":        "kDFm+fevKLBpIJNK0K8owrz6m8twDiNxBpPXGS1bZqs="
								"x.json v2":    "ExVMESv+9NKsVL/PUAC9/dDtHsXKbRTzBZPhws/4vo0="
								"fixed x.json": "HBtiuaNMukM50kkjvM22MY1HXRbGC2pc0QnhJW8aDCg="
							}
							multi_step: {
								hash:       "68GF71KFGR0LM6DUIHKU6TVDU2D4OKDLCL3J250BGRFCM4IBCO50===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
