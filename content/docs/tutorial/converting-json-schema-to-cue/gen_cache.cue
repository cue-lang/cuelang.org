package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Cz/eUReg5ERyNTuaC4kkbgXIWFzMFHTk1yncbRRI/nA="
								"schema.cue":         "yMpLhc85noOUKZQWbjwdrD3HK+mWDqLA6VJAp8VpNGA="
								"split_pea.yml":      "sTx80IZJhPUV9LL/PwHHMDbtLxTf+2WmiUcrd3G1ZMg="
								"pomodoro.yml":       "chfk/IOf2ys7ghJIweSO2MAN93igx8ZJQJKLD/AwjC4="
								"pomodoro.yml fixed": "N93hjdcHIM3BT82u7nvs0a4Cenf+lbhmqjFF2AQpunw="
							}
							multi_step: {
								hash:       "P83KRR20K9EON1KDU9DA2G5FAGMJO2308H64QFDNSVD1I4E0LB0G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.3.0.20241010142549-44cceca80690
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
