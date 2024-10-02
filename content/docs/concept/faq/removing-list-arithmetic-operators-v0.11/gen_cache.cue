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
									removed:                 "qV/GPe7oc1dVfQeso4qTQOHYgrwfOPtDkRFeZZE9/EQ="
									changes:                 "rp8cmPODc7X/9//iRpzbXtwrVMo78s5sdSEN1iQv4Lc="
									"changes: updated file": "JdlsSzSaaJEV/Tx4fS/T/tXyAmsK0+U636lShATA7Fg="
									"references: broken":    "c+0pjJXNdNaMW2qLE5ge+/QibGukDcqiz90sv4krdMQ="
									"references: fixed":     "+++RGnSaNXGY/fFSkxLGF7yiKrtmdWA3BVSIGpL7F8w="
								}
								multi_step: {
									hash:       "VLFHLN4E3N8LCLGIFP52RE0TD7V0VHR34MJG8301H9VL4J313BPG===="
									scriptHash: "NK5CEA6CUR4KTFJHDTJ0HLDFL6HC1RNK8VP5I0RNME3JEKM8QR40===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3:$PATH"
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
