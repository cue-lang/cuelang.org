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
									"default output":             "w/Qh4HvKOtXYHzBEF70qRNWhGXcOsAu+YsjiHtXC3HM="
									"stdout yaml":                "fSk73IrJUGNuJ/2zefXlw7EvNUbGo28DX4M9+BvvX+Q="
									"yaml:-":                     "wqfoa8A6enqK1dBLFJyrZtbgWNwgRAjtNA7If3WiabM="
									"--out cue":                  "jVYN8qfdNA6KOsILADTpFcbBp1rhLBcvvrAEnDBhdOk="
									"--out cue no hidden fields": "LFyr5sBd8QNM/ACf3Z/a/DCxdjPS0Pu8208966SLILE="
									"--out cue --package foo":    "g/x3GQrn28y+ZnyBE0ZZIz8sNlnY6RQa5JpXW+ttE4A="
									"--escape":                   "XtL4YtfKreeBvUkSmHwdQpbsrUFHRtTFaPqCF61YIfs="
								}
								upload: {
									"--outfile data.yml":            "5hC4wopH8H66fhASZALphpojDxbffqCrfPUhk5DzjWw="
									"--outfile data.txt":            "GJYMDWpm5YPMZetAuKH35kew1qbBbhl6WZAbDU/BM9M="
									"--outfile datafile --out json": "a0Ota72udKYkr00G20jVYAgiA8LPAGDVi0AdgQN2cAs="
									"--outfile json:datafile":       "YzRZ3XAng9R5kcj5rnRkdVr3n7ARzu0jxY2z7EBY41Y="
								}
								multi_step: {
									hash:       "DSBG1O479P0N6NUR3HRI2PKH4RTR3DB817AV1TFEKCS0G83P4OIG===="
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
