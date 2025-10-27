package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "0AP1gbT9pOCrF9aLnEssQuLNnYKsPNjG8J3TfQEGfZI="
								"1 new": "d3iC0BAA7ecU3uP5Rs+jFvcoiVs3mUe+WSc5M4mp/sw="
							}
							code: {
								"2 new": "DCVoNgHz6UZRKXxTW2hGdlYpMUegbql+s7qWbYYteok="
							}
							multi_step: {
								hash:       "5FPBU0FEGIJDF3VHBR6CCG8O0BM62LMG08ERCQ3OL2L9NLIDSUA0===="
								scriptHash: "2UF95PJ8I55FI8CRBRC5SB4CDU674JDF7KMSJI16J2TD8UQCM3D0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.0-rc.1:$PATH"
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
