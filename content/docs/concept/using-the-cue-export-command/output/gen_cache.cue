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
									"default output":             "kVrltZMMYtnp1RCFzYUG9ehOsKwHWEC5TsaSzwl8FjQ="
									"stdout yaml":                "4dGhvS306WbK1yuDkVcKJaWsZfQBk5pG1bPRy6vx5G4="
									"yaml:-":                     "lSgkSW/wcroPe9jw4YYtMsWzCljKEkuxUqOdyqNXaPk="
									"--out cue":                  "FWqT4BrFh6bywp7IbtttsyINJKq/MoTycaouTPkFF/M="
									"--out cue no hidden fields": "7alVqjWrR5G9J7dtmzIOhZjOB6P9ihCkPprUPH5Fd3s="
									"--out cue --package foo":    "c98o738Bgs/FWkhhKUCGBimqPu4SCM+BkRi8858HxWg="
									"--escape":                   "8ucUX0jY9E44vf0stFetKPO3SF8a78YQ5U0EQb6Etc4="
								}
								upload: {
									"--outfile data.yml":            "PZvaO7lW3OOjVHWNiyWJVfDw5Sw+qJ57zp8/9rRDpP8="
									"--outfile data.txt":            "ZgXZgEOb2mQ+7eGYT73d+QT/JNkL1UI2S+hpuL4dQ1k="
									"--outfile datafile --out json": "T/Nua6Yb4Od1+B+XOjGsW/pKLCI2E27bBO8+NiiMJtc="
									"--outfile json:datafile":       "PxzGFYIiGLtocu6mX5/a9i63KmviwhG1AqeM1xbakt0="
								}
								multi_step: {
									hash:       "CQHPGNDQVP9661ETODQEQGRJED31420PNCSEJ6NFBSV2R777VSI0===="
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
