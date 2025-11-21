# Contract: Layout Templates

**Location**: `layouts/`
**Type**: Hugo template overrides and additions

## Required Layouts

### 1. Research Section List

**File**: `layouts/research/list.html`

**Purpose**: Display publications grouped by type with proper citation formatting.

**Template Structure**:
```html
{{ define "main" }}
<article class="page">
  <header>
    <h1 class="page-title">{{ .Title }}</h1>
  </header>
  <div class="page-content">
    {{ .Content }}

    {{ $publications := site.Data.publications }}

    {{ range $type := slice "peer-reviewed" "preprint" "whitepaper" "technical-report" "talk" }}
      {{ $typePublications := where $publications "type" $type }}
      {{ if $typePublications }}
        <h2>{{ humanize $type }}</h2>
        <ul class="publication-list">
          {{ range $typePublications }}
            <li class="publication-item">
              <strong>{{ .title }}</strong>
              <br>
              {{ delimit .authors ", " }} ({{ .year }})
              {{ if .doi }}
                <br><a href="https://doi.org/{{ .doi }}">DOI: {{ .doi }}</a>
              {{ else if .url }}
                <br><a href="{{ .url }}">{{ .url }}</a>
              {{ end }}
            </li>
          {{ end }}
        </ul>
      {{ end }}
    {{ end }}
  </div>
</article>
{{ end }}
```

---

### 2. Journal Section List

**File**: `layouts/journal/list.html`

**Purpose**: Display articles with category filters and KnowOps-relevant grouping.

**Template Structure**:
```html
{{ define "main" }}
<article class="page">
  <header>
    <h1 class="page-title">{{ .Title }}</h1>
  </header>
  <div class="page-content">
    {{ .Content }}

    <!-- Category filter -->
    <div class="journal-categories">
      <strong>Filter by topic:</strong>
      {{ range site.Taxonomies.categories }}
        <a href="{{ .Page.RelPermalink }}">{{ .Page.Title }}</a>
      {{ end }}
    </div>

    <!-- Article list -->
    <ul class="journal-list">
      {{ range .Pages }}
        <li class="journal-item">
          <time>{{ .Date.Format "2006-01-02" }}</time>
          <a href="{{ .RelPermalink }}">{{ .Title }}</a>
          {{ with .Params.categories }}
            <span class="categories">
              {{ range . }}
                <span class="category">{{ . }}</span>
              {{ end }}
            </span>
          {{ end }}
        </li>
      {{ end }}
    </ul>

    {{ template "_internal/pagination.html" . }}
  </div>
</article>
{{ end }}
```

---

### 3. Frameworks Section List

**File**: `layouts/frameworks/list.html`

**Purpose**: Display framework overview with ecosystem positioning.

**Template Structure**:
```html
{{ define "main" }}
<article class="page">
  <header>
    <h1 class="page-title">{{ .Title }}</h1>
  </header>
  <div class="page-content">
    {{ .Content }}

    <div class="frameworks-grid">
      {{ range .Pages }}
        <div class="framework-card">
          <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
          {{ with .Params.framework.positioning }}
            <p class="positioning">{{ . }}</p>
          {{ end }}
          <p>{{ .Description }}</p>
          {{ with .Params.framework.status }}
            <span class="status status-{{ . }}">{{ . }}</span>
          {{ end }}
        </div>
      {{ end }}
    </div>
  </div>
</article>
{{ end }}
```

---

### 4. Framework Single Page

**File**: `layouts/frameworks/single.html`

**Purpose**: Display individual framework with related research and links.

**Template Structure**:
```html
{{ define "main" }}
<article class="page">
  <header>
    <h1 class="page-title">{{ .Title }}</h1>
    {{ with .Params.framework.positioning }}
      <p class="positioning">{{ . }}</p>
    {{ end }}
  </header>
  <div class="page-content">
    {{ .Content }}

    <!-- Framework links -->
    {{ with .Params.framework }}
      <div class="framework-links">
        {{ with .github }}<a href="{{ . }}">GitHub</a>{{ end }}
        {{ with .pypi }}<a href="https://pypi.org/project/{{ . }}">PyPI</a>{{ end }}
        {{ with .documentation }}<a href="{{ . }}">Documentation</a>{{ end }}
      </div>
    {{ end }}

    <!-- Related research -->
    {{ with .Params.related_research }}
      <h2>Related Research</h2>
      <ul>
        {{ range . }}
          {{ $doi := . }}
          {{ range site.Data.publications }}
            {{ if eq .doi $doi }}
              <li><a href="https://doi.org/{{ .doi }}">{{ .title }}</a></li>
            {{ end }}
          {{ end }}
        {{ end }}
      </ul>
    {{ end }}

    <!-- CTA -->
    <div class="cta">
      <a href="/contact/" class="button">Talk to a KnowOps Architect</a>
    </div>
  </div>
</article>
{{ end }}
```

---

### 5. Contact Form Shortcode Update

**File**: `layouts/shortcodes/contact-form.html`

**Purpose**: Add inquiry type selector for routing.

**Changes to Existing**:
```html
<!-- Add before message field -->
<div class="form-group">
  <label for="inquiry_type">How can we help?</label>
  <select name="inquiry_type" id="inquiry_type" required>
    <option value="">Select an option...</option>
    <option value="audit">Start a KnowOps Audit</option>
    <option value="review">Request a Framework Review</option>
    <option value="discovery">Book a Discovery Call</option>
    <option value="general">General Questions</option>
  </select>
</div>

<!-- Add optional company field -->
<div class="form-group">
  <label for="company">Company/Organization (optional)</label>
  <input type="text" name="company" id="company">
</div>
```

---

## CSS Requirements

**File**: `assets/css/knowops.css` (new)

Add to `hugo.toml` params.customCSS:
```toml
customCSS = ['css/contact-form.css', 'css/sticky-nav.css', 'css/knowops.css']
```

**Required Styles**:
```css
/* Framework cards */
.frameworks-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.framework-card {
  border: 1px solid var(--border-color);
  padding: 1.5rem;
  border-radius: 4px;
}

.positioning {
  color: var(--accent-color);
  font-style: italic;
}

.status {
  padding: 0.25rem 0.5rem;
  border-radius: 3px;
  font-size: 0.8rem;
}

.status-stable { background: #2E7D32; color: white; }
.status-beta { background: #F57C00; color: white; }
.status-development { background: #1976D2; color: white; }

/* Journal categories */
.journal-categories {
  margin-bottom: 2rem;
}

.journal-categories a {
  margin-right: 1rem;
}

.category {
  background: var(--bg-secondary);
  padding: 0.2rem 0.5rem;
  border-radius: 3px;
  font-size: 0.8rem;
}

/* Publication list */
.publication-list {
  list-style: none;
  padding: 0;
}

.publication-item {
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--border-color);
}

/* CTA button */
.cta {
  margin-top: 2rem;
  text-align: center;
}

.button {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  background: var(--accent-color);
  color: white;
  text-decoration: none;
  border-radius: 4px;
}
```

---

## Validation Checklist

- [ ] `layouts/research/list.html` - Renders publications from data file
- [ ] `layouts/journal/list.html` - Shows articles with category filters
- [ ] `layouts/frameworks/list.html` - Grid of framework cards
- [ ] `layouts/frameworks/single.html` - Individual framework with links
- [ ] `layouts/shortcodes/contact-form.html` - Updated with inquiry type
- [ ] `assets/css/knowops.css` - New styles for all components
- [ ] `hugo.toml` - Updated customCSS array
