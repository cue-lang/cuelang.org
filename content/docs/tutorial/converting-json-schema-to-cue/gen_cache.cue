package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ec2NfeQLGxGTN85kK1mUwzMmUiTrnKExnIgfK+I0yH4="
								"schema.cue":         "dV6nGeEp0F1iHo1uiUm+sAxt+heC7ZCqyV/tIpP0Ggw="
								"split_pea.yml":      "Z9dMahjK6qeYi2Yk1XDjdDoYCI0QePGmNTmBCNGxiC8="
								"pomodoro.yml":       "QqNsjT51gGAOr+qDQ1r4lPHngtbCvY0Bw2WwV7Tn5us="
								"pomodoro.yml fixed": "KzFGWiGfROQIMuGCv1Ow5bOBPb3yEJNbh/Uy6AAiZ5s="
							}
							multi_step: {
								hash:       "62EQUBMI3QLV06518G881LDF7F36N3N197JJH1HFEHC91GUBBT1G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-rc.1.0.20251031142455-4ba957271db1
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
