package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "pi/JVh+uvnpD25lTn/yHeqcNd4+KKNR6FJknqHgfj/M="
							}
							upload: {
								"baseline input":   "F0bk9/Q+L2/x5eMr3rgOD2Lgm6phsaNz3PwF9QF9iKU="
								"baseline output":  "eOeY/jAU7n2rxZaUH+yh7xkti7keQAA7fvD0M0X0FKc="
								schema:             "MXDYBqjht+3KO/qncpHfPIqNtlBTnsD2GN4370ghCCo="
								"schema reupload":  "MNZMT8MIPPAkuUE+uP7AP3rnV21FmZrt7qg17JXsarw="
								"schema output":    "u/IiqnPFHPVb3to0kr5HMWhkfEyDmUY1ocJd0AKFCJ4="
								defaults:           "B1l6e+ktR88vrsuobkkQnyOUacRnEq6/qo3MASjSu90="
								"defaults output":  "ofVQbRw9c7CRWcBPidhiV6+9FsExwP5SLzSIyB5Wqds="
								name:               "5rYGSstYOfbrrdVQoh2rBJbI7aRzln2pVn1CjVaDW0g="
								"name output":      "lD/xXbx6CH2ENxtxWzGNKo2dEgX5SRfj4LrxKmZ2+Sw="
								"extra app":        "4B1zsC91acgvfdxSk7kqopNd9c4iV42Xe/wzVFUBVdU="
								"extra app output": "RgnsMEc86SQenMf9998FEEKAYdvQM0WfRL1tVu6GVig="
								"pre-trim source":  "WJT+z5EY5crSTTNnbZok2M2cEHGuw8Q7efyCGHgyQUQ="
								"post-trim alpha":  "qjOwKAgwrgOzjzSSd1U9HW+6aPcWmiKKfhHgoVMAl+w="
								"post-trim beta":   "nx/fUUdJfXe0XAp5a0kfNnMVJW8YzhhBa5UPehRDIJA="
								"post-trim gamma":  "yjkPtfloUlMluUKLck83d36TFZEZejpiTBrX06hegrY="
								"post-trim output": "qVsm2b+fSuQOD4P8PaCUjWUHQbhr5RGJ0YZRAfmi4ss="
							}
							multi_step: {
								hash:       "KOQU4AH2U2OR2RP9LVSS46TLJ1C0RTS6DMQEL4KLKO8STHKVTJNG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
