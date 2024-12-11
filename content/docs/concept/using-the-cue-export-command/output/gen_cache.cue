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
									"default output":             "oTmosX06WuY3u6seXU9YlDv7OnujzSIgz3/R5hGZb+w="
									"stdout yaml":                "uKUmW3aeg/uGMIa6e3+QQvea1Ms6cM7SpyJ26yKjmRc="
									"yaml:-":                     "h5XaWl7OHhXmhDEmc0j63t62RkP8xRc6fXth2JlSVe0="
									"--out cue":                  "gx34RfW1cJZNVW+Fl88KsmKAMds/AlO4WBwaRgk6WKw="
									"--out cue no hidden fields": "cDx4XpKR0GEv/FFE4IiEadEDD9aBDDYoUlV+O3d5Q8I="
									"--out cue --package foo":    "ffa2qr1tLloGf59VrKD+yC30aoIBx8p9tpfglRi+08o="
									"--escape":                   "MfPE15edqJy3KxldL5ralWN4iVZJcWOrg/u0R8uDUb8="
								}
								upload: {
									"--outfile data.yml":            "E3HO4nT4kqXzde+B87fkD2Vfjo/HJXyL3DHbA66uSvM="
									"--outfile data.txt":            "EVpdaVsoiiVeM+IU4tWAggguJ2jsTXv0/Uf9WedZBQA="
									"--outfile datafile --out json": "hy+qpnIe7znE8Z++SXJV/7aEBhoPik/0fy+Uc72Dl0g="
									"--outfile json:datafile":       "zANB52qkP7VBAwfS8CRLKYq4mG6KrQni/fdTsb3RDOE="
								}
								multi_step: {
									hash:       "22NL5SO2AC7ERSS83BO7F5RMA6MLC6A8582E8765FGGFNUOQDRAG===="
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
