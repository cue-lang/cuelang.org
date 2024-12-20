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
									"default output":             "/CBoW4vxutd6R+ZxIOiIE4vPNSdNXnHm/vqlHkODqCA="
									"stdout yaml":                "0Mnj1M3FyTWQBsqZr4JJ9pglbYSrJrpe1oU6hWn954c="
									"yaml:-":                     "uGjYPCknAb7ahE4y95mABh8CLPoQqiwCCmk2umCZHOY="
									"--out cue":                  "sBwPvDmqy+FdGmCVK9xMKy4839ee8Z9vtC0q41SFnFg="
									"--out cue no hidden fields": "meUTHWePLEoHULzdmDLQrVsh4oU6kYqd2lFacIshedM="
									"--out cue --package foo":    "kwdVneMtLgc1GAiCnU12DMJ6e1B0FANpjAWR0M4XMz8="
									"--escape":                   "gywmPSbZI3XMQOkmJxCvZiN3Bwpc92veJW43f6JHvDk="
								}
								upload: {
									"--outfile data.yml":            "MyqM/WXnwwI/DVJxisBBaM8+4kGTVQx1KExRh2+ArOU="
									"--outfile data.txt":            "aJ3hByQYJyiZbqFqhK6ZW4p/jdVk6XieUdKVS8lL+uM="
									"--outfile datafile --out json": "bsArES2zEChPYyPdEOpqdH/c3aMkwo/1b9MFBQSyfZg="
									"--outfile json:datafile":       "cidatEACOVsOyOm6t9vxlRODHX3ds4Rj+NsmpL+q4pE="
								}
								multi_step: {
									hash:       "CO4O05FPBPICGVCRRCPRTU5BGAEGQ1F65SICMQ6JJL490TNK77J0===="
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
