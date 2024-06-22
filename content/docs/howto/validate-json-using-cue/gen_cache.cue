package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "tyo1LG6o50y9l20+B0FyEobvDfzuNyiE3hT5gS/ZVKw="
								"x.cue":        "Cv7SIov8qhqq3OPFq5FGXk4k81X5wTvBBPFr1imWdAc="
								"x.json v2":    "Om8Uxss2a6O7TJeKvSubCUfW8/biokfqv7L79I6/0M4="
								"fixed x.json": "Waybd0dYACMwwAMZMa9RExCllzGuaYhTWHjvn+wwTII="
							}
							multi_step: {
								hash:       "A5UIF0GDBCDIOA29SC96IP1JSTRJGM7QVG80BFV9JD54605M23QG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
