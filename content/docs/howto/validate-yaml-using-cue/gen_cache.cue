package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zUTJdLVzmsIvzX/2vFuUkeVwf9+GMOVp3zQfwQQwe4A="
								"initial x.cue":  "PZSXvMH/909SgeCICd6UoHuCGuDkkSv3c6mYD/H6X+c="
								"another person": "fWC9SN3kEiuAxJxQujgi1ugjlanw45fOC5A/V7A5IRQ="
								"fixed yaml":     "EBMbfkECeSo3ZgJA6gdD3AB/BHqljN9crVY6qC6Kw8g="
							}
							multi_step: {
								hash:       "72O667607VVFC70PCLHRMJV31DJVMGDEALO4MCBTN1LBTNI8KSFG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
