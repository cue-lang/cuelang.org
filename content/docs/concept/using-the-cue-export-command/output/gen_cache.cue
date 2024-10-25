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
									"default output":             "FEHtr9yqOku+L2XZTQDIpbvE0pRPw8XMkjYybnQ143o="
									"stdout yaml":                "grw6AnH/PN2xfBBmM7+b3G3clwDusMTcvYDRoo/1GOY="
									"yaml:-":                     "E3QzGLuA7DRbnUr7ycmWC4TmSkpDAcQqa6UD3i6+oeM="
									"--out cue":                  "JGNt/78WfY1rFRdnru9EBWdX4lMkWnWTLWjn2yig2XQ="
									"--out cue no hidden fields": "6rNSweuz3RjbkSYzyZkihGsyLxPhWD9DkQ+X80SR2qM="
									"--out cue --package foo":    "3V83RxvOjtPRihKHFkZwG1t3FFyKdvNgM1zHusDIdKM="
									"--escape":                   "4D1dWeDZ4dWEPrGzz2ISVjrNSWP0+YjWJjrp5kW1Z+I="
								}
								upload: {
									"--outfile data.yml":            "D3ZAuLoUodKD4CnFIQJ/uRrt3GWM5j2OT7zFsAASOTg="
									"--outfile data.txt":            "URAtj/WroqcLP6SG97v5Boj3HcplqeqXyDUnf4ieCdA="
									"--outfile datafile --out json": "jvfjzIVLtg54z4nrT6OjytzXKVgJlL45yLUJxqDyqaU="
									"--outfile json:datafile":       "v4079M7s3N8PKanrXEvA8aOK0GQckJmq3n4jr2kV3ig="
								}
								multi_step: {
									hash:       "UD6LJ894VPHMPV4AES5E68P7O52ODTQBLMVIA050URRQG5EJ1UPG===="
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
