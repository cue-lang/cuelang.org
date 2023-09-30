---
title: Tabs
weight: 33
---

You can add the tabs/tab shortcode to create tabs.
A tab shortcode  always needs to be part of a tabs shortcode.

## Usage

```
{{</* tabs */>}}

{{</* tab name="Tab 1" */>}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{</* /tab */>}}

{{</* tab name="Tab 2" */>}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{</* /tab */>}}

{{</* /tabs */>}}
```

## Pagination controls

If tabs don't fit in the current container or screen pagination controls will be shown. On touch devices you're also able to swipe.
For example resize this screen to 320px to see this behaviour.

{{< tabs >}}

{{< tab name="Tab 1" >}}
Lorem 1 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< tab name="Tab 2" >}}
Lorem 2 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< tab name="Tab 3" >}}
Lorem 3 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< tab name="Tab 4" >}}
Lorem 4 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< tab name="Tab 5" >}}
Lorem 5 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< tab name="Tab 6" >}}
Lorem 6 ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.
{{< /tab >}}

{{< /tabs >}}

## Tab group syncing
If you add a groupId the selected tab will be synced across tabs with the same groupId.
It will also be saved to localstorage so when you refresh the page or visit it a later time the saved tabselection will be pre-selected.

For instance in the example below when you click on one of the tabs both tabs instances will sync the tab selection.
When you refresh the page or visit the page at later time the selection will be restored.

If you don't add the groupId attribute or set it to 'default' the selection won't be synced and saved.

The current scroll position on the page will also be saved and reset when switching tabs within a group so you don't 'jump away' when another group expands and thus pushing the content below down.
```

{{</* tabs groupId="config" */>}}
{{</* tab name="CUE" */>}}
Lorem ipsum dolor sit amet....

```
{{< tabs groupId="config" >}}
{{< tab name="CUE" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.

```
firstName: "John",
lastName: "Smith",
age: 25,
residence: "Amsterdam",
occupation: "Developer"
```
{{< /tab >}}

{{< tab name="JSON" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi
epicurei sit te, at qui cibo dicta temporibus.

```json
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25,
    "residence": "Amsterdam",
    "occupation": "Developer"
}
```
{{< /tab >}}

{{< tab name="YAML" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.

``` yaml
- john
  name: John Smith
  age: 25
  residence: Amsterdam
  occupation: Developer
```
{{< /tab >}}
{{< /tabs >}}


{{< tabs groupId="config">}}
{{< tab name="CUE" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.

```
firstName: "John",
lastName: "Smith",
age: 25,
residence: "Amsterdam",
occupation: "Developer"
```
{{< /tab >}}

{{< tab name="JSON" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi
epicurei sit te, at qui cibo dicta temporibus.

```json
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25,
    "residence": "Amsterdam",
    "occupation": "Developer"
}
```
{{< /tab >}}

{{< tab name="YAML" >}}
Lorem ipsum dolor sit amet, alia invidunt honestatis te mea, tation docendi epicurei sit te, at qui cibo dicta temporibus.

``` yaml
- john
  name: John Smith
  age: 25
  residence: Amsterdam
  occupation: Developer
```
{{< /tab >}}
{{< /tabs >}}

{{< info >}}
A `code-tabs` shortcode can't currently be nested inside a `tabs` shortcode.
{{< /info >}}
