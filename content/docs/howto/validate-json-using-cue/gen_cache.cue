package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "884/+r846Dce6RrJ87FeMgl67+DtBtYAjNwnx1sfqkE="
								"x.cue":        "gF4C/vVbB4xEPAA2tWoV9csGeGTIk76Mu87mo21kkuw="
								"x.json v2":    "a4TT7/p9tMwn/yWlDor/1xFYm7wEvjoq6cPoyhzk2IY="
								"fixed x.json": "Ie4I3HUEn/IEh65jBsBzo3/7ArJTsZ+yq0yBYDo/+p4="
							}
							multi_step: {
								hash:       "OO3QEND4JQ6G5BFIQACQ1H7KM7MF8VKJ8F57GNEQ0071AORHTD90===="
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
