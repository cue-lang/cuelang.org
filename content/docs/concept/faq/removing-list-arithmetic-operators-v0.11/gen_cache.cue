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
									removed:                 "rUI9QWbGvLdawTcmvzTif0nQXrlFU/jfkNL6BRy/p5U="
									changes:                 "lsnPvqUwvLVEbCmd2FDuoCuaWnPRR17IWc9zxwqt6Qk="
									"changes: updated file": "3QqrgfwdZm7Bdg8I0d6caOMhWwKkJbws9trld+ldSDs="
									"references: broken":    "tPhr2qIh043qTvJ4cArFo3fMr1WerjsRCTP+5hB1ERI="
									"references: fixed":     "GaUg2qGOiB7WVMa/jx5jXcyNLPoC9uXIpl5XqANZb98="
								}
								multi_step: {
									hash:       "CQP63NA0QR3RB9M6FSEOQPIPFUAR0AP7N3JFKS125V0PVPTRD3G0===="
									scriptHash: "FHIS6ARTQIF3T8JH8GSVAMJBNNODIT1GH09N21VQN0G4M7V9UNTG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3.0.20241017110013-860906a7f025:$PATH"
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
