package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "jLLwJkV8g9ILf+fq37844jonZdSeVysurNJ/bX4KGsc="
								"x.cue":        "+tIPwXWzAfHbGohtKCqonoW/syDwS9cvoFLpCuAyyiY="
								"x.json v2":    "LA3qNZr9tZf/QxpqA6SZ1RRs4wbz0DWz1zVcIIlOU2Y="
								"fixed x.json": "lmmkqg+Xo0DXNzQE3hhrKidwI0uKS2o6ME0FmxxPIFM="
							}
							multi_step: {
								hash:       "G9FBRASPNFOUCGC1L5EBC54IIC1DQGJ2NHKUL1KM2E52EOOMVKKG===="
								scriptHash: "T6K6BKBB3JHKK3J9CJ3C0M6AQ5NH784A4DAMTHLAVUU9544DNO1G===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
