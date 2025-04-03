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
									"default output":             "iRQP/He1nYwjC1arctZujeAUdlYaw94IAI81+nCRHvg="
									"stdout yaml":                "DhmNtJTAEoN39BBJEA0Wq8+4JBvRCglXTb9bLCXbYAU="
									"yaml:-":                     "DPeYMwJxPCaHLJZTH9WgyUo3IF1F4pqY/av2dGQBYv8="
									"--out cue":                  "GKvPV3AJAbEBG5Tjb6g/Kq46LIEiE0ikeVBt9sKitIc="
									"--out cue no hidden fields": "67wseplyAulkDZWaCXsdK+JgVLqhcA5+d6s4Wvx0hhY="
									"--out cue --package foo":    "759BmU/frea3UcqmjWodOk/yBeDLnLpQ5awr8a1tiSE="
									"--escape":                   "juYzjgGAhGxTuYe+9E2cTDtLpeqozynaQ6daJlNwwu0="
								}
								upload: {
									"--outfile data.yml":            "ZNH/N9xBAi95tWF4YadkUsPNEKcMbMzJaxybrwLrRZ4="
									"--outfile data.txt":            "4NJ6pkSdstx0E7cHWRRYmy/f0OuKpVpOskFgX+aiVCQ="
									"--outfile datafile --out json": "mBGhQW9jqXTlHF0/H1cEw+Daqo3A5CRIdVbMk5FWq6o="
									"--outfile json:datafile":       "w+sOsPLac1IRzrfUquO9zeMrPcu72Jzp998CoVwvDTA="
								}
								multi_step: {
									hash:       "39E3AQK6PBES2NUBKLKCRP1K21VIGUI0P7BO2F6M85SS7B5N71G0===="
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
