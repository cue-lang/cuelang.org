package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "dCaDcWAr2U30dYyoc6NSs2qQpNbHBwhFYBXAxFT68cg="
								"cue_types_gen.go 1": "zY1lL3twT61Vzt8w9LKd7T1Ew1l5uzwjPXZwpLTfhiY="
								"example 2":          "a2bQrWSHIJOCGCW0Eoz+ZszjhhyPm1VMztxdXLyhY+I="
								"cue_types_gen.go 2": "LhcOk5vBPMeOtP7Eqk+Jit14GjKXyL6Lntx+xTvg2k8="
							}
							multi_step: {
								hash:       "IMK98E116PBS5BL1DQCRB5MQCV9PTGB98PJSB7V8O3D4T0BCCS8G===="
								scriptHash: "5KHMTGN6BN8O5DOADLP9DBGB9SMOI7HQD5E58OTCPOMOSHROQ650===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes .:pet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go .cue_types_gen.go"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff cue_types_gen.go .cue_types_gen.go"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes .:pet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go .cue_types_gen.go"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff cue_types_gen.go .cue_types_gen.go"
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
