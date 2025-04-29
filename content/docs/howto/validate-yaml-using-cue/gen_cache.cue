package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "pWBCS6WIo8fwyF0BPcZTvtx64VTOlJM/8JXpFt2DpNU="
								"initial x.cue":  "oaidPuFBFlcPEba1nKKDQmcJi7ox8kmsXZXvzs+OUs8="
								"another person": "icKQuoguJPrww6kBgCEEkz2ph8GnXimqvroAnC9DvBg="
								"fixed yaml":     "NJDNdbuAvezompG3KLjIYChR8YVPi+5ioF2H8wtWHw4="
							}
							multi_step: {
								hash:       "TM332GHV7MHIO7NDUOHT64K6KA7BG2NA0D179RNRMTKCAEV22HU0===="
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
											    ./x.cue:7:21
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
