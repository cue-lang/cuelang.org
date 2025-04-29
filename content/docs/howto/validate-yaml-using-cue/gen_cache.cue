package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "KZ/2nLLO+VKex1MC+fICWk1Pn1Tf+3fqLSRSEUJ8sWg="
								"initial x.cue":  "/jfuYKF5EgFN27GCnISG5spMKM/yNwShaLN8mMYa8Y4="
								"another person": "NkGZLyEokeXnJDFNcITissZ5/UrjEWDTKklKet7OWR0="
								"fixed yaml":     "cBH6i9qvmyyFAFjim8YDR5QJpBmziw/Mt/bBGytAOXM="
							}
							multi_step: {
								hash:       "AJS6MTQNVKHL1FG120NKU7OLPT0CGBE3CMVC9UKD3FF83LTU30M0===="
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
