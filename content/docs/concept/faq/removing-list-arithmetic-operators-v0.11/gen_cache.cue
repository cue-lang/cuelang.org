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
									removed:                 "i8D9tbAPJDvqwRKzyx1+YYt40BO4/8atTVrrTZ0GTlM="
									changes:                 "kFljp85U7ENjr+yVu4jIkPIF66xV7uRE+mIT6nWW2Ps="
									"changes: updated file": "l4N3ukC4TQhhGZEuAcO3r+R0zlBlqvLh339eP4BxcRs="
									"references: broken":    "sDRofwnG7OvqqV0z8vONyMYaJg3Rp1AHnxyUYXiEZ1o="
									"references: fixed":     "pC87bTU5GpveQDTrN6OOXQ0MzG3YS21NzqSe1z8JX9E="
								}
								multi_step: {
									hash:       "FSL65F63NDBBPQO5VV2Q9Q0E2URGFE4FITO89LHLKT8DVMJSQ7GG===="
									scriptHash: "SEJ297U4LLIR09MN3NO41Q96J1S642GDG85OH8QJMJGHL9ORH1RG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-rc.1:$PATH"
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
