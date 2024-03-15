package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":        "0mRG/rxa3ffdiBCgy3cYBmRZ+DpTOecrJwXonj3rP0s="
								"app-2.cue":        "ED3DLqb2jDdu7Zzlv9Rvve6q6xQvNkD5ERkTZT0JKpQ="
								"app-3.cue":        "NZ1Fg2UAps7Rs8NdtgVPJO8e9mgZBbZpXsS9Chfhanw="
								"revert app-X.cue": "8C9o/7pKI8ozg0hF34xXUD9HXcL78WPBq0Q34ECdq7c="
								"check app-X.cue":  "LqkjJZGmF3C56dWZRfbvgE78VMukqp0+pTo/O9NREbI="
							}
							code: {
								"order-irrelevance": "RkkhRumsoCm0QaDSMkJsfbJxexxEHJ9IVKw2P669DYk="
								defaults:            "asrHQSfKNaHu5JpETwLCO6XS2PSNVuH2E7JYvz7tpuk="
								templates:           "QYlbXDOiBqYr42YGZ4E61VPQ3vYxzXdScg6A40tW5Xc="
							}
							multi_step: {
								hash:       "BFMHDI827HM2TQF6FK85QA5RLOC94OB453PP31HT677QC7P0DSF0===="
								scriptHash: "L9KVA9ICMCT23M3I65GKSVD5I7GABDN5MKEMLQRE97Q4NV7H7G1G===="
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
