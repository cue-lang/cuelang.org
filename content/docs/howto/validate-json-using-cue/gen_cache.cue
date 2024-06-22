package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "0YUPt1YxvxiMl2eDz52+f3sXbabUkAsl5SSXdujQPss="
								"x.cue":        "GtRFkvpp2shtAT7bt6XGQ3GFqyu7WK9C41+gHyhfIJA="
								"x.json v2":    "P6SGGPbdYvblf0oUbEmbKmxNn62GHdaorflbhcXeJCg="
								"fixed x.json": "tpp5sirofiEWgs0DmpjTyuUpg/B2iw2ldp+X7Z/Bhow="
							}
							multi_step: {
								hash:       "9IDSUGKS91S6OBQJGKEQFDGM3N4G5GQ0MT94IH402ECGSI9R1VJG===="
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
