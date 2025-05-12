## docusaurus-api-template

> for api of

## features

- `docusaurus` 3.17+ [https://docusaurus.io/docs](https://docusaurus.io/docs)
- management by `pnpm`
- close `blog`, and keep `docs`

### GUI features

- [x] hidden and foldable side column record
- [x] [Math Equations](https://docusaurus.io/docs/markdown-features/math-equations)
    - [x] support `remark-math`
    - [x] support `rehype-katex`
- [x] support `mermaid` [https://mermaid.js.org/#/./n00b-syntaxReference](https://mermaid.js.org/#/./n00b-syntaxReference)
    -[@docusaurus/theme-mermaid](https://docusaurus.io/docs/api/themes/@docusaurus/theme-mermaid)
- [x] `TOC of markdown` support `level 2` (docusaurus support level 2-6)
- [x] `sitemap` auto build by plugin [@docusaurus/plugin-sitemap](https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-sitemap)
- [x] add [docusaurus-search-local](https://github.com/easyops-cn/docusaurus-search-local)
    - only at `build` version show search
- [x] `ideal-image` [https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-ideal-image](https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-ideal-image)

## env

- node `v20.+`
- build out folder is `build`

## usage

### by makefile

```bash
# first run
$ make init

# run local
$ make run
# run local build
$ make runBuild
```

## more usage see

- [usages/README.md](usages/README.md)