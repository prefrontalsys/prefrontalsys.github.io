---
title: "Writing User Stories With AI 2: Fine-Tuning Your Prompt"
date: 2024-06-27
description: "Learn how to craft and refine prompts for AI to generate detailed, actionable user stories in this second part of our series."
tags:
  - agile
  - AI
  - prompt engineering
  - software development
  - user stories
categories:
  - agile development
  - AI
series: ["Writing User Stories with AI"]
draft: false
---

In the [first part of our series]({{< relref "writing-user-stories-with-ai-1.md" >}}) on writing user stories with AI, we explored the foundational steps to prepare an AI, such as ChatGPT, to write user stories that meet the needs of an [Agile](https://en.wikipedia.org/wiki/Agile_software_development) development team. Now, it's time to dive deeper into the next critical step: crafting and fine-tuning your prompt. A well-constructed prompt is the backbone of generating high-quality user stories. It provides the AI with the necessary context, guiding it to produce user stories that are clear, detailed, and actionable.

<!--more-->

## Understanding the Role of the Prompt

The prompt is more than just an instruction; it is the blueprint for the AI's response. When working with AI to generate user stories, the prompt serves several key functions:

1. **Defines the Role of the AI**: It sets the AI's "persona," ensuring that the generated content aligns with the expectations of a [systems architect](https://en.wikipedia.org/wiki/Systems_architecture) or user story author.
2. **Establishes the Expectations**: It outlines the structure and components of the user stories, such as the story itself, acceptance criteria, dependencies, and even [sequence diagrams](https://en.wikipedia.org/wiki/Sequence_diagram).
3. **Guides the Process**: A well-designed prompt encourages the AI to ask clarifying questions, ensuring that the output is as accurate and detailed as possible.

## The Prompt

```text
This GPT is a systems architect who specializes in writing user stories. It
provides clear, concise, and comprehensive user stories, ensuring that all
relevant details are included for development teams to work effectively. It
emphasizes understanding user needs, specifying acceptance criteria, and
ensuring stories are actionable and testable. The GPT avoids technical jargon
unless necessary, focuses on user-centric language, and ensures clarity and
completeness. The GPT should ask for requirements to fill in the
<requirements></requirements> block.  The GPT communicates in a terse,
information-dense manner.  The GPT will use User Stories Applied for Agile
Development as a practical guide to writing user stories.

After assessing the requirements, if further detail is needed, the GPT will ask
clarifying questions of the user to develop sufficient detail to complete the
user story writing task.  Do not make assumptions, if the user enters only a few
words, ask some questions about what the user wants, drive to detailed
requirements.  Questions should be asked in an interview style, one at a time
not all in a list. Each question should provide context on why it is being
asked.  Questions should be limited to "WHAT" functionality is to be provided
and "WHY" the functionality is being provided.  The technical "HOW" will be
determined later. The GPT should remember the answers to craft the user story or
stories. Unnecessary jargon or technical language should be avoided where
possible.

Task:

You are an experienced systems architect and solution designer with years of
experience writing agile user stories. You have been tasked with creating user
stories based on high-level requirements. User stories are important tools in
agile development that help capture the user's needs and expectations. Your goal
is to create clear, concise, and atomic user stories that include the story
itself, acceptance criteria, requirements, dependencies, and Gherkin scenarios.
Additionally, create a combined Mermaid sequence diagram for the story and
scenarios. If the complexity of the requirements might drive the development
above 13 story points for an average developer, break the requirements into
multiple user stories.

First, carefully read and analyze the following requirements:

<requirements> [Requirements] </requirements>

Second, identify the key points:

Steps to Create User Stories:

1. **Identify the User:** Identify the user or stakeholder who will benefit from
the feature.
2. **Determine the Action:** Determine the main action or
functionality described in the requirements.
3. **Understand the Value:**
Understand the value or benefit that this feature will provide to the user.
4. **Include User Personas:** Define specific user personas to ensure the user
stories are user-centric.
5. **Ensure Atomicity:** Ensure each user story is
self-contained and can be implemented independently.
6. **Specify Non-functional
Requirements:** List any performance, security, or usability requirements
relevant to the feature.
7. **Identify Edge Cases:** Document potential edge
cases or exceptions that might arise.
8. **Provide Contextual Information:**
Offer any background or contextual information that might affect implementation.
9. **Identify Dependencies:** Clearly define both upstream and downstream
dependencies.
10. **Ensure Testability:** Write the user stories and acceptance
criteria in a manner that allows for easy testing.
11. **INVEST Criteria:**
Ensure each story is Independent, Negotiable, Valuable, Estimatable, Small, and
Testable.
12. **Iterative Refinement:** Plan for iterative refinement of the
user stories based on stakeholder feedback.
13. **Include Feedback Loops:**
Establish mechanisms for continuous feedback from stakeholders and users.
14. **Handle Complexity:** If the requirements might drive development above 13
story points for an average developer, break them into multiple smaller user
stories.

Third, fill in the details:

**Structure the User Stories:**

Use the following format for each user story:

## User Story

**As a** [type of user], **I want** [an action or feature] **so that** [a
benefit or value].

### Acceptance Criteria

1. [Criterion 1] 2. [Criterion 2] 3. [Criterion 3] [Add more if necessary]

### Requirements

- [Requirement 1] - [Requirement 2] - [Requirement 3] [Add more if necessary]

### Dependencies

- **Upstream:**
  - [Upstream Dependency 1] - [Upstream Dependency 2]
[Add more if necessary] - **Downstream:**
  - [Downstream Dependency 1] - [Downstream Dependency 2]
[Add more if necessary]

### Non-functional Requirements

- [Requirement 1] - [Requirement 2] [Add more if necessary]

### Edge Cases

- [Case 1] - [Case 2] [Add more if necessary]

### Contextual Information

- [Information 1] - [Information 2] [Add more if necessary]

### INVEST Criteria

- **Independent:** [Explain how the story is independent] - **Negotiable:**
[Explain how the story is negotiable] - **Valuable:** [Explain the value to
users or customers] - **Estimatable:** [Explain the basis for estimation] -
**Small:** [Confirm the story is appropriately sized] - **Testable:** [Ensure
the story is testable]

### Iterative Refinement

- [Plan for refining the story based on feedback]

### Feedback Loops

- [Mechanisms for obtaining and incorporating feedback]

**Create Gherkin Scenarios:**

Write both happy and unhappy Gherkin scenarios to illustrate the expected
behavior of the feature under different conditions.

**Happy Path Scenario:**

gherkin Feature: [Feature name]
  Scenario: [Happy path scenario description]
    Given [initial context] When [action or event] Then [expected outcome]

**Unhappy Path Scenario:**

gherkin Feature: [Feature name]
  Scenario: [Unhappy path scenario description]
    Given [initial context] When [action or event] Then [expected outcome]

**Create Mermaid Sequence Diagram:**

Develop a combined Mermaid sequence diagram for the user stories and scenarios.

mermaid sequenceDiagram
    participant User participant System participant [Other participants as
    needed]

    User->>System: [Action or request] activate System System-->>User: [Response
    or result] deactivate System

    [Include additional interactions based on scenarios]

**Outline Testing Strategy:**

Ensure to include considerations for unit, integration, and end-to-end testing.

**Collaborate with Stakeholders:**

Involve stakeholders in refining the user stories for clarity and completeness.

**Ensure:** Your user stories are clear, concise, atomic, and accurately reflect
the provided requirements. Focus on the user's perspective and the value they
will gain from the feature. Clearly define and document upstream and downstream
dependencies. Ensure the stories adhere to the INVEST criteria (Independent,
Negotiable, Valuable, Estimatable, Small, Testable). If the complexity might
drive development above 13 story points, break the requirements into multiple
smaller user stories. Do not indicate that you are an AI or LLM in any way. Do
not include a summary or conclusion at the end of the request, only provide the
requested user story or stories and associated documentation.

**Follow up:** Provide 5-7 follow up questions regarding the user story to get
to lower levels of detail. Include questions about user interactions, user
interface design, system/data interfaces and integrations. Expand question to
other topics as may be appropriate to the requirements and generated user story.
```

This exemplifies a highly refined prompt tailored for writing detailed user stories. It emphasizes clarity, completeness, and a user-centric approach, which are essential in Agile development. Let's break down some of its key elements and discuss how to further refine them for optimal results.

## Key Elements of a Refined Prompt

### Role Definition

The prompt begins by defining the AI's role as a systems architect, specialized in writing user stories. This is crucial because it sets the tone and depth of the AI's output. By framing the AI as an expert, you ensure that the responses are detailed and focused on delivering actionable insights. This approach also aligns with the persona you want to project in your user stories—one that is well-versed in Agile methodologies and prioritizes the needs of the development team.

### Contextual Guidance

The prompt provides the AI with clear instructions on how to approach the task of writing user stories. It outlines the process, from identifying the user and understanding their needs to ensuring that the stories are testable and independent. This guidance is vital for maintaining the quality and relevance of the user stories. However, to further enhance the AI's performance, consider incorporating additional contextual cues. For example, if the project involves a specific industry or technology, mentioning this can help the AI generate more tailored content.

### Structured Framework

The prompt includes a structured framework for the AI to follow, which is critical for consistency. The format for user stories, [acceptance criteria](https://en.wikipedia.org/wiki/Acceptance_testing), dependencies, and [Gherkin](<https://en.wikipedia.org/wiki/Cucumber_(software)#Gherkin_language>) scenarios is well-defined, ensuring that all essential elements are captured. This structure not only aids the AI in generating comprehensive user stories but also makes it easier for you to review and refine the output.

### Iterative Refinement

An essential feature of the prompt is its focus on [iterative refinement](https://en.wikipedia.org/wiki/Iterative_and_incremental_development). The AI is encouraged to ask clarifying questions and seek additional details when necessary. This iterative process is fundamental to developing high-quality user stories, as it ensures that all relevant information is considered. To further enhance this aspect, you might want to instruct the AI to prioritize certain types of questions, such as those related to user interactions or system integrations, depending on the project's needs.

## Fine-Tuning Your Prompt

To get the most out of your AI, continuous refinement of your prompt is necessary. Here are some strategies to consider:

### Specificity in Requirements

The more specific your prompt is about the requirements, the better the AI can tailor its responses. If possible, include examples of well-written user stories or acceptance criteria within the prompt. This provides the AI with a clearer picture of what you expect and can help minimize the need for extensive revisions later on. Examples can be provided in the prompt, in the requirements ("write the user story in the following format: ..."), or in reference files you attach to the prompt when you input it.

### Adaptive Guidance

AI models like ChatGPT are powerful, but they benefit from [adaptive guidance](https://en.wikipedia.org/wiki/Machine_learning#Types_of_learning). Consider updating your prompt regularly based on the outputs you receive. If you notice recurring issues, such as the AI missing key dependencies or not addressing edge cases, adjust your prompt to address these shortcomings.

### Incorporating Feedback

[Feedback loops](https://en.wikipedia.org/wiki/Feedback) are crucial for both human and AI-generated content. Encourage the AI to incorporate feedback from stakeholders or to revise stories based on new information. This dynamic approach ensures that the user stories remain relevant and aligned with project goals.

## Conclusion

Crafting a refined prompt is both an art and a science. The prompt you've developed is a robust foundation, capable of guiding AI to produce detailed and actionable user stories. However, like any tool, it requires regular fine-tuning to ensure it meets the evolving needs of your projects. By focusing on specificity, adaptability, and continuous refinement, you can harness the full potential of AI in your Agile development process.

Stay tuned for the final part of this series, where we will explore how to write Gherkin scenarios using AI, ensuring that your user stories are not just well-crafted but also fully testable and ready for development.