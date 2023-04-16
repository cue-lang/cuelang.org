---
title: YouTube
weight: 35
---

When using the youtube shortcode, you will need the Video ID associated YouTube video.
Copy the YouTube video ID that follows v= in the video’s URL and pass it to the YouTube shortcode:
```
https://www.youtube.com/watch?v=w7Ft2ymGmfc
```

```
{{</* youtube w7Ft2ymGmfc */>}}
```

For accessibility reasons, it’s best to provide a title for your YouTube video. You can do this using the shortcode by providing a title parameter.
If no title is provided, a default of “YouTube Video” will be used.

```
{{</* youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" */>}}
```

{{< youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" >}}
