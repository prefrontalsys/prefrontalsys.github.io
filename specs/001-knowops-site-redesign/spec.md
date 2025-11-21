# Feature Specification: KnowOps Site Redesign

**Feature Branch**: `001-knowops-site-redesign`
**Created**: 2025-11-21
**Status**: Draft
**Input**: User description: "Redesign prefrontal.systems website around KnowOps (Knowledge Operations) positioning - new site architecture, navigation, services, frameworks pages, and SEO optimization"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Discover KnowOps Category (Priority: P1)

A potential client lands on the homepage seeking AI system reliability solutions. They need to quickly understand what KnowOps is and why it matters for their AI deployment challenges.

**Why this priority**: This is the core value proposition - if visitors don't understand KnowOps within seconds, they'll bounce. This story validates the entire category creation strategy.

**Independent Test**: Can be fully tested by loading homepage and confirming a first-time visitor can explain what KnowOps is and why they might need it within 30 seconds of reading.

**Acceptance Scenarios**:

1. **Given** a visitor unfamiliar with KnowOps, **When** they view the homepage hero section, **Then** they see a clear definition of KnowOps and its value proposition for AI systems
2. **Given** a technical decision-maker, **When** they scroll the homepage, **Then** they understand how KnowOps differs from DevOps/MLOps within 2-3 scroll actions
3. **Given** any visitor, **When** they view the homepage, **Then** they see clear navigation to learn more about KnowOps, frameworks, and services

---

### User Story 2 - Evaluate KnowOps Services (Priority: P2)

A potential client who understands KnowOps wants to determine which service offering matches their needs and take the next step toward engagement.

**Why this priority**: Converts understanding into business opportunity. Services page is the primary revenue driver - visitors who reach this page are evaluating whether to hire.

**Independent Test**: Can be fully tested by navigating to Services and confirming a visitor can identify which service tier matches a specific use case and find the CTA to engage.

**Acceptance Scenarios**:

1. **Given** a visitor who understands KnowOps, **When** they navigate to Services, **Then** they see clearly differentiated service tiers (Audit, Architecture, Implementation, Training)
2. **Given** a visitor evaluating an audit, **When** they read the KnowOps Readiness Audit description, **Then** they understand exactly what's evaluated and what deliverables they'll receive
3. **Given** a visitor ready to engage, **When** they complete reading any service description, **Then** they find a clear CTA to start the engagement process

---

### User Story 3 - Explore Technical Frameworks (Priority: P2)

A technical evaluator wants to understand the specific frameworks (PrefrontalOS, CortexGraph, STOPPER) that comprise the KnowOps approach and assess their technical merit.

**Why this priority**: Establishes technical credibility. Technical evaluators need depth to recommend to decision-makers. Frameworks page builds trust with the "how" behind the "what".

**Independent Test**: Can be fully tested by navigating to Frameworks and confirming each framework has sufficient technical depth for an AI/ML engineer to understand its purpose and approach.

**Acceptance Scenarios**:

1. **Given** a technical visitor, **When** they navigate to Frameworks, **Then** they see clear positioning of each framework within the KnowOps ecosystem
2. **Given** an AI engineer evaluating CortexGraph, **When** they read the CortexGraph framework page, **Then** they understand it's the memory/context layer and its key technical approaches
3. **Given** a researcher, **When** they view any framework page, **Then** they find links to related research publications and technical documentation

---

### User Story 4 - Review Research Credibility (Priority: P3)

An academic or technical evaluator wants to review published research to validate the scientific foundation behind KnowOps frameworks.

**Why this priority**: Supports credibility for enterprise and academic audiences. Important for trust-building but not required for initial conversion path.

**Independent Test**: Can be fully tested by navigating to Research and confirming publications are organized by type with proper academic citations (DOI, etc.).

**Acceptance Scenarios**:

