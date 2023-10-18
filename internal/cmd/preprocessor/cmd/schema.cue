package preprocessor

#site: {
	#page: {
		// It's questionable whether these leftDelim and rightDelim should be
		// required or not. We can always relax this later.

		// leftDelim is the left hand delimiter used in text/template parsing for
		// root files in the page.
		leftDelim!: string

		// rightDelim is the right hand delimiter used in text/template parsing for
		// root files in the page.
		rightDelim!: string

		cache?: {
			upload?: [string]: string
			code?: [string]:   string
			multi_step?: [string]: [...{
				cmd:      string
				output:   string
				exitCode: int
			}]
		}
	}

	content?: _siteContent

	_siteContent: {
		[!="page"]: _siteContent
		page:       #page

		// Because this would otherwise be closed by #site
		...
	}

	// Just allow other fields for now. Things will break at a later date if we
	// bring other fields into the scope of #site that conflict with existing
	// usage, but that's fine for now.
	...
}
