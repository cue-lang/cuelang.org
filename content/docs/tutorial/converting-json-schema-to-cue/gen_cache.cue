package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "v4BbDLEJRVuXhPL3pi2eiHdbzk1XRM+5p3LSVzI23g4="
								"schema.cue":         "AswruqgIUruMdT4UziZMA39YpuvhDecMKnT6pLtF/UQ="
								"split_pea.yml":      "hMlaRF3wPxmMZ1YXHxs3389ouYgomzvpgVsIEO8Wg6Y="
								"pomodoro.yml":       "SohLi3ZKfpoCnEui802KVU/SQkYXAHJmDiwOi2kUg7A="
								"pomodoro.yml fixed": "+Q/QyRX4O9h0hT90ibUYFfvuDVoL1Hhq/3S4o0FLF74="
							}
							multi_step: {
								hash:       "R9RIIA709QA1PIQBSDKITGE869QBQPDP8UDM29HPA5S5ETF5IFVG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
											    ./schema.cue:10:17
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
