# jekyll-theme-judo

A clean, enterprise-style Jekyll theme for GitHub Pages inspired by **judo.codes** (hero-first, modular sections, bold typography).  
This repo is a *remote theme* ready for GitHub Pages.

> ⚠️ This theme does **not** include any assets or trademarks from judo.codes. It only mimics the layout/feel with original CSS.

## Quick start (remote_theme)
1. Create or open your GitHub Pages repo (e.g. `username.github.io`).
2. Add this to your site’s `_config.yml`:
   ```yml
   remote_theme: YOUR_GITHUB_USERNAME/jekyll-theme-judo@main
   plugins:
     - jekyll-remote-theme
   ```
3. Create `index.md` with front matter:
   ```md
   ---
   layout: home
   title: Open source
   subtitle: low-code toolbox for developers
   cta_label: Get started
   cta_url: https://github.com/
   ---
   ```
4. Commit & push. GitHub Pages will build it.

## Content
- **Hero** with big stacked headline + CTA
- **Section blocks** (`_includes/section.html`) for features/modules/pricing/history/faq
- **Responsive nav** + footer
- **System fonts** by default; customize in `_sass/judo/_variables.scss`

## Local dev
```bash
bundle install
bundle exec jekyll serve
```

## Customize
- Change accent / fonts in `_sass/judo/_variables.scss`
- Override any include by copying it into your site and editing there
- Add pages with `layout: default` or `layout: home`

## License
MIT
