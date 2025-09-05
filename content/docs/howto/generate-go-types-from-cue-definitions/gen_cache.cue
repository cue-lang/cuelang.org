package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "gLqrZlVdQyx4l3r/+2xjqLAyUy5aq5eyr5XfDfFsaBk="
								"cue_types_gen.go 1":     "yxbKBhWVHq/RTcpWTiO8dIcoA7Uvflt79Sz3sC/UUwM="
								"example 2":              "Rk7G9zjLom6qCmaKsf7V7bMAWmfmKeLOTVOMPbScUUY="
								"cue_types_pet_gen.go 2": "YtIVhQLtx/PQCrLwv/vDIRfKwzvl8UKzarU4Tu7R+Eg="
							}
							multi_step: {
								hash:       "16GU8P3T88SMHRNK1CVEJOHU7L3ORBEMBOMUSPCAGM2QR2OS04M0===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
