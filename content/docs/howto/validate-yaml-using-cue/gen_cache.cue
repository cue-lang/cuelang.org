package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "5El6RGY8rqwkn6HNu5pxAx+VB5e1AP7H4SEYNdv1IVs="
								"initial x.cue":  "F5FQA7Jif13FzgwFSyrSU1Jx7dq+SSPIUV3RiGkNtlM="
								"another person": "N10rOxXL/ExkIZ1GmOCJhfx9EyaGuPMPuHl1+4BRuWE="
								"fixed yaml":     "aqqhWIkswOcd8FIkoUiT5dCnOuhTPcMy5tSaKU7/420="
							}
							multi_step: {
								"M22UP4DOCJAFVEFU2UIIGG8F9NTI8R9G3HR5P699K17837J22D8G====": [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
