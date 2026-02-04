package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "F6yiSPTbIjTbvOQD7i4QlpuMnYhH/6w0awpX0H/nehY="
							}
							upload: {
								"baseline input":   "lRl7MXCbR6aDlY3KYOYF2VeZ3wwoEfVlkPHs5YQogZY="
								"baseline output":  "KSeXIG2mlbnSi86SFLZwau7LrV/v2Zb+Sy9xXsNoePM="
								schema:             "SzdamKS3YHjZMC2VmkiC6kmp8SO47hBNuOiEeGB0syQ="
								"schema reupload":  "VwWV53T3gHSFMLsYWRnnK9tRo8fDcILHo0/DVq0PIFg="
								"schema output":    "57BpkUKo1V4c56cuvgbdJd2TuCVgxcXmVNvQqH66Acs="
								defaults:           "bRafz3sITB1uAvWSiC5XXFA4E2fcm7c3zxdv88Bmw4w="
								"defaults output":  "0gboapjDu/EzmQScdbIbHNNdKhT8tOIgnXEYp6/9E7I="
								name:               "UlduHBQ8Tp1DP0E6For/lpmjc5R6yi1lGNCt5Va8ze4="
								"name output":      "rAv6Vplw+p2mg3Bq2ZpTmR8iOqwQL33KspOoLAHlOSo="
								"extra app":        "0GU9A2YL4Y9c5KgczGfLXOasXiUskeZEXVTFPfCdRV8="
								"extra app output": "oFjp748gApkX+NjmZq21WWcPuK3zy9D0Q3PnV4wVLvQ="
								"pre-trim source":  "gIG4BYjDCsuG+jOQfxJG1vLn3vSN/BE2Iq/Qn4QPijA="
								"post-trim alpha":  "eD5mIjKSL5lzDYfTlDt7vPtotKWVSr3ttPHt8rxkxms="
								"post-trim beta":   "JLez+BpOUEqqIGRlDfsfmqTAXdmAAKiU51Xr8+f8GNY="
								"post-trim gamma":  "tZZS/LIwRQSJO84+fD+kFD9k5i3dmItBfg/GVKZcu0A="
								"post-trim output": "GI+6+WNDmiqBPea4TVJBuL4FZJYCnTfC9EnVdxotvnU="
							}
							multi_step: {
								hash:       "HNV6CI78SATF74TA7JENASV7NF2UD4HS3QA49SE1GUGPQJBKQN2G===="
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
