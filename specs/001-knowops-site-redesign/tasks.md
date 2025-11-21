# Tasks: KnowOps Site Redesign

**Input**: Design documents from `/specs/001-knowops-site-redesign/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: No automated tests - this is a Hugo static site. Validation is manual browser testing.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

Hugo static site structure:
- Content: `content/`
- Layouts: `layouts/`
- Static assets: `static/`, `assets/`
- Configuration: `hugo.toml`
- Data: `data/`

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Configuration and foundational file structure

- [ ] T001 Update navigation menu structure in hugo.toml per contracts/hugo-config.md
- [ ] T002 Update SEO params (description, keywords) in hugo.toml per contracts/hugo-config.md
- [ ] T003 [P] Create knowops.css with framework grid, journal categories, publication list styles in assets/css/knowops.css
- [ ] T004 [P] Add knowops.css to customCSS array in hugo.toml
- [ ] T005 [P] Create content/knowops/ directory for cornerstone page
- [ ] T006 [P] Create content/frameworks/ directory for framework pages
- [ ] T007 [P] Create content/research/ directory for publications
- [ ] T008 [P] Create data/ directory if not exists
- [ ] T009 Create data/publications.yaml with initial STOPPER paper entry per data-model.md
- [ ] T010 [P] Create data/seo-keywords.yaml with keyword sets for all page types per contracts/seo-config.md
- [ ] T011 [P] Add optional sitemap configuration to hugo.toml per contracts/seo-config.md

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Layouts and templates that ALL user stories depend on

**CRITICAL**: No content pages can be properly rendered until these layouts exist

- [ ] T012 Create layouts/frameworks/list.html for framework grid display per contracts/layouts.md
- [ ] T013 [P] Create layouts/frameworks/single.html for individual framework pages per contracts/layouts.md
- [ ] T014 [P] Create layouts/research/list.html for publications grouped by type per contracts/layouts.md
- [ ] T015 [P] Create layouts/journal/list.html for articles with category filters per contracts/layouts.md
- [ ] T016 Update layouts/shortcodes/contact-form.html to add inquiry type selector per contracts/layouts.md
- [ ] T017 [P] Create or update layouts/partials/head.html to merge SEO keywords from data file per contracts/seo-config.md (if theme doesn't handle automatically)

**Checkpoint**: Foundation ready - all layouts exist for content pages

---

## Phase 3: User Story 1 - Discover KnowOps Category (Priority: P1)

**Goal**: Visitors understand what KnowOps is within 30 seconds of viewing homepage

**Independent Test**: Load homepage, verify hero defines KnowOps, explains DevOps/MLOps differentiation, shows framework overview, includes CTA

### Implementation for User Story 1

- [ ] T018 [US1] Create content/knowops/_index.md cornerstone page with full definition, pillars, and integration explanation per contracts/content-structure.md (2000+ words)
- [ ] T019 [US1] Update content/_index.md homepage with KnowOps hero, differentiation section, framework overview cards, and primary CTA per contracts/content-structure.md

**Checkpoint**: Homepage and cornerstone page complete - visitor can understand KnowOps

---

## Phase 4: User Story 6 - Contact for Engagement (Priority: P1)

**Goal**: Visitors can submit inquiry with routing by type (audit, review, discovery, general)

**Independent Test**: Navigate to Contact, verify inquiry type selector appears, form submits successfully with selected type

### Implementation for User Story 6

- [ ] T020 [US6] Update content/contact.md with "Work With Us" title and engagement framing per contracts/content-structure.md

**Checkpoint**: Contact form functional with inquiry routing - conversion path complete

---

## Phase 5: User Story 2 - Evaluate KnowOps Services (Priority: P2)

**Goal**: Visitors can identify which service tier matches their needs and find engagement CTA

**Independent Test**: Navigate to Services, verify all 4 tiers displayed with descriptions, deliverables, and CTAs

### Implementation for User Story 2

- [ ] T021 [US2] Restructure content/services.md with 4 service tiers (Audit, Architecture, Implementation, Training) per contracts/content-structure.md

**Checkpoint**: Services page complete - visitors can evaluate service offerings

---

## Phase 6: User Story 3 - Explore Technical Frameworks (Priority: P2)

**Goal**: Technical evaluators understand each framework's purpose and KnowOps ecosystem role

**Independent Test**: Navigate to Frameworks, verify grid displays all 3 frameworks with positioning, each framework page has technical detail and related research links

### Implementation for User Story 3

- [ ] T022 [US3] Create content/frameworks/_index.md landing page explaining framework ecosystem per contracts/content-structure.md
- [ ] T023 [P] [US3] Create content/frameworks/prefrontalos.md with positioning "core operating system for KnowOps" and aliases from /projects/prefrontalos/ per data-model.md
- [ ] T024 [P] [US3] Create content/frameworks/cortexgraph.md with positioning "knowledge layer for AI systems" and aliases from /projects/cortexgraph/, /projects/mnemex/ per data-model.md
- [ ] T025 [P] [US3] Create content/frameworks/stopper.md with positioning "cognitive resilience protocol" and aliases from /projects/stopper-protocol/ per data-model.md

**Checkpoint**: Frameworks section complete with all 3 framework pages and redirects from old URLs

---

## Phase 7: User Story 4 - Review Research Credibility (Priority: P3)

**Goal**: Researchers can find publications organized by type with proper citations and DOI links

**Independent Test**: Navigate to Research, verify publications grouped by type (preprint, etc.), DOI links work

### Implementation for User Story 4

- [ ] T026 [US4] Create content/research/_index.md with aliases from /publications/ and brief intro per contracts/content-structure.md
- [ ] T027 [US4] Add any additional publications to data/publications.yaml (if available beyond STOPPER paper)

**Checkpoint**: Research section complete - publications visible with proper citations

---

## Phase 8: User Story 5 - Read Technical Content (Priority: P3)

**Goal**: Visitors can browse journal articles filtered by KnowOps categories

**Independent Test**: Navigate to Journal, verify articles display with categories, filter by category works

### Implementation for User Story 5

- [ ] T028 [US5] Rename content/posts/ to content/journal/
- [ ] T029 [US5] Create content/journal/_index.md with aliases from /posts/ per contracts/content-structure.md
- [ ] T030 [US5] Add categories to all journal articles (Memory architecture, Behavioral safeguards, Cognitive debugging, Knowledge workflows, Applied model welfare, Case studies, Research commentary) - update front matter
- [ ] T031 [US5] Add aliases to all journal articles for old /posts/{slug}/ URLs

**Checkpoint**: Journal section complete - articles browsable and filterable by category

---

## Phase 9: About Page Update

**Goal**: Position Prefrontal Systems as "research studio" specializing in KnowOps

**Independent Test**: Navigate to About, verify "research studio" positioning and KnowOps mission

### Implementation

- [ ] T032 Update content/about.md with research studio positioning, KnowOps mission, and values per contracts/content-structure.md

---

## Phase 10: Polish & Cross-Cutting Concerns

**Purpose**: Final cleanup and validation

- [ ] T033 Remove old content/projects/ directory (after verifying framework aliases work)
- [ ] T034 Remove old content/publications/ directory (after verifying research aliases work)
- [ ] T035 Remove content/posts_backup/ directory if no longer needed
- [ ] T036 Run hugo --gc --minify to verify build completes without errors
- [ ] T037 Verify sitemap.xml is generated in public/ directory and contains all pages
- [ ] T038 Manual test: Verify all old URLs redirect properly (/projects/, /publications/, /posts/)
- [ ] T039 Manual test: Verify all navigation items link to correct pages
- [ ] T040 Manual test: Check meta descriptions in page source (under 160 chars)
- [ ] T041 Manual test: Verify meta keywords in page source include page-type keywords from data/seo-keywords.yaml
- [ ] T042 Manual test: Verify contact form submits with inquiry type
- [ ] T043 Constitutional Alignment: Reliability - Verify redirects work, all pages load, no broken links, sitemap generated
- [ ] T044 Constitutional Alignment: Ethics - Confirm KnowOps messaging promotes ethical AI practices
- [ ] T045 Constitutional Alignment: Rigor - Ensure research section properly cites published work with DOIs
- [ ] T046 Constitutional Alignment: Brand - Verify terminology consistency (KnowOps, not Know-Ops or knowops)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all content pages
- **User Stories (Phase 3-8)**: All depend on Foundational phase completion
  - US1 and US6 can proceed in parallel (both P1)
  - US2 and US3 can proceed in parallel (both P2)
  - US4 and US5 can proceed in parallel (both P3)
- **About Update (Phase 9)**: Independent of user stories
- **Polish (Phase 10)**: Depends on all user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Requires layouts from Phase 2 - Homepage + Cornerstone
- **User Story 6 (P1)**: Requires contact-form shortcode from T016 - Contact page
- **User Story 2 (P2)**: No layout dependency - Services page uses default
- **User Story 3 (P2)**: Requires frameworks layouts from T012, T013 - Frameworks section
- **User Story 4 (P3)**: Requires research layout from T014 - Research section
- **User Story 5 (P3)**: Requires journal layout from T015 - Journal migration

### Parallel Opportunities

**Phase 1 (Setup)**:
- T003, T004, T005, T006, T007, T008, T010, T011 can all run in parallel

**Phase 2 (Foundational)**:
- T013, T014, T015, T017 can run in parallel (different layouts)

**Phase 3-4 (P1 Stories)**:
- US1 (T018-T019) and US6 (T020) can run in parallel

**Phase 5-6 (P2 Stories)**:
- US2 (T021) and US3 (T022-T025) can run in parallel
- Within US3: T023, T024, T025 can run in parallel (different framework pages)

**Phase 7-8 (P3 Stories)**:
- US4 (T026-T027) and US5 (T028-T031) can run in parallel

---

## Parallel Example: User Story 3 (Frameworks)

```bash
# Launch all framework pages together after landing page:
Task: "Create content/frameworks/prefrontalos.md"
Task: "Create content/frameworks/cortexgraph.md"
Task: "Create content/frameworks/stopper.md"
```

---

## Implementation Strategy

### MVP First (P1 Stories Only)

1. Complete Phase 1: Setup (T001-T011)
2. Complete Phase 2: Foundational (T012-T017)
3. Complete Phase 3: User Story 1 - Homepage + Cornerstone (T018-T019)
4. Complete Phase 4: User Story 6 - Contact (T020)
5. **STOP and VALIDATE**: Test homepage KnowOps discovery and contact submission
6. Deploy for initial feedback

### Incremental Delivery

1. **Setup + Foundational** → Configuration and layouts ready
2. **Add P1 Stories (US1 + US6)** → Homepage and Contact work → Deploy MVP
3. **Add P2 Stories (US2 + US3)** → Services and Frameworks → Deploy
4. **Add P3 Stories (US4 + US5)** → Research and Journal → Deploy
5. **Polish** → Cleanup and validation → Final deploy

### Task Count by Story

- Setup: 11 tasks
- Foundational: 6 tasks
- US1 (Discover KnowOps): 2 tasks
- US6 (Contact): 1 task
- US2 (Services): 1 task
- US3 (Frameworks): 4 tasks
- US4 (Research): 2 tasks
- US5 (Journal): 4 tasks
- About: 1 task
- Polish: 14 tasks

**Total: 46 tasks**

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and testable
- Hugo build validation: `hugo --gc --minify`
- Local dev server: `hugo server -D`
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- All migrated content requires aliases for SEO preservation
- Sitemap.xml auto-generated by Hugo on each build
- SEO keywords merged from data/seo-keywords.yaml + page-specific front matter
