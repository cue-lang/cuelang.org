package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "I0zeKGSUimKNoEgsaFwisw47c6dVtVBkH8x4Ew8261w="
								"schema.cue":         "jG1rvkuOukbZE48zUe2rHRfR8bdu8xIYFcI6AZo33ic="
								"split_pea.yml":      "5UOJ4/DyELSk6BQlwgJRv9cpemPc+bmxFWO3GW6SS14="
								"pomodoro.yml":       "00dv290qtT3l7LxIGDFTXtMDlnXgHNL1UWd01kiNUas="
								"pomodoro.yml fixed": "57ffPkXeDj3p4YtS5PFs4ublIOtVdz7RZQuYWyZsc38="
							}
							multi_step: {
								hash:       "1IU5T1CMQ0AHE2JU83Q293TGS3M55CA5J1CVUL3076S98NININOG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261127222705-d53722b2b9cd
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
