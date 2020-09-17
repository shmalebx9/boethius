# Markdown to PDF script
This script is a wrapper for pandoc and url2cite with a sane default template. PDFs generated with this wrapper will be formatted to the default template provided (Eeisvogel) and citations formatted to the default CSL (Chicago-note).

# Required tools
* [url2cite](https://github.com/phiresky/pandoc-url2cite) for citations
* [pandoc](https://pandoc.org/)
* [tectonic](https://tectonic-typesetting.github.io/en-US/) as a pdf engine
* A functioning Texlive installation (Check your distro's docs)

The bootstrap function in the script will attempt to install these tools. The bootstrapper is configured  for void and will not work properly on other distros.

# Credits
Eisvogel latex template from [Pascal Wagler and John MacFarlane](https://github.com/Wandmalfarbe/pandoc-latex-template)

[url2cite](https://github.com/phiresky/pandoc-url2cite) by phiresky

Chicago-note CSL from [Zotero](https://www.zotero.org/)