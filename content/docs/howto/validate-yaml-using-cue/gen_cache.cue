package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "FPfuWVIZlXR+dMMkvUCl/yruTe2PrTVbdueKrykL0JM="
								"initial x.cue":  "SuZyJpG1UFqF5/WagOhiYmjdCM1vrsc5bSwoF4A7eLc="
								"another person": "ID+Zl9LYXPJDLCJQrABfTnBynAKsMVW3DDu9KZMzC+o="
								"fixed yaml":     "kBn1pUMIbeJMpnREmzpaJ4nuhUMzDWrSixnqubJ8VbA="
							}
							multi_step: {
								hash:       "FM506UGSL95P4MI2ODS25GL9J7G8NV68F809HJP845IBM77GNFRG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
