package site
{
	content: {
		docs: {
			howto: {
				"ensure-list-contains-no-duplicates": {
					page: {
						cache: {
							code: {
								"simple-strings-integers":          "GSmB9aitTgtqhrbi+P400VS0Uzk4wwqIlRDcQ4eIqOM="
								"struct from map":                  "hbESsWDFZ8D8Ni1Sv4zCJQatkE0CK5wrRSpMSbEQIAI="
								"struct - single field":            "djFK8/6LpFvqg9P9auw8erwP7Llp/5vJcvA4eZEW0uA="
								"struct - multiple fields":         "hHba9KrLNoCUA0nv6A4/KsIrh0pJFAA3rYdc7nVFuE4="
								"struct - direct function failure": "YzV01ejLEzllMrglBXPeUYyHxt8nSSJaDUTDB+8o7vs="
							}
							multi_step: {
								hash:       "LETDND1QGA7EA5J6G4LTC8QKTI2C25B05JSCDL7UKBRQAPHTBAC0===="
								scriptHash: "OL705T70RIP6KIHIJ7NTJIVBPS2V33BI2CIDEN4074ROB9HKOCCG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-alpha.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1
											...

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
