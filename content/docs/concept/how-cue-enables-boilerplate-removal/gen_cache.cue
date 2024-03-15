package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "YmxF5N4XpBEsMbzf8yhMgMFMK49RkEV7GcE34I/BvT4="
								"app-2.cue":  "F1T7gpBTTzCjq4a0jznx9xB+WJj+uIA7oDTjBM0bB/A="
								"app-3.cue":  "85KIUtz1bOiiluq3y/OA65C7RXTvKPLQTZ7c5Ov/Bhw="
								"policy.cue": "iKP/21SH0C1P2vkE22iVje6NpnPT/i6Hz9VbxlEFAzI="
							}
							code: {
								"order-irrelevance": "i4tEh8oTzfnc1+SyBkrOT3HFG2o+gzAz678fCp4haZo="
								defaults:            "2nKdm+80/NKoLaxVNettgtWODaGPKYkneaes8WSGm4k="
								templates:           "WrhIvWoJu49FLrkBc9L9lVQFX8o+kuTyJy8dh56mIFQ="
							}
							multi_step: {
								"1CI96NULLPAFTF4DJHVUDVIPHQH3COFKHEL800JUPPVP6NRH4MQ0====": [{
									doc:      "# The original app-*.cue files:"
									cmd:      "tail -n99 app-*.cue"
									exitCode: 0
									output: """
											==> app-1.cue <==
											package config

											app: foo: {
											\tname:          "foo"
											\tport:          7777
											\tid:            "foo.example"
											\tsecurityLevel: "HIGH"
											}


											==> app-2.cue <==
											package config

											app: bar: {
											\tname:          "bar"
											\tport:          5555
											\tid:            "bar.example"
											\tsecurityLevel: "HIGH"
											}


											==> app-3.cue <==
											package config

											app: baz: {
											\tname:          "baz"
											\tport:          7777
											\tid:            "baz.example"
											\tsecurityLevel: "HIGH"
											}


											"""
								}, {
									doc:      "# # # # # # # CUE TRIM # # # # # # # #"
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# The modified app-*.cue files:"
									cmd:      "tail -n99 app-*.cue"
									exitCode: 0
									output: """
											==> app-1.cue <==
											package config

											app: foo: {
											}

											==> app-2.cue <==
											package config

											app: bar: {
											\tport: 5555
											}

											==> app-3.cue <==
											package config

											app: baz: {
											}

											"""
								}, {
									doc:      "# Verify that exporting the new files gives the right result:"
									cmd:      "cue export -e output --out yaml"
									exitCode: 0
									output: """
											deployments:
											  foo:
											    name: foo
											    port: 7777
											    id: foo.example
											    securityLevel: HIGH
											  bar:
											    name: bar
											    port: 5555
											    id: bar.example
											    securityLevel: HIGH
											  baz:
											    name: baz
											    port: 7777
											    id: baz.example
											    securityLevel: HIGH

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
