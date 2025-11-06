package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zdsz4DCDfGpPdofUfz+MNB+5An1ZEaMWjMzhytzyJmo="
								"initial x.cue":  "qIZahVpwUGMV3aB7sDvuUSuoSarxUAeljF+fCyczCcU="
								"another person": "1K5rDGlF+9xMaKOxa0xAw3ZQlf4BG7c9c6BJ3L9RCEE="
								"fixed yaml":     "zJtExO0nSqVvRjod8/c7dVfkWNlS1vxQQu8LO8owfNo="
							}
							multi_step: {
								hash:       "2O082COGKFE6E4HSAO2M8RCTAUHPHE4TNMLUQ2HVJ9DB5OVKD3KG===="
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
											    ./x.cue:7:21
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
