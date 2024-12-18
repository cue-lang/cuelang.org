package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "i1btm8ZIAzO0KFkSnaY9zraBus+v3AXeP0yOC1h+LDM="
								"future: helper fields": "0gaWpYkU7Gep6XATc6rc62mtwub3mtqkIpfaKiGdiuU="
							}
							multi_step: {
								hash:       "7CORJ1URL7A41JF58KUGEF8PN67VJO2GH5P1NNK2CUJSHE5PL930===="
								scriptHash: "GNFRIL5CEOODGSOTD5H9NDMO9CG7076SGME6SDHLEGS8LD16EE3G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241218161113-f2775f863f4c:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241218161113-f2775f863f4c
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchIf): invalid value 42 (out of bound >100):
											    ./example.cue:9:4
											    ./example.cue:5:4
											    ./example.cue:9:12
											    ./example.cue:9:17
											    ./example.cue:9:23
											D: invalid value {x:"some string",o:99} (does not satisfy matchIf): invalid value 99 (out of bound >100):
											    ./example.cue:17:4
											    ./example.cue:13:4
											    ./example.cue:13:26
											    ./example.cue:20:17

											"""
								}, {
									doc:      "# This command currently succeeds:"
									cmd:      "cue vet .:helperFields"
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
