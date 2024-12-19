package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "C9L0tKHyMoQD9YByKFWdBOwCy5embkMiykCL+eYJ+4g="
								"initial x.cue":  "IaQGLM9DZbT5+hYddEwps+mdXl5Hv/wU+Yo7vHPq5ro="
								"another person": "KfWYCRcDQL84aGU5mgO+lB3Ioy8OpTLoF0NpRWgJS90="
								"fixed yaml":     "Fj3HPg8Zq3BiJZc4EsEg1wSldNogs4uNnc3UAqG74MQ="
							}
							multi_step: {
								hash:       "GH9DQLV8TJ2FRMEVQB43PDARQUNEE8DRADTO820FF1OJMO2KPSP0===="
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
