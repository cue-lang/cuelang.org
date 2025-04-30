package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "h1t+m5Y5E6/HbHb2n2IxVATt8QGJ7Kf8z9ZQyD7Gdng="
								"2": "GgXpS1iLJtclwLimsn61+var+uZyVaa74ZBE+vWmt7I="
								"3": "TuxM6H08FVxJcizIUNT3cFThW7WvUiDYKawJUiE1otE="
								"4": "V2ode3hXS5FKtiS+pzZxF7mUvKdWQGhqgmFP5QoOwyU="
								"5": "IeLn/mDmyXbo7l/13CCEO7LBMxqWdiTP4s0YLXPu5ks="
								"6": "v3Qfx+veo1lNkAeuaXuRqCD90IgVw+lTp9HKdMb8zdY="
							}
							multi_step: {
								hash:       "02DV93LNGSDJR4TBHV965MIQ39RQ592OM1A0Q9I6O6JB2UGST17G===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
