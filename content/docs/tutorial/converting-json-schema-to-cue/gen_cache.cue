package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Yz4Ank8ToWAhIQ7fpG3PTQ2cY7RG7tESdT2sf18Vm8c="
								"schema.cue":         "mGdnzs3dP3bmCDqWo8G3p+PMBeSCEWPEi4xsB8Qz6aQ="
								"split_pea.yml":      "COSdSBjSBFxbmRxJmxMjzFk/z9Cur55jXqKdQ8U5Jbk="
								"pomodoro.yml":       "oB5kItJLEqRnPs0k9EDp0jTnah9/Beiy8iSfNQ05qJc="
								"pomodoro.yml fixed": "g4s3WvIPBD1Cqpr0zENnqp/lZJBjflD194nkHGMdVAE="
							}
							multi_step: {
								hash:       "QIHH154HOQMSVHUPLBDUO5ELK5AUQ48HPIN38FVK2PNK8HIQE6I0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-0.dev.0.20250620080802-8d463da28a21
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
