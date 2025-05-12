## cli

- [https://docusaurus.io/docs/cli](https://docusaurus.io/docs/cli)

### version of doc

- [https://docusaurus.io/docs/versioning#overview](https://docusaurus.io/docs/versioning#overview)

```
website
├── sidebars.json        # sidebar for the current docs version
├── docs                 # docs directory for the current docs version
│   ├── foo
│   │   └── bar.md       # https://mysite.com/docs/next/foo/bar
│   └── hello.md         # https://mysite.com/docs/next/hello
├── versions.json        # file to indicate what versions are available
├── versioned_docs
│   ├── version-1.1.0
│   │   ├── foo
│   │   │   └── bar.md   # https://mysite.com/docs/foo/bar
│   │   └── hello.md
│   └── version-1.0.0
│       ├── foo
│       │   └── bar.md   # https://mysite.com/docs/1.0.0/foo/bar
│       └── hello.md
├── versioned_sidebars
│   ├── version-1.1.0-sidebars.json
│   └── version-1.0.0-sidebars.json
├── docusaurus.config.js
└── package.json
```

### Browser support

- [https://docusaurus.io/docs/browser-support](https://docusaurus.io/docs/browser-support)

## SEO

- [https://docusaurus.io/docs/seo](https://docusaurus.io/docs/seo)

#### Robots file

- `static/robots.txt`
- [https://docusaurus.io/docs/seo#robots-file](https://docusaurus.io/docs/seo#robots-file)

#### Sitemap file

- has support after build
- [https://docusaurus.io/docs/seo#sitemap-file](https://docusaurus.io/docs/seo#sitemap-file)

## writing helper

### doc front matter

- [https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-content-docs#markdown-front-matter](https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-content-docs#markdown-front-matter)

### Admonitions

- [https://docusaurus.io/docs/markdown-features/admonitions](https://docusaurus.io/docs/markdown-features/admonitions)
