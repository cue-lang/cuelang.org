package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "+YNWbuQt9PeraY+p41FRzRnioaZD4d2lRQhtBMrEufE="
									"stdout yaml":                "uEamVsAKacH+eenZgT/zD2EyMAeoxs04qvdnnH8h/Xs="
									"yaml:-":                     "3XLU5AHI1wZdMflHciS38kn7SPPpkMmN6uGjOd/nwS0="
									"--out cue":                  "JQk0NxQfgYSh0F4m3c2CvcCBup3yJz7KCmhFW25HSKc="
									"--out cue no hidden fields": "VdUk+yJWiA7XHmflWRj0Jgzte/UUngfPTvavMFmYBj0="
									"--out cue --package foo":    "sKzlpmVDy7f3pbtPNS9D52XLVNG0DM0luUbjth03HwA="
									"--escape":                   "PGOVcNkt2AleY8ZVPoGmnh8WWmi0xHspYxVTM+U7Qqs="
								}
								upload: {
									"--outfile data.yml":            "XE/QeuiJfn2K3I1tw1mE4r9IR6B9d8sR1OTkQJ5yc48="
									"--outfile data.txt":            "h3VpDfntmMsaN8Bc49OAIWI2UsptiFUf3aCzeK7vBa0="
									"--outfile datafile --out json": "2LrRt1162D9n4x4WVy+9E8abMNd2EQsUKEH2/mXM5KM="
									"--outfile json:datafile":       "DIbUnXXjuWyQqmKNZ9qMHWCuqWRq47vZCm5CICntfGM="
								}
								multi_step: {
									hash:       "EVGAA4H9H09Q98D9H3JE1RD071C4844E00L2OQ845T52RPIR3M5G===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