1. **Given** an academic researcher, **When** they navigate to Research, **Then** they see publications organized by type (peer-reviewed, preprints, whitepapers, etc.)
2. **Given** any research-interested visitor, **When** they find a publication, **Then** they can access it via DOI link or direct download
3. **Given** a visitor seeking citations, **When** they find a publication, **Then** they see standard citation information

---

### User Story 5 - Read Technical Content (Priority: P3)

A visitor wants to browse technical articles (formerly blog posts) to learn about KnowOps concepts, case studies, and applied techniques.

**Why this priority**: Supports SEO and thought leadership. Journal content attracts organic traffic and demonstrates expertise but isn't required for direct conversion.

**Independent Test**: Can be fully tested by navigating to Journal and confirming articles are categorized and browsable by KnowOps-relevant topics.

**Acceptance Scenarios**:

1. **Given** any visitor, **When** they navigate to Journal, **Then** they see articles organized by KnowOps-relevant categories (Memory architecture, Behavioral safeguards, Cognitive debugging, etc.)
2. **Given** a visitor interested in a specific topic, **When** they filter by category, **Then** they see only articles in that category
3. **Given** any visitor reading an article, **When** they finish reading, **Then** they see related articles and a CTA to engage with services

---

### User Story 6 - Contact for Engagement (Priority: P1)

A visitor ready to engage wants to contact Prefrontal Systems to start a conversation about services.

**Why this priority**: This is the conversion point - all other stories funnel here. Without clear contact paths, no business value is captured.

**Independent Test**: Can be fully tested by navigating to Contact and confirming a visitor can submit an inquiry that reaches the appropriate queue.

**Acceptance Scenarios**:

1. **Given** a visitor ready to engage, **When** they navigate to Contact ("Work With Us"), **Then** they see clear options for different engagement types
2. **Given** a visitor selecting "Start a KnowOps Audit", **When** they complete the form, **Then** their inquiry is routed appropriately
3. **Given** any visitor, **When** they submit a contact form, **Then** they receive confirmation and expectation for response time

---

### Edge Cases

- What happens when a visitor searches for "computational therapeutics" or "model welfare" (old terminology)?
  - They should still find relevant content and be introduced to KnowOps framing
- How does the system handle deep links to old page URLs (e.g., /projects/)?
  - Redirects should preserve SEO value and guide visitors to new structure
- What happens when a visitor wants both services information and technical framework depth?
  - Navigation should allow easy cross-referencing between frameworks and services

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Site MUST display new navigation structure: What is KnowOps? | Frameworks | Services | Research | Journal | About | Contact
- **FR-002**: Homepage MUST include hero section defining KnowOps with clear value proposition
- **FR-003**: Homepage MUST explain differentiation from DevOps/MLOps
- **FR-004**: Homepage MUST display framework overview (PrefrontalOS, CortexGraph, STOPPER)
- **FR-005**: Homepage MUST include primary CTA "Talk to a KnowOps Architect"
- **FR-006**: Site MUST include dedicated "What is KnowOps?" cornerstone page with comprehensive definition
- **FR-007**: Services page MUST display four service tiers: Readiness Audit, Architecture Design, Implementation, Training/Workshops
- **FR-008**: Each service tier MUST include description, scope, and engagement CTA
- **FR-009**: Frameworks section MUST present each framework with clear KnowOps ecosystem positioning
- **FR-010**: PrefrontalOS page MUST position as "core operating system for KnowOps"
- **FR-011**: CortexGraph page MUST position as "knowledge layer for AI systems"
- **FR-012**: STOPPER page MUST position as "cognitive resilience protocol for AI agents"
- **FR-013**: Research section MUST organize publications by type (peer-reviewed, preprints, whitepapers, etc.)
- **FR-014**: Journal section MUST categorize articles by KnowOps topics (Memory architecture, Behavioral safeguards, Cognitive debugging, etc.)
- **FR-015**: About page MUST position Prefrontal Systems as a "research studio" specializing in KnowOps
- **FR-016**: Contact page MUST offer engagement-specific options (Audit, Framework Review, Discovery Call, General)
- **FR-017**: Site MUST implement redirects from old URLs to new structure
- **FR-018**: Site MUST include appropriate meta tags and structured data for KnowOps-related SEO keywords
- **FR-019**: Site MUST generate sitemap.xml automatically on each build using Hugo's built-in sitemap template
- **FR-020**: Each page type MUST have pre-defined SEO keyword sets with optional page-specific additions in front matter

