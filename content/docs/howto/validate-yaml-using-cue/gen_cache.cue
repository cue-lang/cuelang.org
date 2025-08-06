package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Rq7QYbFquLLNXjBNvYEppvC8J30kW/9pYONAJK6Rabs="
								"initial x.cue":  "xJduIXWQ4Ghm0yfivkjqX1+B4nBzWhxRjlBI+kkztRE="
								"another person": "6o1fahTbSbXxarypC4pKzU0jyZWHByC2GaPd04U4sfU="
								"fixed yaml":     "YxINFmgLo8dj5hrmsBg0h/R/jiwoGEnPeRZitJTYaZ8="
							}
							multi_step: {
								hash:       "03OUVKI3AJD18377KU7F5VOM00KLLVGS50EC41UPDNUH8MOKHVBG===="
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
