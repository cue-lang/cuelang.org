package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+3i7WB6m0JRf2nvdOq/hRNe+d/rnhJSVOfDrwPH4b1I="
								"initial x.cue":  "8fCyHkVFQV1alAhKuYlT0t1PfhgfXoB95C5gleVptT4="
								"another person": "VUrDa2Q/b4kjQLQUAdIivkIJvoLhMO1IAxnQzLMAAVk="
								"fixed yaml":     "u3rvHlTbsxIBvUllAwoTs+oLOZMPtii8ak52FFSK+ZM="
							}
							multi_step: {
								hash:       "PCOPTT40M5ELKE2DL02U7JJE0E7057DDKEA28HFFP0RF0IH5TOGG===="
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
