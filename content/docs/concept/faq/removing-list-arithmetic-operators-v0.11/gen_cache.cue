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
									removed:                 "WJstiC59GBq353JCTrXD2LCtuVWDB8f9hU95P2T8rgM="
									changes:                 "wUO4GrNpvPxf2SpvaO22KoXpxy2TTBjBfXysUU+uKl8="
									"changes: updated file": "h+tKqOhqsmAtjsZpvtlGLuuh701p5q9EFaUFZ2B0xrE="
									"references: broken":    "jQGjAE++wg+J7pk4MKB2vtL60TUwjLxma3JhzKqocTw="
									"references: fixed":     "wPAez/rTYz1i+m15dkCVBGhUR/ic2hb4AXcKm21Sip4="
								}
								multi_step: {
									hash:       "IIF6F7OTOON041ANTT8TGRPISHTA6LO5SRQKCAICB5VS1L8D3A9G===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
