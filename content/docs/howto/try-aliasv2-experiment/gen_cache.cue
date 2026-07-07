package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "ArGDmi2GrWjvs7sn1MWlL21mKvOrfsOzAuVtQrX3XEw="
								"1 new": "Ulfp6a1jtUw3AMnPzWyyy0+ozNOBJBhm22DFsmPDrfo="
							}
							code: {
								"2 new": "RzmmN8F4un0jpMrbJ/IrhN+OSo7I6n6HhKJ7l6AhOWg="
							}
							multi_step: {
								hash:       "1O1KM28ECFJSB736H5T6LOUIB3UVNVTLBR1NSSNQSV3JLNRAHEUG===="
								scriptHash: "9OADTR44B7K95LHUU81JHAUOSFSP5BI09OS2R4R322UMR85LSSLG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp current-syntax.cue experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue fix --exp=aliasv2 experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export current-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}, {
									doc:      ""
									cmd:      "cue export experimental-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
