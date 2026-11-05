package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					inputs: {
						page: {
							cache: {
								code: {
									"cue export # package x1":                                   "wBSWC42xjfeZ17yiHg8ih41B+PQ0LjpEkBXV9dypKiE="
									"! cue export # package x2":                                 "aPOr0d4wQ77P50C9Nr2X0Vzk+p7Ia/ktydI3/daSs3Q="
									"cue export . # package x1":                                 "Va3kF52J3DlKVfEIenHJOTFVoWp2c6nAVyIG/kTUThk="
									"cue export .:one":                                          "ougdSxFCQrSJNJFvs7HBDV3GTa5rfnRtC8jJ8CgDoAw="
									"cue export data.yaml":                                      "CaMOqgyvTlk3GdLG9DpQqwcRP4N02agn+OqYPnuZcTI="
									"cue export yaml: some.yaml.data":                           "+V3ufEOKecOBPHFVhBbZQvgiDkIcLhYiqMXFUgzC+5s="
									"cue export .:one .:two .:three":                            "U/Nutdo4B4m6nl/iT+8FBF4IdKUoy3Ugo2obQ8szFk8="
									"cue export package + package file + data + packageless":    "H9euILLuose5JXzmdkCdQiYUbULX9xGIl9nKYNt6iCI="
									"package file + data":                                       "JQ6+PdhcEaHoRqkTjTcsT3oQXsfGS79a89v8vwxMUss="
									"cue export package + 2x package file + data + packageless": "Pme1+8zzaihL7FtgchdmYjt5Y2rbmBFPLx7wcTEOTWw="
									"data file inputs":                                          "VZKy/LUCIL9WvcZQ4aCdRoF2LkQm7gSE/12ME+QmN6E="
									"data file inputs failure":                                  "doVsZpqJ/njsaurLy0QLRVbukYVVb20+DjTRhLm/7oY="
									"constraint file validating data":                           "dVD4wq+z/AMFzBpqqyH4miOBWJ5Wm+0aVB7EckcthCg="
									"constraint file exported as data":                          "VLkRWR8zxzj2jIT8DqM6+RK+PgnIk6Ac8xO0emaBQy0="
									"-l static single":                                          "i7h1vnIT1Z8Eo5ktnv0WObbiJfJCtRE6tED6hnCUSZs="
									"-l static multiple":                                        "EzcTTouEOstQcr3GiTuxJKFFAtN3MOJFll7U0k/9Qxw="
									"-l static multiple files":                                  "hqnE8erC/qE06b6F5YxP900U0InotdvatYFBig2zkdE="
									"-l dynamic single":                                         "++3A2DHC6gqVXuK5WdR78JUG3J+F5gKGwBxJzM8uuc4="
									"-l dynamic single with function":                           "VEoVaNKhDGeShH2kC79Kn/6ex5ycZX3f1s/PdbBEkH0="
									"-l dynamic --with-context":                                 "elTgwx8myNyUTQm8LymI9jvurfq2F0dgmaNgi028vTA="
									"multi-doc merge":                                           "X2WrDO6t3RG3hqYTV2JswECyZu8K747WI+4CaseMTR8="
									"multi-doc list":                                            "8VfEuTLXLpKV+MNs/wP3njCnYiLbfwDvzVR1uir72Qw="
								}
								upload: {
									"stdin data": "10fDpFfP88wB7zYqbEKTEUaChcgsh11susmxjeSiUps="
								}
								multi_step: {
									hash:       "QR4Q458L6IDSI7FNMFORVNASKOJ1VID213TJT22OF53QN1JRNNM0===="
									scriptHash: "MJUN7HPDDME4DUAPEGT4MCDV62AAPOJFS9U7BF2FN1RBTEVKIH9G===="
									steps: [{
										doc:      ""
										cmd:      "cat data.yml | cue export yaml: -"
										exitCode: 0
										output: """
												{
												    "A": [
												        "b",
												        "c"
												    ]
												}

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
