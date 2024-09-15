package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "faJLQ9qJ0zEjoETOb8BWG3A9VaxZCVjDtRLb1DjY2N0="
								"schema.cue":         "uNd6LtD4OV1j1oz7fOevhXgAJ/R9N7Zwruj2T95oNrg="
								"split_pea.yml":      "LlNir9ETMBUHSzi8ew/hch1WadxqGZVzlGq0kd5RX88="
								"pomodoro.yml":       "GBPkll4/bOLlZermsEs+GA9AtdpJIXmlxbLK998PUqc="
								"pomodoro.yml fixed": "iUdV7r0MRFj6TNB//adsAV+RGAObzprlswjXXm9Sem0="
							}
							multi_step: {
								hash:       "378R3SL5UM8SJ9C6P4DRA8UUJC10NI4D65BQN5ESOSE0EDH0Q3E0===="
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
