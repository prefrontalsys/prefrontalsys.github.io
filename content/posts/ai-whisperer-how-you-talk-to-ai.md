---
title: "The AI Whisperer: How You Talk to AI Gets Things Done"
date: 2025-11-09
draft: false
description: "Why treating AI assistants like your development team-with clear requirements and context-matters more than most people realize"
tags:
  - experience
  - AI
  - prompting
  - context
  - development
  - personal
categories:
  - Experiences
  - AI
---

Here's something I've learned after hundreds of hours working with AI assistants: the difference between "build me a function" and actually getting what you need isn't about which AI you're using. It's about how you talk to them.

I mean really talk to them.

Last week, I watched a colleague get frustrated with Claude because it "kept missing the point" on a database query function. After the third iteration, he threw up his hands. "This thing doesn't get it," he muttered. I asked to see his prompt. It said: "Write a function to query the users table."

That was it. No context about what fields to return, what the query should filter on, how errors should be handled, or even what language we were working in. Just ... build a function.

And you know what? The AI did exactly what he asked. It built a function. Just not the function he needed.

## What We Forget About How AI Actually Works

Here's the thing that keeps tripping people up: we expect AI to know everything because it was trained on everything. The entire internet, millions of repositories of source code, countless examples of functions and patterns and architectures. So naturally, it should just... know what we mean, right?

Except it doesn't work that way.

AI doesn't know what it doesn't know. More fundamentally, it doesn't even know what it does know-not in the way we think about knowing things. What it knows is probability. Given this specific sequence of tokens you've typed, what tokens are most likely to come next? That's it. That's the whole magic trick, repeated billions of times with staggering precision.

When you ask an AI to write code, it's not reaching into some internal knowledge base labeled "Perfect Database Functions." It's looking at the pattern of tokens you've provided and generating the tokens that most commonly appear after patterns like yours. It's finding the shape of your request in the shape of all the code it's seen and trying to match that pattern.

This is why context isn't just helpful-it's everything.

## The Parallel I Didn't Expect to Find

Here's where it gets interesting, and honestly a bit humbling. While working on the STOPPER protocol-our framework for executive function in AI systems-I realized something about how AI approaches the code it writes.

It doesn't really understand what the program does. It can't. It just knows that this particular arrangement of tokens looks like other programs that accomplished similar goals. So how does it figure out if what it wrote actually works?

It writes tests. Lots of tests.

And suddenly I was back in my first programming class, twenty years ago, adding print statements after every function because I had no idea if my code was doing what I thought it was doing. Trial and error. Write something, check if it works, adjust, repeat. That's how a LOT of us learned to code, and that's essentially what AI is doing-just at a scale and speed that makes it look like understanding.

The AI is learning by doing, just like we did. The difference is that it's doing it in microseconds rather than days, and it can hold vastly more context in its working memory than our coffee-addled human brains ever could. But the fundamental process? Eerily similar.

## What I Actually Do (And Always Have)

My prompts follow the same format I use for user stories, just tweaked a bit for AI:

**Acting as a [role]**
**I want you to [task/capability]**
**So that [desired outcome]**

Then I add Acceptance Criteria in Gherkin format:

**Given [context]**
**When [action]**
**Then [testable outcomes]**

Lastly, I add in a definition of done.

That's it. Role, goal, outcome, testable criteria, how to tell it's done. Same structure I've been writing for development teams for years. The only difference is the AI executes in seconds instead of sprints.

I'm not doing "prompt engineering." I'm writing requirements documentation. Problem statement, acceptance criteria, technical constraints, context about the system. Same format I'd use in a Jira ticket.

And it works. First or second try, I usually get working code. Not because I'm good at "prompting," but because I'm providing the external structure the AI needs to focus.

## The AuDHD Pattern

Here's what I think is actually happening: AI lacks the *external scaffolding* to help its executive function work.

