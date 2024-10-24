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
									removed:                 "39IZc7YEZfg/m+5UKXrO26cLTQ13+PCLsPectUf9FSY="
									changes:                 "f8ANc3Ut+XrNOC5a+gMcERMHk6YJ6yXz1AFKP7H6UZU="
									"changes: updated file": "aFabWaa+Atff3cXg2S1GqaVhXXi5bLRPqFY8nEBJAYs="
									"references: broken":    "mlWZ2LFrUybaUet8gVloYxnUE+nZkrxGFvSNxbvCnfs="
									"references: fixed":     "cyLfmfZv6vh0vtGUUGAxz1v9Rgatz6L9w2InI1M3p5U="
								}
								multi_step: {
									hash:       "FJ0GDMG0R9UMRERNCBFC3GQVS7FS8NJCF4B3G6LV81TASHDPTEH0===="
									scriptHash: "EM1OL3V1T1BNJG0LIN4IDUT3M9G6FPBVB9EL923CDTPQ3FM98LO0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3.0.20241024161207-80f4f236e293:$PATH"
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
