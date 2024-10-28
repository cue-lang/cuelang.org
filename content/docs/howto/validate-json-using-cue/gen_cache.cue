package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "oakryEWb0c4zoZSGfQr+mPy2r2U8oIxFHP8PqCAv/Qo="
								"x.cue":        "pD6TghPxCr+keeR4t0/0wOwp632HOXT56yY30AwwuE4="
								"x.json v2":    "Sl30up2sXnERJdZkbEDwIUiapPfl17G6p5FLCWzu0zM="
								"fixed x.json": "AN6IWaj0keFaAGD4zVIqRA/FU7wl+Tv+kWBAQ9jyD9g="
							}
							multi_step: {
								hash:       "IOQQ1KHKPJRH8FHLG4VD20LQ07K6INOC353M55BCSER1FQ1S9UU0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
