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
									removed:                 "zivOg+RzjBofNPHgneNoj+Zu5BzQGJDbTahf2LsiIz0="
									changes:                 "qARbnaDMimF7d7sMblNP7bJ1RLueljr/O2Chf/WRQC8="
									"changes: updated file": "aQYrVmyRsxO9JYVe3GedE2PkEsYuO3mi/OcILvKi/eY="
									"references: broken":    "IA41UOgoTdMtLcY8YfezPS7+nnNGDpoewsh8pt+OzM0="
									"references: fixed":     "GY5x3PaSePRo4bmtRVPbEr5Lc4wefZ3rucW+WxEab7o="
								}
								multi_step: {
									hash:       "1RSCE8FCCSQ73H63A4TS62P9UEP91KKRR0KSS9TDBG21DUEPKM5G===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
