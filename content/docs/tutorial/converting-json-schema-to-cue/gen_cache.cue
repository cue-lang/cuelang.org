package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "kzvP9qua0f6kDIUtcS06Z79dpqcnXpaPrPWEy4lk/Ds="
								"schema.cue":         "cTyExsBJ//h+ja0LtCkN5sxkIvX+chbFCpRc2k83QcM="
								"split_pea.yml":      "bpvebicdkXp54Gtb+hULMIU3FGnaLeO1mFdkzFbG7ew="
								"pomodoro.yml":       "ORN5hhw3KUIf2zZLQ6Fy5Z3rt2DYxtXb/RC1unwusus="
								"pomodoro.yml fixed": "c8COa28RbXcyGSeCMvnXgdVPUOcyB09OxEScxqHt6vY="
							}
							multi_step: {
								hash:       "6LOV9VJFBPI2VHJIBIRNV6UD0HF6TEU9Q4ESVM9N2KDA7QRVL0F0===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.3.0.20241024161207-80f4f236e293
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
