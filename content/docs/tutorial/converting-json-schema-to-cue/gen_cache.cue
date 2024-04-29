package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "7xHubZFeWrdtoUEto56RaFmwKPKsPK3o8gWkSrfdKE4="
								"schema.cue":         "SIGn3JaqjHhi51BIzfaM5bSOk/48d8Bfhh0/p0qHkrI="
								"split_pea.yml":      "afCbQFmVMa3ZobNbOnEiYzybsLokTzdt+YTTglnTT4M="
								"pomodoro.yml":       "PywIJ0lIkP5alS+qdn+20B6sQbFuv1IJl5KGfXfQDCY="
								"pomodoro.yml fixed": "imOBbaqhrgkvmML6CbhLydjtGhwJye06mxLlcBuLyfM="
							}
							multi_step: {
								hash:       "9RJQQFS8FBAO7LAHIOC0HTKUPPLKRF1D26VUHI3S1B8K0J10E88G===="
								scriptHash: "OQUP14DQ8I8FKJ0S0VRP0SI5U58HRFEL50109PSKG09LTMCM6BFG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
											    ./schema.cue:10:16
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
