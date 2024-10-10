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
									removed:                 "KJdgip32IQEl00Z8huntTVlKibgrx8v1zYvz81+zs44="
									changes:                 "+X5ZUT8sNixsTIe+MAgOGVLJ7U4RIpXwOxQz+jEc2qA="
									"changes: updated file": "0w5LpEj5wFIGjzc1k2MFa72nJyjs3Mp/storYNclIYo="
									"references: broken":    "A4Ti5WcMwXUIGaHQmsFXFQcD+mbG2L2MTXxUjot17sA="
									"references: fixed":     "bWLBMYEpQIKqIsQUSQG7uF9KEic/EoTfa0G4Yn5/YkA="
								}
								multi_step: {
									hash:       "PNIHOAP9I1LLPQL2K294ETF91DGL4G6P8VQ3H2GO1KF2BT50P81G===="
									scriptHash: "N3S4RC86O1S4LOVINLKH5DS354VRM8SRRC49P2F5DPLP7RRM1U0G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3.0.20241010142549-44cceca80690:$PATH"
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
