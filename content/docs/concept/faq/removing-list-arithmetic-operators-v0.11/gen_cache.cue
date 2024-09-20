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
									removed:                 "GRX1ivo6gHP8lxUJCjatlFl1+K9mD85AM/GkX+e9zHA="
									changes:                 "wJxXMlDty5vEHD6thHN5Ka6mC/fyNV5+S8b9T7FBa+Y="
									"changes: updated file": "f7Yp3rPN3JHJI9iwuM7UUSSp+7hjfRs04ImJEl/RLbc="
									"references: broken":    "PnO2D3VgmRlo72a2tGK8wihL4dbrUqwZbfUYzgatZz4="
									"references: fixed":     "DB4SN9m3T9r5QBO6ekPc3qFcJ9sf/5E9wRKYri1y1EY="
								}
								multi_step: {
									hash:       "N1V25JE6VRH6H0UNNAVTLE2JTGS57L7TUTMRJON979P2B3A6BO70===="
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
