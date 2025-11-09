# User Story and Acceptance Criteria Guide

This document provides a template and guidelines for writing effective user stories, including Gherkin-style acceptance criteria and a Definition of Done (DoD). This serves as a standard for anyone, whether human or AI agent, tasked with creating user stories for our projects.

## The User Story

A user story is a concise, informal description of a feature told from the perspective of the person who desires the new capability—usually a user or customer of the system. The goal is to articulate the "who," "what," and "why" of a feature in a simple, understandable way.

### Format

A user story follows a simple template:

**As a** < type of user >, **I want** < to perform some action > **so that** < I can achieve some goal >.

*   **As a...** - This describes the persona or user role. It answers the question, "Who are we building this for?"
*   **I want...** - This describes the action the user wants to perform. It answers the question, "What do they want to do?"
*   **So that...** - This describes the user's motivation or the value they will gain. It answers the question, "Why do they want to do this?"

### Example

> **As a** registered user,
> **I want** to log in to my account,
> **so that** I can access my personalized dashboard.

### The INVEST Model for Good User Stories

To ensure stories are well-formed and ready for development, they should adhere to the INVEST model:

*   **Independent**: Stories should be self-contained and not dependent on other stories.
*   **Negotiable**: Stories are not contracts. They are conversation starters that can be refined.
*   **Valuable**: Each story must deliver tangible value to the end-user or customer.
*   **Estimable**: The development team must be able to estimate the effort required to complete the story.
*   **Small**: Stories should be small enough to be completed within a single sprint or iteration.
*   **Testable**: The story must be verifiable. If you can't test it, you don't know if it's done.

---

## Acceptance Criteria (AC) with Gherkin

Acceptance Criteria are the conditions that a software product must meet to be accepted by a user, customer, or stakeholder. They define the "done" for a story from a functional perspective. We use the Gherkin syntax to write clear, behavior-driven AC.

### Gherkin `Given-When-Then` Syntax

Gherkin is a business-readable, domain-specific language that lets you describe software’s behavior without detailing how that behavior is implemented.

*   `Feature`: A high-level description of the feature covered by the scenarios.
*   `Scenario`: A concrete example illustrating a business rule.
*   `Given`: Describes the initial state or context before the user acts.
*   `When`: Describes the action performed by the user.
*   `Then`: Describes the expected outcome or result of the action.
*   `And`, `But`: Used to chain together multiple `Given`, `When`, or `Then` steps.

### Example Acceptance Criteria

**Feature**: User Authentication

**Scenario**: Successful login with valid credentials
> **Given** I am on the login page
> **And** I have entered my correct username and password
> **When** I click the "Login" button
> **Then** I should be redirected to my dashboard
> **And** I should see a "Welcome back!" message.

**Scenario**: Failed login with invalid credentials
> **Given** I am on the login page
> **And** I have entered an incorrect username or password
> **When** I click the "Login" button
> **Then** I should see an error message stating "Invalid credentials"
> **And** I should remain on the login page.

---

## Definition of Done (DoD)

The Definition of Done is a comprehensive checklist of all the activities required to produce a completed, high-quality piece of functionality. It is a shared understanding within the team about what it means for work to be complete.

### Example Definition of Done

A user story is "Done" when all of the following are true:

*   [ ] All acceptance criteria are met.
*   [ ] Code is written, and it adheres to our coding standards.
*   [ ] The code has been peer-reviewed and approved.
*   [ ] Unit tests are written and are passing with sufficient code coverage.
*   [ ] Integration tests are written and are passing.
*   [ ] The feature has been successfully deployed to a staging/testing environment.
*   [ ] The Product Owner has reviewed and accepted the feature.
*   [ ] Any necessary documentation (technical or user-facing) has been updated.
*   [ ] All non-functional requirements (e.g., performance, security, accessibility) are met.
*   [ ] The build is green, and the application is stable.
