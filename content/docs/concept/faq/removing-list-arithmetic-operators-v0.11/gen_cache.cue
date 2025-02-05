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
									removed:                 "XdwUm4QJsxR6uEpeGBpEjT6c8/y8v3AqnN5ysFA7bKk="
									changes:                 "NxKs8G85pgWMPIu3vUPM8iFyZmEEb0rHtZOx393/Btw="
									"changes: updated file": "aYTHbQdRHKTRP98Hx/SSJkXdqNn8iafj9zvcOuSKum8="
									"references: broken":    "PVPKxygXejYg50O+LHB5fnzNkjH5RXPvne4XDnoShJw="
									"references: fixed":     "YL0v9Xa3RHnbi/Nr2/ERXkhlqNstxb6TTSkKKhuVe9s="
								}
								multi_step: {
									hash:       "8LSHKCR6JRAADL9QIMVS7UNBHHCNPMKB1LN49JFAKUE41GN86MDG===="
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
