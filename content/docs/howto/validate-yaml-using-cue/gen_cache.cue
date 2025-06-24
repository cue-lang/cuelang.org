package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Fas2oMMSu5352ZXkJXRD+UPDpp4ScLlZkMLO3hLlyx8="
								"initial x.cue":  "AV4yX19YXQ3fAIkKAQMd+TaneqR7V5IkKKESy+0iKaQ="
								"another person": "sSuo4ER3QlAl0zVwZH1O/t6XDJbrXli9idQU2I/qjLY="
								"fixed yaml":     "JWY4VfGdeBhndDqA/SwY9QDatgdjwk7dXBSx4WMTSpE="
							}
							multi_step: {
								hash:       "RPT3A5LPD5484DK0M54HD6CCB724884IE0OUVI5QBRKQO3MAUOA0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
