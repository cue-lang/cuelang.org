package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "CIxtTIQ76DMT3DmSJivSGjE1Seyy8JciyIdy4WogDWA="
							}
							upload: {
								"baseline input":   "8q+Sky4EjcAEJmoraNQZ5F6nTmBwH5zCex4zUZ8VsKs="
								"baseline output":  "6HYuHPJDyTsyuQ/FrIxSkLfEw5U7eSrG0BIHXRSWovk="
								schema:             "XdvaLaekKDsIKCzmCQRDyR5h92r3vW8PpulFdIDZm4M="
								"schema reupload":  "spKzWkimJj7DtbtUQTY2TqFgpwnWXtzGorxVExqAAok="
								"schema output":    "Qcdrb8SBFsQ7m3IxDsThu7q/1sTeRQKjJoPRCOOWMP8="
								defaults:           "+9EBzKRSps0Xq3T2HSXoSuZpoyDfPwDFdZHAvBwDdTo="
								"defaults output":  "oX04yfryS4vpk3imX3T7x78Bl3qq22g404o3cOnYFaE="
								name:               "MTVfcgl4GggNR585CF5egpVDxAJACMFIfT+iFn9EdpI="
								"name output":      "MqUoFgKWu1HeELqOW9PtAkmMlg8bEZx6kND/Zy9fNrc="
								"extra app":        "3XOq0Pytnn/A6lt3jfr7p6YkrNda9vuFV+wxcKPRysk="
								"extra app output": "4bJL+SOYQTVdP/F6AWWjuL5oo0USeBhDOgPD5n/ekp4="
								"pre-trim source":  "Cflysyv0yDazMqHuRWVXVk/nebKjh0SKTl2qwE+xp2E="
								"post-trim alpha":  "3R5frS7R8lEL8XH5bATsUlSQ1IN1TmY4iAO17mdXUEY="
								"post-trim beta":   "fXT0R1fw3eCNpZEHZFs132J6eJKLI1U2TobyBOe+27U="
								"post-trim gamma":  "ujKDcDtGFSV/LdlAobA0MGU41nf4pkAlZbd00l1l1dM="
								"post-trim output": "xRJOtKosEDkEjKGUu9U19X01hth28AKc4dmpUagrhPM="
							}
							multi_step: {
								hash:       "HI25O5S6S7KG05ETLA5CAVLCBTTUFGVFLIJAKVKOQOOIH64CSDK0===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
