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
									removed:                 "mfUQDq9qi9dnDAd/MkQ2PipVlPBApKRFn9tExGiekH8="
									changes:                 "c8Tlhlvrg9s85URfqTR4XwaqCA+yE1ZsNBY96TkYJsQ="
									"changes: updated file": "Po/220yXI8MDRK2kXdcwiqMvcGbDJi6mA0IEW21B9Mw="
									"references: broken":    "GbCkm3f5hKhnTfLZTZi4zyCNBUaVJymrUFemLmlJ9FU="
									"references: fixed":     "yZTA8PrxVybYwA5fRxwJkUb60efP70txVb5Zi9/hKSQ="
								}
								multi_step: {
									hash:       "4ASIQKFCAD6LAEBIR059FQ5NTT5SSLHCFKSET8CULOMT85PSCHD0===="
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
