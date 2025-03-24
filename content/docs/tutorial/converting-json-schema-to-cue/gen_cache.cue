package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "etHceUaBAusL0lW8BXGFz3ABbLR0iWUmhxHQstuPnM8="
								"schema.cue":         "mCaFVPmMlJi4bqPkj2tC6aElJYj1o1LPKLvkpbN6egs="
								"split_pea.yml":      "BZmeH+ifCp3aOiFOxB2dQT49xuGlHFw70y0OIDeXTZc="
								"pomodoro.yml":       "cxzmGGx4MqLJq9TPBRS10Ca4e/F4pXvbrMXZRiF9iYs="
								"pomodoro.yml fixed": "vtXN/pRSQvVr0BV6rgF4dBTbkUBE/i9mSMlTfcT+/6w="
							}
							multi_step: {
								hash:       "9ROC1T724JGN8T6C0ERIFSVVTEEB0F4I229QANSTH0UT3130V92G===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
