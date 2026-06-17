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
									"default output":             "lKHVKXkS9Mr60A1yfvQaJ2IKqQqDUW3P5N46/vXbBJs="
									"stdout yaml":                "Op70b3hug+Pg0b6TKCeRd2u9P4/gI6xsnrulQyoRyg0="
									"yaml:-":                     "MPfF8kVi3/GppNh1Y1SFmHkq9wXSyGTJV17XMVdm9ko="
									"--out cue":                  "C0ckXeKo7R7KS0WYwEQEDXSMgs46TQHXlFefPwqZwG4="
									"--out cue no hidden fields": "2pb7bPXa74Hxus43yUI6j/zj/QNtu1hd/ciks5invds="
									"--out cue --package foo":    "C1jgFlJo42fKHCgTrNTepRCin33x35LpsEZbXJm7gog="
									"--escape":                   "poVAqSaFtlIJgFuWK8sDWHid5M/i9YDSed3YkUQqPXo="
								}
								upload: {
									"--outfile data.yml":            "u0G+kjXhcRwXvmd2HxrQopOfstHoG/xTKuBdivK045A="
									"--outfile data.txt":            "rQQVwXrrRLHbq3c8jp1ZxlsNYKX8Q4+RlmqT7RMGAwU="
									"--outfile datafile --out json": "L2y1nmSx710qJOdTKzqDW3d0LC+RwA4ai9Qf0MUsvt4="
									"--outfile json:datafile":       "p3Ac2OpaWTTXPKGXzckvuqhT8scNVf7u8ou6It2T/WA="
								}
								multi_step: {
									hash:       "1915K8EGMNMTNDLN37B7PQ042EJNPG7GND8HPRSCU9VDNQIRPOG0===="
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
