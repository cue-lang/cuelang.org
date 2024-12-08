package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "pqMR2cOX71Qejooq2uMqOJpWF8+iQZjIdZ62MKGH10I="
								"future: helper fields": "OYjNBB8cP6GXNymiuW4zhxsqXV6mYZZxEyKSn0LtpIc="
							}
							multi_step: {
								hash:       "H5M7FJ3RPJ8QAGB0JJM3A114UAEAL3HE22HC65G47I4VP2E0UR5G===="
								scriptHash: "CJ7RH0NDBMUGA4Q8DJDL7D0RUELPTI2G633U638OI6JEEAARSBI0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241208100708-432c1141e6e7:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241208100708-432c1141e6e7
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchIf): invalid value 42 (out of bound >100):
											    ./example.cue:9:4
											    ./example.cue:5:4
											    ./example.cue:9:12
											    ./example.cue:9:17
											    ./example.cue:9:23
											D: invalid value {x:"some string",o:99} (does not satisfy matchIf): invalid value 99 (out of bound >100):
											    ./example.cue:17:4
											    ./example.cue:13:4
											    ./example.cue:13:26
											    ./example.cue:20:17

											"""
								}, {
									doc:      "# This command currently succeeds:"
									cmd:      "cue vet .:helperFields"
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
