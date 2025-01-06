package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "1zfdPflinq8S22cTD6+81doCHT4yDUuPNVaTRAOzxsY="
								"schema.cue":         "mhIrm+JGJey3it9y04Au1GYABJVM25SnIrShVWis1TQ="
								"split_pea.yml":      "5XQ1k/CqgziasVRD6j3K+2GKPk96lsV2MRTTgrKUqms="
								"pomodoro.yml":       "k8jwH4T8+R3HLwvHvk9bKFfxWpl4sGRwDjxrDPx2NiQ="
								"pomodoro.yml fixed": "jKwACcqAVrPUmuKUsWNHlC8Oxhk8J4/tp5rzq3t1y4Y="
							}
							multi_step: {
								hash:       "ROFDS16EIAFICKOJ8PAKIH42F53G8F7EIGESSA56ITM874V0IH70===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
											    ./schema.cue:12:17
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
