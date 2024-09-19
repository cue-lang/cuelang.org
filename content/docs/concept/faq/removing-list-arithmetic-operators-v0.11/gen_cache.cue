package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "yz2S/T5jY9G5Bd/llLdbNYRCbbAABYG8B40Hh22bwyQ="
									changes:                 "aER1/3jXf6nWH7yEomDnM0/oQQ0cz9M1oWTlZSgO8jU="
									"changes: updated file": "SiQqnJ9Lg8XmEuq1prK797szXloseDgortnfzCBqy7Y="
									"references: broken":    "7YfrW3+WhxPSdZsdgdpPvcpIm7qHK+IFkplj1ySjp3c="
									"references: fixed":     "dRA9edz+ujVJbrIOAv4C4c357dU+ERwMsAWy6MOwO/M="
								}
								multi_step: {
									hash:       "PVQ6291L2E0AAQ4CKELM82NMN0NJ57MJDUJ58R15ILCG5MO3BAQ0===="
									scriptHash: "SG968CL2ID2LKMV9L2G9187V5QJAHTMHFHA80T860N0LRTOHIJDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
}