### Key Entities

- **Page**: Content unit with title, content, meta tags, and navigation placement
- **Framework**: Technical system (PrefrontalOS, CortexGraph, STOPPER) with name, positioning, description, and related research
- **Service Tier**: Offering (Audit, Architecture, Implementation, Training) with scope, deliverables, and engagement CTA
- **Publication**: Research output with title, type, DOI/link, citation info, and related frameworks
- **Journal Article**: Blog content with title, content, category, related articles, and engagement CTAs
- **Contact Inquiry**: Form submission with inquiry type, contact info, and routing designation

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Visitors can explain what KnowOps is after viewing homepage for under 30 seconds
- **SC-002**: Navigation allows reaching any primary section within 2 clicks from homepage
- **SC-003**: Services page clearly presents all 4 service tiers with engagement paths
- **SC-004**: Each framework page loads and displays complete positioning and technical overview
- **SC-005**: Research section displays all publications organized by type with working access links
- **SC-006**: Journal articles are filterable by at least 4 KnowOps-relevant categories
- **SC-007**: Contact form submissions route to appropriate queue based on inquiry type
- **SC-008**: Old URLs (e.g., /projects/, /publications/) redirect to new equivalents with HTTP 301
- **SC-009**: Site targets SEO keywords: "knowledge operations", "KnowOps", "AI cognitive architecture", "AI memory systems", "executive function for LLMs"
- **SC-010**: All primary pages include appropriate meta descriptions and Open Graph tags
- **SC-011**: Sitemap.xml is generated automatically on each Hugo build and includes all public pages
- **SC-012**: Each page type has consistent SEO keywords from pre-defined sets (homepage, frameworks, services, research, journal, about, contact)

## Assumptions

- **Hugo remains the static site generator** - redesign works within existing Hugo + hugo-coder theme architecture
- **Existing content migrates** - current blog posts, project pages, and publications content will be restructured, not rewritten
- **w3forms continues for contact** - existing contact form infrastructure will be extended for inquiry routing
- **Single language** - English only, no internationalization required
- **No CMS changes** - content continues to be managed via markdown files and git workflow
- **Atkinson Hyperlegible font continues** - brand typography remains consistent
- **GitHub Pages deployment** - hosting and deployment pipeline remain unchanged

## Scope Boundaries

### In Scope

- New navigation structure and information architecture
- Homepage redesign with KnowOps positioning
- New "What is KnowOps?" cornerstone page
- Services page restructure with 4 tiers
- Frameworks section (replaces Projects)
- Research section (replaces Publications)
- Journal section (replaces Blog)
- About page update ("research studio" positioning)
- Contact page update with inquiry routing
- URL redirects from old to new structure
- SEO meta tags and structured data
- Existing content migration to new structure

### Out of Scope

- New written content creation beyond structural copy
- Visual/brand identity changes (colors, fonts, logos)
- Theme replacement or major CSS overhaul
- Backend services or dynamic functionality
- User accounts or authentication
- E-commerce or payment processing
- Multi-language support
- CMS implementation
- Analytics beyond what's currently implemented

## Dependencies

- Access to current Hugo site codebase and content
- Understanding of hugo-coder theme customization
- Current site analytics to preserve tracking
- Access to w3forms account for form routing configuration
- Brand.md guidelines for consistent messaging

## Clarifications

### Session 2025-11-21

- Q: How should the sitemap.xml be generated and updated? → A: Hugo built-in sitemap template (auto-generates on build)
- Q: Should each page type have pre-defined keyword sets, or should keywords be manually specified per page? → A: Pre-defined sets by page type + optional page-specific additions
