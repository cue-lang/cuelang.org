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
									removed:                 "w8fPGzirib4BiSMa7PrDlxi+7BeYO75OUVq0i4K40Sc="
									changes:                 "GDvwo90urCvfSJX1glwsRL84RDVszaKm1fWmQYHvIeo="
									"changes: updated file": "n5a1aB3nr3hDcVDs3kJ8v+Mk38+V6ak5pTe5yldVDwY="
									"references: broken":    "LgrnI8BibDDw+AkHo0mg/qynC0zF7Jre4MvVTw4QXdc="
									"references: fixed":     "9zTZzzUL3M+t6XB9P0x47DbM3SbAtEX6j8xhn5O5+5E="
								}
								multi_step: {
									hash:       "EEFOA3CIISPATT6H8V9C684JHHMME0B3D382S6O6K21FCRTJOH6G===="
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
