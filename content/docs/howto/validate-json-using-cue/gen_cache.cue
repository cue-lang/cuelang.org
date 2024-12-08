package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ttPCrORtxe+amf8+cvjyTarsf+pG1ictXgKYznjNcCs="
								"x.cue":        "66QfWzFFf3/D1Lq6FmFFqX6Zw6SHf46IHeFVSf5febQ="
								"x.json v2":    "7B903oHjkTbjLfLCg2uOzRCUcoWr7lr+diVDsYz15rY="
								"fixed x.json": "YiwjU9PEn04Lb+UH9i00eJ/NO1sRhuCCqKgKe1e2MSQ="
							}
							multi_step: {
								hash:       "JEP985TCJ3EEHQFM4GORH0BHCCS75N3D38FC3LDIPGV9L5GDENS0===="
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
