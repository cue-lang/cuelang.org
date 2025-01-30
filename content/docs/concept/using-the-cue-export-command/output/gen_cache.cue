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
									"default output":             "0o31dlHfqB4/qvs0+Zf/iZcmZagEwz8W6xXAy/QnCmc="
									"stdout yaml":                "2kZnq5q4LGbBQTCIHImBoKgBZNS59QFZiJkI8Uq7Ua0="
									"yaml:-":                     "9mMUbrRcDuPqEtcAs7UvC5RYT31gZnOWDCzzb4TEiQ4="
									"--out cue":                  "Fb9AslIClEdJNClczLvUkwRWS55lIb37kDVsfJ21LvA="
									"--out cue no hidden fields": "yX8tmgC3krp0BM0t8e1qP67IYt8LMS2xG6MCE50iM0c="
									"--out cue --package foo":    "L6emsjofcE+o+a3Gv9vfCrH8n/26ICVkjXxVHCCWN3w="
									"--escape":                   "OcrmND2NBQD7hIgUFBMl42JnFZ6Qegw9zRy7vAXeEzM="
								}
								upload: {
									"--outfile data.yml":            "HeKlKQ3QgJbf3NI33GAKf/YZLZsaeeKXzJPoi/U/ALw="
									"--outfile data.txt":            "MjP1bpsWaoFlSGnnqjYjODEM8kb7jDPRYvyRb0fOvAo="
									"--outfile datafile --out json": "ifSH9sKjhtb6V4ZetD5aw5W1gKYTB4uYYiVCUNQkKcE="
									"--outfile json:datafile":       "X2JAPuf1Z/THRV9AqJDpLB7e06uFvOtvxv9nRv+o7kM="
								}
								multi_step: {
									hash:       "2J1MI0DFGAGSAM2COD7OO1HR6RU168UFACCUMOUBPE1RQ323FB3G===="
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
