package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "AQq3z8SdbdMYswICW19BrUAe1F+cAbisQQZ7dmz+tvI="
								"schema.cue":         "K7p1zsJXPLAZemm3U4S0bb96fl2kZtPzccbTSdvLA2I="
								"split_pea.yml":      "3OZT75PTFiyXOIxsd9WdGRkJ0rl8zcw8j7JoGP6wgpo="
								"pomodoro.yml":       "mVJXbravKRHHJqRt1DVWnzS4NG/8HqIuHOqksRSK02M="
								"pomodoro.yml fixed": "0nk3/bkFLFxGy2l2DGm7OtudVMwB9LqAingKYOUKuqk="
							}
							multi_step: {
								hash:       "UI5JCQE8MOJQ96I804K8KRI0GSCB68BBJRM6KDJTPE4IHRFVJR40===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
											    ./schema.cue:12:17
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
