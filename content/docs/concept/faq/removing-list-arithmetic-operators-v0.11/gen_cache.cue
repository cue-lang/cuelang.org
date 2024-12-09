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
									removed:                 "X0YTJ3FaXS67TIb+M8ES2la/vBPFQtUJl02qkDoz6D0="
									changes:                 "Q/HjbN7eY4gfxF86oI/alFwvQbOWSWyWU+KCpPiVavE="
									"changes: updated file": "odiJt+r7X4S3bmCk6pum8WxAWFqPCBGFig6AfiqiKEc="
									"references: broken":    "iwQmFXXCgSnfYAi29/Xn5YjChMfAtKdBGv6WX7c44qg="
									"references: fixed":     "dOaEXGsywCAtn323ZmCWWy8VtidVFSTRwqV564xTTHU="
								}
								multi_step: {
									hash:       "ELRV0UI12QS2D1PK4MHSNCSRH3TM76CVS76CFS7OS6RUGKFSRBO0===="
									scriptHash: "SQ0DOKQ8SGGL0PFMCB0L0V3R8OS05QNVI92CRKUG2522URIARJO0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241209170035-d298a53db8bc:$PATH"
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
