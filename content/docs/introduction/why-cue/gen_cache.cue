package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:          "6zBizQEea1mI66qvKhdYPym3EUoCbkXxoEYa37tJprc="
								data:            "Iniyp9/9kY8B+mjjZ28Hke8Wn/9J2H37S4KBp8L//1o="
								defaults:        "JDFmFbOWdBzDpjGnrGtefob7kHXWwowc0Zly4HIPQvo="
								"site.cue 2":    "pSNYnrSgCkDdj5eS99DU0JbEv/PHIqbmxjRn/fOOsGU="
								"broken update": "2C2AKKXwIa3bm5199CWRDuAE9R/C9mNxpV2sfFoEi5w="
							}
							multi_step: {
								hash:       "01L306DJRQRK7FNUSTP3D1K293F4LNQUK0AFSH9BR1E3NUISA9J0===="
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
