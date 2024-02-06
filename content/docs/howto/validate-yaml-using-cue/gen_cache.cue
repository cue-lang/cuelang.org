package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "AohY53u6E6IIBLkUSS5Ov/Mn6nhyKuXdGCX2MbNogVY="
								"initial x.cue":  "blhusFPV8mDLvzpftEvZeki0xXqar+rcXT6a+U4RtM8="
								"another person": "+cn+g6uJuR8ZvmpIAZKV3+FfdozgpvmcOdLjD154zEY="
								"fixed yaml":     "h45TdSYaa/PD2hUP6xM/HT6W6m6QpoN4Zu98zjOcUvI="
							}
							multi_step: {
								"8P33UORPSCUBBK0J3MTN6R4KMG29UDN8VEQODIJ2R7KC3UR6NG90====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									cmd:      "cue vet x.cue x.yaml"
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
