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
									"default output":             "+QHqyJxRwtGMBVZm+PjyP1QJB8D/5aP5SPDGffj0uWY="
									"stdout yaml":                "PbefL0TW+dGS0j31Tz9VaQWqvVJ6Jlzpdpjy6lWTufs="
									"yaml:-":                     "4HyjBVLRWz1RsCQzKWkPKlsIXxztI1OiU6rO7FBZmcM="
									"--out cue":                  "N6mglQI6ULA1fS3Cb2dmw2RU5RDmdtu3e0ZEOjH1yFM="
									"--out cue no hidden fields": "xAbHL5dtpZDTER/GNbDN31/mHccS8kUlUVmxFzs1jMM="
									"--out cue --package foo":    "CBdd3+rAoQMIy3OwGcwnEWGonbV5bZ/42q9lwRxoHnk="
									"--escape":                   "QnqWgn9QTbcY/3KhjWiOVTJbCpqBSEWM4yqVdbxefaA="
								}
								upload: {
									"--outfile data.yml":            "iOtx9SrTY+63XL8MbzxME0IVCNbDv+1v/r2hu83jnX8="
									"--outfile data.txt":            "+GawG02vBPA0k0H+ELsJ33zCocy8OHPNXBT4U8o5JHs="
									"--outfile datafile --out json": "aTQ3yz4BzxLL8Xf+FnHlf4Y52HEdYJHZO0U9vIlfHdU="
									"--outfile json:datafile":       "++XB8I/E3ZdBZp3KvteJH20u2EzjwkTsk+NagQTJTCY="
								}
								multi_step: {
									hash:       "J1C2PE5T1U3BKH0EQMVDITQBG0NO3OFBJN6FECKP1M9CVMKAT900===="
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
