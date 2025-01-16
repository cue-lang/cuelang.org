package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "zihcdg5CB+wwEC7niAl3+UIdKHw7EDQE4hJ+BW66Q8Y="
								"schema.cue":         "TGh1SOusg/wqjucUnERx7ENPPNGjNcr1635lL33bwM0="
								"split_pea.yml":      "DHsvOY3i/LA16+KwpctSCHkNPwAQ2sB/AbENKAc7dos="
								"pomodoro.yml":       "t7V95EdgZvpRCZ7OevapE9mvHJmLuleD+6I5hgdH3dQ="
								"pomodoro.yml fixed": "ZPR3uIptuOvJSxfQyUOG5PrgZ09jO3b9sxbu4rjB5gQ="
							}
							multi_step: {
								hash:       "DO0MTEVUUP0HSHAF7JTFBFKD6U3RDCAUDC1PH0EGMCFCU0524A80===="
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
