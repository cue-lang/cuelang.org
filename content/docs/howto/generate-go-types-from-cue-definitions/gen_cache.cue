package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "7Ivfotxm/aT5h8pN1ZKKZX9laNPoOyvvb4NCwwAyGKA="
								"cue_types_gen.go 1": "rGYee8NabjZV5HXlu8xwkSJMkZpI5Bp7Tveyn5Ndtys="
								"example 2":          "XQEFXSIBigwB66X6J8mt/gMtqniRkUTRfFVrYjiGD/c="
								"cue_types_gen.go 2": "qs+ulx0XKqcyjccWvonQ+9eRPv+kXU9mkxg7coVg7lk="
							}
							multi_step: {
								hash:       "GH1V4O8GQK7685BM306O62PHSDU2UHM3VSJ288USJITH1LTR6PPG===="
								scriptHash: "Q16KFNBK24VG60U3RREJDA0S1GLBC4I4LRHQCTFGCM65QEV84ATG===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
