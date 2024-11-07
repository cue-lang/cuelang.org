package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "CqKKsDxW7dOOv0H329mKiFWunWW+atjQeQwlQ2GX0fo="
								"future: helper fields": "4LsFYBd8Wc+f2l4/Jws7q59gi3wYVl1kxMEU8b2V77s="
							}
							multi_step: {
								hash:       "1L0L2LEL7DUVD96GPTVR7NAGUJHRDH7CQGD781AJIB87BPNSCNBG===="
								scriptHash: "757SCV7C4OGVA32EVICM9N08I3IJ1GSFHN5ITFJQTH5RJJ3RD3NG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-alpha.5:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.5
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:basic"
									exitCode: 1
									output: """
											build constraints exclude all CUE files in .:
											    example.cue: package is matchIf, want basic

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
