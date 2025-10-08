package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "hbasejc2uuYmCqh1lakuhSmTPXzvevxSnJJCpoLZhuo="
								"initial x.cue":  "5r1aFKhMHjJ+A4VrOBE1zxuU0tIPp+27QVtnsnOY/SI="
								"another person": "qIuRtZTc0XINJ1YnGH4q7lOO04p02kXMWOTMRUBBG6Q="
								"fixed yaml":     "a6C5idj2n9aLFqXImykDI87swGsLlLFO+G7Y8logelw="
							}
							multi_step: {
								hash:       "7N12URR35CBSGHKVM39I26DHT0DQOJBTI2QVTO4A02F0OC7OPED0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
