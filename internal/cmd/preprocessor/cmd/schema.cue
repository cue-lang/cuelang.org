package preprocessor

#site: {
	#page: {
		cache?: {
			upload?: [string]:     string
			code?: [string]:       string
			multi_step?: [string]: bytes
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
