package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:          "bkSu4SfR6p8fnR3i3FqzVMmbbvRaFFo+XQu/0p7eo2s="
								data:            "fg/Dobcd1DdHyFGgIkwb/GGO1vl/DRflw9jxiPUn9kA="
								defaults:        "FqCQ/RoZxiDTS75kU0MEoC9hmCl+roC3f3647PaKZ4I="
								"site.cue 2":    "FRF0Naux/D9DWm9Rv8jZ94OJFaMNWPIYkPmQEdxGDSk="
								"broken update": "QyykkM9yNtNFHibOfAOalun1pD7iQaD0l+N49D6klJA="
							}
							multi_step: {
								hash:       "KAI6J8EMGANTVIM7EF1B28VTGD2A8K2RC178TA9844U02891N2R0===="
								scriptHash: "CTCHP9D7H7K2OMJFPBHMK9OP8J609364U36R5VJBDHGVBQBC39P0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv site.cue .site.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff site.cue .site.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											pages:
											  home:
											    title: Welcome to Widgets'R'We!
											    urlPath: /
											    summary: The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East.
											    isDraft: false
											    author: null
											    date: "1999-01-01T00:00:00Z"
											    file: pages/home.html
											  about:
											    title: About Widgets'R'We
											    summary: Information about the Widgets'R'We company.
											    isDraft: false
											    author: null
											    date: "1999-01-01T00:00:00Z"
											    urlPath: /about/
											    file: pages/about.html
											  contact:
											    title: Contact Widgets'R'We
											    summary: Contact information for the Widgets'R'We company.
											    author: Markus Marketing
											    isDraft: false
											    date: "1999-01-01T00:00:00Z"
											    urlPath: /contact/
											    file: pages/contact.html

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 1
									output: """
											pages.about.title: conflicting values "Cyber Widgets 2000" and "About Widgets'R'We":
											    ./site.cue:13:12
											    ./updates.cue:4:16

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
