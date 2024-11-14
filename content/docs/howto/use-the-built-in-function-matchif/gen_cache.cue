package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "q4mo53Nh2sw4n8PzwLQpkzKPRUWLPuzYDUuCDrw+HQc="
								"future: helper fields": "D2t1lOaz24N1gPA5n45XdxkvplYCaMPenUuJBj+CeDU="
							}
							multi_step: {
								hash:       "JGI0KUKV9H7ST1RLISU9TCRARAAAH93VU3TQHGDTQA86MJVCQG20===="
								scriptHash: "U3PBCDG5C5D1SFV8I3IM3FH565CK1FM44DV3DFPJ5T2G7R77OS90===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-rc.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-rc.1
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
