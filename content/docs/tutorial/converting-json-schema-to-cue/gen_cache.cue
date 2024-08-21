package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "EIvhk4+5yGvU5f8fJOXJClMPsi1k5HtQ3XxYtIbJVPs="
								"schema.cue":         "Uiye1D5IQbbFyv7dTpLWG+2Lu+esTMrysJplAI17TpQ="
								"split_pea.yml":      "Gqr1pjESokVcXtykOUTP9rXF1aUm2JSmdhR1WyOdmK8="
								"pomodoro.yml":       "n/5huWFI42IM6xPJSqgZkORJuz0lnM1bEjAejIZBdfo="
								"pomodoro.yml fixed": "f6OO5Pa19CMXbZtuORJsi/kJPVVW3uEuNg317h888VI="
							}
							multi_step: {
								hash:       "8P1I0VGON4590R65JKGLACDOFUE8ACV71N1ASB8J444K29R3M0RG===="
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
