from copy import deepcopy
from mkdocs.structure.pages import Page

def on_page_context(context, page: Page, config, nav, **kwargs):
    """
    For pages with 'nav_section' front matter, temporarily inject a nav
    with the orphan page under the named section and marked active.
    """
    section_name = page.meta.get("nav_section")
    if not section_name:
        return context

    temp_nav = deepcopy(nav)

    def find_section(items, name):
        for item in items:
            if getattr(item, "title", None) == name:
                return item
            children = getattr(item, "children", None)
            if children:
                found = find_section(children, name)
                if found:
                    return found
        return None

    section = find_section(temp_nav.items, section_name)
    if section:
        page_copy = deepcopy(page)
        page_copy._url = page.url  # mark as current for expansion
        section.children.append(page_copy)

    context["forced_nav"] = temp_nav
    return context

