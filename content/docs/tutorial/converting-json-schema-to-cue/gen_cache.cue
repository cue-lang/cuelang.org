package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "oUGrHd47N0cEyoYPEfs+EHosaA/OHmW8Id0mui6/htU="
								"schema.cue":         "++jfUfWBDsCVsARB9+VVuinYzbZTMiNvT+zYBSwKVAc="
								"split_pea.yml":      "NTfaxV4rff7US9aE6cD223lwt+2GlEUUKUoFwnOg4Fg="
								"pomodoro.yml":       "jBY9mV56H7BNNPVU9zVyLCfnZGqH57Hpc+jH40aA4HE="
								"pomodoro.yml fixed": "sgemwAJ8SGmeHREpeRWkdX+/aNetZJ4YuWuFo+jLeDM="
							}
							multi_step: {
								hash:       "6OH4ALQGDBA93J0TAHSMQ0JD9BP26I6VK49U1GE0CBHP3QC4VSKG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
