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
									"default output":             "MUKsJFNjW3LNpRsGmzkqfy0vhMnOjljuOdfgbj+7lkc="
									"stdout yaml":                "XesELjRso5UhFKfMlznC+7lWJFX6MmEeCkecOXMeD+c="
									"yaml:-":                     "+6PNngLorjF4AaAxywesoiWZ5KSJpUOJ3pmsZ4sfFJo="
									"--out cue":                  "Y0wP10+GBQX1ejz3AQTh3EuMQeLsyqN16/ugbpjNGFE="
									"--out cue no hidden fields": "gp4R4B4F12Li52h8HMZnWW7mqiRsA7ptwjjxLHLjrAA="
									"--out cue --package foo":    "t1zRWqyyFO0jwpOXR90RObdUxBv452/AADTeOwrJZo0="
									"--escape":                   "7njOYmjmjzx+cRfoqokgRfvFDm5kZf4IpOoj98SqkIU="
								}
								upload: {
									"--outfile data.yml":            "iVEE129uxv0vZHZGWUf9pEfFeRJXg+oSHZ2AhO5MBwI="
									"--outfile data.txt":            "+Xii8KEAOy7y5dGBz79DqxtfS/TqMYvFgslA9NXqrRA="
									"--outfile datafile --out json": "63TKH4qwTKhmXUtifqltQTPegCim2aNcH6YLOJ29A4k="
									"--outfile json:datafile":       "01gCVgsoaxeTZBnHqpPlz28xA2cGzbtVSL1G0Hv5iE8="
								}
								multi_step: {
									hash:       "TD97ENK9LMEGDTQ7QGI945COUS3EDNDLPIR8G1DTM0NEMN01AEHG===="
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
