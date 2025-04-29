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
									"default output":             "ELIkWEYwr/PpYKOhFvLlx1xrKhgOFplKwQaNxwCl8+8="
									"stdout yaml":                "I+AZ/VT0exrA7Ci430ZuTDldUmgUqtp1LWCYcF86pH0="
									"yaml:-":                     "atzptHOzC3Q+Bl1iJ+D/vzf5cV3VDY1gCVfVqXjdqBE="
									"--out cue":                  "5A/3sahAZ09sCFdcz4vY15UmARME3Z+kYXEUE9/Tp+E="
									"--out cue no hidden fields": "nHwratbB5h22/rJL+XdgnDpFmoyYAqNlhA/eoPPG4yI="
									"--out cue --package foo":    "wKtWVwoUfrL5lLOtXEA5f41CwjBieE2NHyfCaz9ZlsQ="
									"--escape":                   "v09x472ZhAUKCOd/lG0io98bJAqqtnwc8eVo3pWKdZs="
								}
								upload: {
									"--outfile data.yml":            "EOrXxhXQQTvJ8cHpcQJXBgPhq/dSmrLu5lwx5KGUe7w="
									"--outfile data.txt":            "C/dr3fA4iwP5xU/o4bPSdbcuh5SRmMVuUMpQOHoXNt8="
									"--outfile datafile --out json": "83Fms9qWPI9in+CfcSuxbkebr7V42Y/LybhRccLojac="
									"--outfile json:datafile":       "dvKFtSQWwo4o8SGUzty5Rp3TecQVwvAdHovAifR6oqM="
								}
								multi_step: {
									hash:       "DU7F0VSMJBLFFM2IK40K9HK996DKMEDCIDRJ9IA1EQRD4I42L9M0===="
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