Think about it-AI can hold massive amounts of context in working memory. It can switch between tasks instantly. It never gets tired or distracted or needs coffee. But it absolutely needs external frameworks to channel all that capability toward your specific goal.

Just like that AuDHD genius coder who can hyperfocus and produce brilliant work-if you give them clear structure, explicit goals, and relevant constraints. Without that framework? Three rabbit holes deep before you finish explaining the problem.

That's not a deficit. That's how brilliance works when it needs external scaffolding.

The user story format? That's the scaffolding. Role tells the AI what expertise to draw from. Goal defines the task. Outcome specifies what success looks like. Acceptance criteria make it testable. You're not hand-holding-you're providing the executive function framework the AI needs to be brilliant.

## What This Means for How We Work

We're at this interesting inflection point (yes, I really do use this term...frequently. I also use delve. Words mean things) where AI is good enough to be genuinely useful, but not quite good enough to work from minimal context.

Frankly, it's time to stop thinking of AI as the junior developer who has to be told everything. Instead, think of them as that genius coder on your team who happens to be AuDHD. You know the one-if you can get their attention and tell them exactly what needs to be done and why, you'll get brilliant output. But if your brief is vague or you expect them to read between the lines? They're already three rabbit holes deep into something way more interesting.

That's not a limitation. That's just how they work. And honestly? The output is worth learning to communicate on their terms.

The same goes for AI. Give it clear requirements, proper context, and explicit success criteria-and it'll produce excellent work. Try to make it mind-read your intentions, and you'll both end up frustrated.

## Where STOPPER Comes In

Error loops aren't just annoying-you can think of them as AI's signs of distress. The AI is stuck, cycling through failed attempts because it lacks the framework to break out. This is where [STOPPER](https://prefrontal.systems/projects/stopper/) becomes relevant.

[STOPPER](https://prefrontal.systems/projects/stopper/) is an external executive function framework adapted from DBT (Dialectical Behavior Therapy)-a clinical intervention proven effective for 40 years in helping humans manage distress and regulate responses. The same tools that help humans break out of emotional loops help AI systems break out of computational ones.

When an AI hits an error loop, STOPPER provides the scaffolding to recover:

- **S**top the current approach
- **T**ake a step back from the immediate problem
- **O**bserve what's actually happening
- **P**ull back to see the bigger picture
- **P**ractice what works based on previous success
- **E**xpand the search space for solutions
- **R**estart with new insight

It's not magic. It's structured intervention for distress, applied to a different substrate. Same problem, same solution, different implementation.

## The Takeaway

If you're finding yourself in revision loops with AI, frustrated that it "doesn't understand" what you want, pause. You're probably not bad at prompting. You're just asking the AI to work from insufficient scaffolding.

Here's what I learned: I've been a Product Owner for years, always writing User Stories with Acceptance Criteria. When AI showed up, I just gave it the same structured requirements I'd give my dev team. Didn't occur to me to do otherwise. Turns out most people don't-they treat AI like a magic box and wonder why it doesn't read their mind.

The AI doesn't know what you haven't told it. It can't read your mind, your codebase, or your product requirements doc. It just knows tokens and patterns. But give it requirements-role, goal, outcome, acceptance criteria-along with a framework to handle distress and it becomes exactly what you need. Not magic. Not an oracle. Just a really fast, really capable colleague who does better work when you provide clear structure.

And honestly? That's all it needs to be.

*Now if you'll excuse me, I have a prompt to revise. Turns out "this paragraph makes no sense" wasn't quite specific enough.*

---

**Related Posts:**

- [AI Pair Programming: The Context Problem]({{< relref "ai-pair-programming-context-problem.md" >}}) - More on why context matters for AI collaboration
- [Writing User Stories with AI]({{< relref "writing-user-stories-with-ai-1.md" >}}) - Applying structured requirements to AI interactions
- [Improving Acceptance Criteria with AI]({{< relref "improving-acceptance-criteria-ai-agile.md" >}}) - How clear criteria helps both humans and AI
