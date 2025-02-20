package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "HnFCaP/CpewypnHkc4QQ0nNeVhbt1hwVAW1hkl0lMbU="
								"schema.cue":         "fhZ3ILoUdtn1GVRZCiekkqDqwvALVS1nsdDSSyXeSvE="
								"split_pea.yml":      "pwVnyvJHxE8P4A3IvRoEG+qSZwMKvRMBijiO55bB8JI="
								"pomodoro.yml":       "+L3VUQ9XU2Qfzr0iforllvuqs31tJZ6ChE2FoFYnUoY="
								"pomodoro.yml fixed": "hjTpCBOZCbLmIiZoLmR7mZyAH62ITv7GKw1jGxHdut8="
							}
							multi_step: {
								hash:       "AH475DS38KG11HF3A1U67KU6L1J7O5LMBS5TCEG4698IOIPGP9KG===="
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
