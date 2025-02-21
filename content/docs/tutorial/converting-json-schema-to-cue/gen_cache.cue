package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "gISRtnVIsxFxTsdZWvsQgBjkOuwdu2An9h7+oX9aOGA="
								"schema.cue":         "ybsTVho5knw+QDWOdXu1NOpWvqxq2fVKCCjYQ+LXQp8="
								"split_pea.yml":      "mdklhcRdD8Ln0IApkaZ7o5O7QVLjkeqW+Bq9OV7NwtU="
								"pomodoro.yml":       "m10L0rvWU2CK6uk1ej/zJpA62Z65srMlsGRFfvg8bis="
								"pomodoro.yml fixed": "QMH6MQerhbS4pdTX3V7nOF1S1yFGIC+UvtvYylRH0Wg="
							}
							multi_step: {
								hash:       "GO7HNKLL637LNBK1TFR2QK1FP73EJBKMRVVM2PINAGE0ATVNJSCG===="
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
