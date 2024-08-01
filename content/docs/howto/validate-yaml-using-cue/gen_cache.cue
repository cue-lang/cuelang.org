package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "d57ssliL77V5I5yyeStRJNXXVO1WgvZAaymC1CF0E3A="
								"initial x.cue":  "VQ1K8/eyS/WsTAV/v0sKfDGDJoJ2g92OnXoorzwE5p8="
								"another person": "JhL9PjviH03MFYDRsSQtyC4S8AHrQiaKDxX7IQqT7D0="
								"fixed yaml":     "zNVsFxsKdkZ3RcYw+wOdGrQv/dH3LWWAmnV3g/BKve4="
							}
							multi_step: {
								hash:       "O0FALJ7E7S3M6N58QI483M7J9UDOKGAJUA2BGPUPITKNDV4308QG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
