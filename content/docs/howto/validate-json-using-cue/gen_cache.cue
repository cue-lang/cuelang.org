package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "WnxZCQQ8tzSJWgZn2eHsaHHGNCd/1hl+yxbrf12KpG4="
								"x.cue":        "dQwhYwpuq876SBPT6yB+Iau/fnLfICSA+vlb+kcfWZw="
								"x.json v2":    "DkqqLNJEzbzOAAcRp4EWWeI8XDcngk0zkNaZilMmZTM="
								"fixed x.json": "7Q7y18JiQplkPpbVJKSPxoKZ3lwzWvh5uuq/z34NVWE="
							}
							multi_step: {
								hash:       "M5FINORMF625UKN9D7IKBNTTF5LNDFNISO8UITOUHEAHPSVO1TU0===="
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
