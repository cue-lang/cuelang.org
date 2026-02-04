package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "Uif7Mzk7jeppW6uZTIZY86ZhLW3vXEZ5F6IrSEC4Gdc="
								"1 new": "V0E+jqKZYeW1IoREK5hpOLdPYLTmMO9WVlUKV4lPP7I="
							}
							code: {
								"2 new": "y/3Qip5DIwv0IN2mf3aVksvdB42+vc9HyCM/HcLN95s="
							}
							multi_step: {
								hash:       "7BTTCB6GTDJ6PTI11VJRSMBMKH4HJ7HSFBPC4IP6T9KUBNFUFB80===="
								scriptHash: "J6T44R9DAIKTEUFKVFKPA7HKV76KPD2C4TF2VL8AIT54TM3GAA70===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260204102828-049d6e12211e:$PATH"
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
