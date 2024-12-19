package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "18GcN7wtNhQJTfUI0WnoRVJ9Qb5nUziuWTTHGRS7BP0="
								"future: helper fields": "JhwaATM40yOrH0LHJhS5K7rJjCwg+HsTg5vByox5mYs="
							}
							multi_step: {
								hash:       "USFFA4S5EN2IOEB5COSKRAP7LOC7KNTAU09CKLS7EDUFG6V9OHOG===="
								scriptHash: "MJLF7BQ0PCD04D0MGRPCENG1E75OKBQ1J3P1OUDHGIN137JFI2HG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
