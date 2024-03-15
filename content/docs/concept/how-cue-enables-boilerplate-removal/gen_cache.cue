package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":        "tnD94zjGbq5Q9/4N51awGIMlvE1ZdrHrCTwWdg5BrSc="
								"app-2.cue":        "0t2pipZlGHcH/TuAMIFRKAmEDTJaMvq3/4bL55Lvp80="
								"app-3.cue":        "c+HeH9Q/VKR38zdHGnx8Q0wZfhAmgRLLu4WOkx6lzrU="
								"revert app-X.cue": "IRhYuHXypX/lAPkLY+COcp8JogUVdxg8D++gLaz7GLs="
								"check app-X.cue":  "c5UxduAhfU1aFJiWyjo+P3UQZLqyCZd9RhFU2f4ZrTM="
							}
							code: {
								"order-irrelevance": "19ZkdWluj38o0/hd+pXchAHOl+uFiyRc3xQKB5JwhZw="
								defaults:            "uNjvFI3M6ywwIr6lj/r0hyqtoCcU4Fyq8ibxst9OQug="
								templates:           "+y6v4B4ryI8Uev7p0x8wCtjWtiCjjj9KRjRYeaMO//M="
							}
							multi_step: {
								hash:       "7FMGR6T03M8R6VOFADS40EIAK3RQO2C8FH641PGDA0KGEELGNPH0===="
								scriptHash: "NU1JE74JUDC7DULHUHBQ1SVETKFSN044HD6IHI4BJI7AM54OCPH0===="
								steps: [{
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -e output --out yaml"
									exitCode: 0
									output: """
											deployments:
											  bar:
											    name: bar
											    port: 5555
											    id: bar.example
											    security: HIGH
											  baz:
											    name: baz
											    port: 7777
											    id: baz.example
											    security: MEDIUM
											  foo:
											    name: foo
											    port: 7777
											    id: foo.example
											    security: LOW

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
