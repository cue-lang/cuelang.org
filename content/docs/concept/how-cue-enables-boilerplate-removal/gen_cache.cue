package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "jLqKyawmMA+CaoybqVLBwhG5tUUqQS0zatIPR0CRrGI="
							}
							upload: {
								"baseline input":   "oBLwf3tXGa1fF549rbxsrru03YB7TtC//2Uw6cghQnY="
								"baseline output":  "ZwxIMJJls5mOmWH3LDPL+MpAJPSrPTPT0erTib6MxV4="
								schema:             "+IcvmEGply3BS31ztMv99IQqGi/e9D4DpDc0xosB2V4="
								"schema reupload":  "ksdYl9ZRdhB2i3Hi2iQGYX1CpG1YZQBLSgkhKsy7DoQ="
								"schema output":    "cXVNqo4OywT2WTiUuLjDnz/ZEjnVH1bdX1GWdbyK4xI="
								defaults:           "pA0rnhse/TX4WmMbTc3b4WWwH+6pkvMrzV8x8biD/NM="
								"defaults output":  "4PPR14jGW39/YTUdwTuqULBpAx/fXPDE0IyQ1s5OI3k="
								name:               "npGCNDFN0rbBUa3tkJvANlPZRKozFv8FkFItOtBEvsY="
								"name output":      "RwjXg8sVqh5prczOKtmaEe7BD0M8pgVjBETgi5GXlWk="
								"extra app":        "9+xCZNDGMmpI4TIby1mCDwrbJsFalpi6xYYFIj4jj4w="
								"extra app output": "hrMYKzHGx6JUof8cDv1XqNextEmNvNyRMwjFFXLg1Yc="
								"pre-trim source":  "49NymiOP/v9KQ2+gnMPOyFo0FlLLf7tKkKZSX+lA+AU="
								"post-trim alpha":  "NGr7J2K8osNN4Mrf5MVUM8TAGNlist87x7KFRC/fdm4="
								"post-trim beta":   "HO9PuVyoBFaiGCWGL5JVhPcLdTeQsNlPNubutzXJM1Y="
								"post-trim gamma":  "6Q8F7rMjY8TMN20DxcdfMOo5cUzOsm0P6sCJI3bgerk="
								"post-trim output": "q2HlSLvoqUz8sseZI1/vEMF11R9I4v0eFao8Nuhp9+Q="
							}
							multi_step: {
								hash:       "LCLFCSHUR3HMH4HJKUUV0N25E72PCJME5IEVDDJLV98K1R7RO7DG===="
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
