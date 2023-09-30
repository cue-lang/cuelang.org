---
title: YouTube
weight: 35
---

When using the youtube shortcode, you will need the Video ID associated YouTube video.
Copy the YouTube video ID that follows v= in the video’s URL and pass it to the YouTube shortcode:

```
https://www.youtube.com/watch?v=w7Ft2ymGmfc
```

For accessibility reasons, it’s best to provide a title for your YouTube video. You can do this using the shortcode by providing a title parameter.

```
{{</* youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" image="cow.jpg" */>}}
```

{{< youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" image="cow.jpg" >}}

## Attributes

id
: required - Set the ID of the youtube video you want to show

image
: required - Set the preview image of the video

title
: optional - Set the title of the video

lazy
: optional - When this section is the first section you might want to set this value to `false` (recommended for first meaningfull paint). Default is `true`

## Examples

```
{{</* youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" image="cow.jpg" */>}}
```

{{< youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" image="cow.jpg" >}}

```
{{</* youtube id="w7Ft2ymGmfc" image="cow.jpg" */>}}
```

{{< youtube id="w7Ft2ymGmfc" image="cow.jpg" >}}
