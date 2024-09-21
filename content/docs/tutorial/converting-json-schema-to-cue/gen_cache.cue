package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "gIyrL+kC4aJy8sM8Qif8P9wRCBEgo+WOR98moclY4ew="
								"schema.cue":         "47j0dDRseg6wKSCOFqI84W9DMh3gNFUuSXBk0NtIRQs="
								"split_pea.yml":      "VDXVrqHXwdXxclwih6Dv76HQLNCmNPU+cNh5eKmRmeA="
								"pomodoro.yml":       "IGIjZOmT/Xpmurt2OsMNV+8IHdKkS0o1t3b1AOt6TGQ="
								"pomodoro.yml fixed": "3l1EpjIucukBrWzUcd3c2gZmhQmfdV8gyP6arUu9oXM="
							}
							multi_step: {
								hash:       "VDDAPVB3RVOQ28PQSEQGQVNPEDQCVRIVRLEHHUH6FVP1K321PJTG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
