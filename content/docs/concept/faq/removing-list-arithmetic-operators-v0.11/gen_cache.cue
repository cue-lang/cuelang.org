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
									removed:                 "ivtaGY8mwlV175SFXleafSQLj+RY+esbLAkindJQHO8="
									changes:                 "GaE1+vZUy3wLbAeynleZSjcLcJvWY07NEdcozqu4OBY="
									"changes: updated file": "3iW9JP6XyGZkwPP9iqFRzsaB2i2xCDnNC9LCXdR0z3I="
									"references: broken":    "BI7eFE5dKWqeyBivjF5uVAeoqq3Tfxbmu2r06puPdl4="
									"references: fixed":     "ifC20SLRdHc96SqXklTjOxe1KXaT3SMccwFAyJyAc7s="
								}
								multi_step: {
									hash:       "TUOJN5CV7RVQGHR4DC4R0P4CE6FA2BO7U4RQ447LV09D8N52J08G===="
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
