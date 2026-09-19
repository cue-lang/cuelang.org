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
									"cue export # package x1":                                   "QMP3FVBIone+hRi8njM1zdUN13EOYWoovn+AAlcGYQI="
									"! cue export # package x2":                                 "taIdIz7s8ZaSnKpOgdTtjyNq1eI/kYbfbS2Vq62sBpE="
									"cue export . # package x1":                                 "q7ikyCM+qV3ndUusHhoKQnEjAbAhDPFVYx6j+Tirq6Y="
									"cue export .:one":                                          "SyRXqv6Mkbq8qQYojANfX6H6eRbBJwiKQgVwYJemwso="
									"cue export data.yaml":                                      "oiu0gomzGD5tXqKArE31iMPnyt6Nb8DZyDN/yY934YM="
									"cue export yaml: some.yaml.data":                           "B27mWwHFIcPTk7T5vF+OA0xsNT1mWUXz+qhilRBsooE="
									"cue export .:one .:two .:three":                            "WYhJ1KNGCksaIR61coPUjNky6EiQYP2qPlf86HR18W0="
									"cue export package + package file + data + packageless":    "Hr12J8urB3MFVm0jsgJTCRoSj1FuR8jC5N2eyXPSNvY="
									"package file + data":                                       "PM3Wb/i2bzyojp40Vce7PCsG2Af3AcINtMYlTZswq4c="
									"cue export package + 2x package file + data + packageless": "enR1rpg/b79mRdQiEnBBGmVKSfNqvpKUsSKnMqh4k90="
									"data file inputs":                                          "zR/nKxpc5MD2Yk6CuCj4OBkhQEtIMjuSawX8nDuHzro="
									"data file inputs failure":                                  "v+1eslVJzloJ738TLpd3jYxmM9upkA0bwoKUw4/NdQg="
									"constraint file validating data":                           "ycJkb5H1TI0yhYDUcQg0l8LaVpSPYOQEdEn1Vce64sg="
									"constraint file exported as data":                          "wOTuJWrh8g4EfqPVVDD0OZuwC50oCbL4fX3/PT78g74="
									"-l static single":                                          "2ZntBjAaWPHUIgPlRXGF0bgnPF7QpQRRFcsmZh900tc="
									"-l static multiple":                                        "wtgnGDtDQ3Q9NcHSddc9DuYl0Gw1XrokJzogyTnAq0M="
									"-l static multiple files":                                  "RMuE45YO6a4ipjTPt9yBbRHt7aarwO0Px5UCIfC2qZ0="
									"-l dynamic single":                                         "srNkTaLZz0HMu4uHbabiEIHAZqnGe8zXoK86lzGEvi8="
									"-l dynamic single with function":                           "J2QA0MQfBDYpNd960dwYNzEK0ZVV/bDLIfaRtLIRSIs="
									"-l dynamic --with-context":                                 "FJq51gg23DUkydhJclhJUBRYsHLlsldqBosVI2HvbjE="
									"multi-doc merge":                                           "2+atkY3yKgvhq78qWtOQYYu/bK7D3+tnKM8OcEXsvxI="
									"multi-doc list":                                            "GLHIHN1hKfjJvrRpyCeEOU0t4NYXF9bp6sJhT80vXDo="
								}
								upload: {
									"stdin data": "QqoQzGyfqw5UPzYpXYpRKfDc568Hv30ncXniN1PH7/8="
								}
								multi_step: {
									hash:       "M65724IN4DC36FD3330GNB52GM8JL69HPABF8293EJ7I5UQ1B900===="
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
