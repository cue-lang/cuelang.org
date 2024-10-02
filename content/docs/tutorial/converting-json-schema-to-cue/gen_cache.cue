package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "b6ue/0Gjzq58WNxDbkqZ5xoh61PVvqR3j5nPZJW9hKY="
								"schema.cue":         "WZRpB+mb9yUskDryZaya4D0+6APem1C0rcqUZzaEgSQ="
								"split_pea.yml":      "p9rmavDqLslUBHKbwmVUTnpKH6QkAOLnjaIB4NH+YUg="
								"pomodoro.yml":       "WpcZkpk9gcMMyMffovdjnRFDcfBi/HyhzSBtt2pKb7o="
								"pomodoro.yml fixed": "jYc8Ig20PuBFFi3HjVz5BNBNWVxF3kFBUkbHezRsRL4="
							}
							multi_step: {
								hash:       "84554IJ6K6T5AEVGMT5EPIHEI8U24MHARLTAHU5S20IMVKSGMV30===="
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
