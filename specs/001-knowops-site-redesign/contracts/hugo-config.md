# Contract: Hugo Configuration Changes

**File**: `hugo.toml`
**Type**: Configuration update

## Menu Structure

Replace existing `languages.en.menu.main` array with:

```toml
[languages.en]
  languageName = 'English'

  [[languages.en.menu.main]]
    name = "What is KnowOps?"
    weight = 1
    url = "knowops/"

  [[languages.en.menu.main]]
    name = "Frameworks"
    weight = 2
    url = "frameworks/"

  [[languages.en.menu.main]]
    name = "PrefrontalOS"
    weight = 1
    parent = "Frameworks"
    url = "frameworks/prefrontalos/"

  [[languages.en.menu.main]]
    name = "CortexGraph"
    weight = 2
    parent = "Frameworks"
    url = "frameworks/cortexgraph/"

  [[languages.en.menu.main]]
    name = "STOPPER"
    weight = 3
    parent = "Frameworks"
    url = "frameworks/stopper/"

  [[languages.en.menu.main]]
    name = "Services"
    weight = 3
    url = "services/"

  [[languages.en.menu.main]]
    name = "Research"
    weight = 4
    url = "research/"

  [[languages.en.menu.main]]
    name = "Journal"
    weight = 5
    url = "journal/"

  [[languages.en.menu.main]]
    name = "About"
    weight = 6
    url = "about/"

  [[languages.en.menu.main]]
    name = "Contact"
    weight = 7
    url = "contact/"
```

## SEO Updates

Update `[params]` section:

```toml
[params]
  author = 'PREFRONTAL SYSTEMS℠'
  description = 'KnowOps - Knowledge Operations for reliable AI systems. Cognitive architecture, memory systems, and behavioral safeguards.'
  keywords = 'KnowOps, knowledge operations, AI cognitive architecture, AI memory systems, executive function for LLMs, STOPPER protocol, PrefrontalOS, CortexGraph, computational therapeutics, model welfare'
  info = ['· · · · ·', 'KnowOps for Reliable AI Systems', 'Cognitive Architecture', 'AI Behavioral Research']
```

## Validation

- Menu items ordered by weight (1-7)
- Frameworks submenu items have `parent = "Frameworks"`
- All URLs end with `/`
- Keywords include primary KnowOps SEO terms
