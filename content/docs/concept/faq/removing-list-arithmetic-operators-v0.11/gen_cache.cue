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
									removed:                 "Z5dyLVzXfPczc7qL774Lag700YSr+G4QoMs4Kbii1Q0="
									changes:                 "3ojqHTLqTMsKxmDKBpcwotvMS3OiT/D7t3AGFsG38Yk="
									"changes: updated file": "KZENHzrflep+mkvht7qrrTBl8kTvolpffl/6Q5LaW2c="
									"references: broken":    "ekjXbcbjNptthePgXGdYtT6VFOjpjRRkHAcL0zJMqBs="
									"references: fixed":     "tUrG3tD38kOlN/pdP2LNSX0FBZtqPgElDmFiISOCDUQ="
								}
								multi_step: {
									hash:       "QK0SMRA30UU81SF78MGBJB0TFKGE030JCV91OQDHR609FORQH2UG===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
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
