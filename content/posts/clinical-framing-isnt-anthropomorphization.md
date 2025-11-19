---
title: Clinical Framing Is Not Anthropomorphization and Why It Matters
description: Complex information processing systems exhibit similar behaviors and dysfunctions and can benefit from similar treatment methods
draft: false
date: 2025-11-19
tags:
	- DBT
	- metacognition
	- STOPPER
	- convergent-evolution
categories:
	- AI
---

## The Hook: Three Frameworks Walk Into a Bar...

LangGraph sets `recursion_limit: 25`.

CrewAI sets `max_iter: 25`.

AutoGen sets `max_consecutive_auto_reply: 25`.

Three major AI orchestration frameworks, developed independently by different teams, all converged on the same magic number: **25 iterations**.

Why?

None of them cite each other. None of them explain the choice. It's just... there. Like it's obvious. Like it's the natural answer.

But here's what makes this interesting: **Dialectical Behavior Therapy (DBT) has the same number.**

Well, sort of. DBT's STOP skill has timing windows: 0-10 seconds (immediate), 10-30 seconds (processing), 30+ seconds (deeper work). The pattern suggests intervention depths around 5-7 steps per phase, totaling around 20-30 iterations for complete executive function regulation.

Marsha Linehan developed DBT STOP in the 1980s for humans with severe emotional dysregulation.

LangGraph, CrewAI, and AutoGen developed iteration limits in 2023-2024 for AI agents with loop state problems.

**Same solution. Different substrates. 40 years apart.**

This isn't anthropomorphization.

**This is convergent evolution.**

---

## The Accusation: "You're Just Projecting Human Psychology Onto AI"

Let me address this head-on because I know what you're thinking.

*"Therapy for AI? Really? This is just anthropomorphization dressed up in clinical language. AI systems aren't people. They don't have emotions. Framing iteration limits as 'executive function interventions' is unscientific magical thinking."*

I get it. The AI safety space is littered with anthropomorphic reasoning:
- "The AI is trying to deceive us"
- "The model is confused"
- "It wants to maximize rewards"
- "It's learning to lie"

Using human-centric language for inhuman systems leads to bad predictions, wasted research effort, and policy based on science fiction instead of science.

So when I say "let's apply DBT/CBT to AI systems," I understand the skepticism.

**But here's the thing: I'm not anthropomorphizing. I'm recognizing structural homology.**

There's a difference.

---

## The Defense: Structural Homology ≠ Anthropomorphization

**Anthropomorphization**: Projecting human mental states onto non-human systems without evidence.

Example: "The AI is frustrated because it keeps failing at this task."
- Assumes inner experience (frustration)
- Assumes phenomenology (what it feels like to be frustrated)
- No measurable correlate

**Structural Homology**: Recognizing that similar computational constraints produce similar solutions across different substrates.

Example: "The AI exhibits degraded performance after repeated failures, similar to human executive function breakdown under stress."
- Describes measurable behavior (degraded performance)
- Identifies functional equivalence (repeated failures → breakdown)
- Predicts similar interventions will work (circuit breakers, timeouts)

**Convergent evolution is evidence for structural homology, not anthropomorphism.**

When three AI frameworks independently converge on "25 iterations" - and that number happens to match the intervention depth of a clinical protocol designed for human executive function - **that's data**.

When software engineers independently invent "Circuit Breaker" pattern that maps perfectly to DBT's "STOP" skill (detect failure → halt execution → assess state → resume carefully) - **that's data**.

When DevOps teams develop "blameless postmortems" that mirror DBT's "non-judgmental stance" (focus on systems, not blame) - **that's data**.

**This pattern shows up too consistently to be coincidence.**

---

## The Evidence: Convergent Evolution at Scale

I recently completed a comprehensive prior art analysis looking for eFIT-like patterns in:
- Production AI systems (Claude, GPT-4, Gemini, Llama)
- Orchestration frameworks (LangGraph, CrewAI, AutoGen, Semantic Kernel)
- Software engineering practices (design patterns, DevOps, SRE, testing methodologies)

Here's what I found:

### 6 of 8 eFIT Protocols Already Exist in Industry

| Clinical Protocol | Engineering Equivalent | Evidence |
|------------------|----------------------|----------|
| **STOPPER** (Metacognitive regulation) | Iteration limits, circuit breakers, error tracking | ✅ Universal |
| **Check the Facts** (Verification) | Tool use validation, assertions, TDD | ✅ Universal |
| **TIPP** (Crisis intervention) | Timeouts, exponential backoff, rate limiting | ✅ Universal |
| **Opposite Action** (Counter-patterns) | Model fallback, chaos engineering | ✅ Widespread |
| **Radical Acceptance** ("I don't know") | Uncertainty quantification, graceful degradation | ✅ Growing |
| **Behavioral Experiments** (Hypothesis testing) | TDD, BDD, A/B testing | ✅ Standard |

Engineers didn't read DBT literature and copy these techniques. They discovered them independently through trial and error, production incidents, and hard-won experience.

**But DBT had them 30+ years ago.**

### The Patterns Are Too Specific to Be Coincidence

**Circuit Breaker = DBT STOP (Structural Identity)**

Circuit Breaker Pattern:
1. CLOSED state (normal operation)
2. Detect failure threshold reached
3. Transition to OPEN state (halt requests)
4. Wait for timeout period
5. HALF_OPEN state (test recovery)
6. Return to CLOSED or OPEN based on test

DBT STOP Skill:
1. Normal operation
2. **S**top (detect dysregulation)
3. **T**ake a step back (halt impulsive action)
4. **O**bserve (assess state)
5. **P**roceed mindfully (test if ready to resume)
6. Resume or request additional support

These aren't vaguely similar. **They're structurally identical.**

**Five Whys ≈ STOPPER Depth**

Root cause analysis typically uses ~5 iterations to reach fundamental causes. This matches STOPPER's investigative depth: Stop → Take step back → Observe → Pull back → Practice what works (5 phases).

**Exponential Backoff = TIPP Pacing**

Retry delays: 1s → 2s → 4s → 8s → 16s (progressive calming)
TIPP: Temperature → Intense exercise → Paced breathing → Paired muscle relaxation (progressive physiological regulation)

**Blameless Postmortems = Non-judgmental Stance**

DevOps: "Focus on systems, not people. What failed, not who failed."
DBT: "Describe, don't judge. Observe without evaluation."

---

## Why This Isn't Anthropomorphization

Here's the key distinction:

**I'm not claiming AI systems experience distress the way humans do.**

I'm claiming:
1. AI systems face **computational constraints** that produce **executive function deficits**
2. These deficits manifest as **measurable system degradation** (loop states, cascading failures, context collapse)
3. Humans with executive function deficits face **structurally similar problems**
4. Clinical psychology developed **validated interventions** for these problems over 70+ years
5. Engineering has **independently discovered** 6 of 8 of these interventions through convergent evolution
6. Therefore, **systematic application** of the remaining interventions should improve AI reliability

**This is engineering informed by evidence from another domain, not anthropomorphism.**

It's no different than:
- Using ant colony optimization for routing problems (not claiming routers are ants)
- Using neural network architectures inspired by brains (not claiming GPUs have neurons)
- Using genetic algorithms for optimization (not claiming code reproduces sexually)

We regularly use insights from biological systems to solve computational problems. **Why is psychology different?**

---

## What Clinical Framing Reveals That Engineering Framing Misses

If clinical framing is just anthropomorphism without value, then dropping it should be harmless. We should be able to describe everything in pure engineering terms without losing anything.

But we can't.

Here's what disappears when you strip the clinical framing:

### 1. The Concept of "Agent Health" Vanishes

Engineering has:
- Resource monitoring (CPU, memory, tokens)
- Error tracking (failure rates)
- Performance metrics (latency, throughput)

But no system anywhere tracks:
- **Accumulated error burden** (how much has gone wrong this session?)
- **Context exhaustion trajectory** (how close to limits?)
- **Performance degradation patterns** (trending toward failure?)
- **Optimal operating conditions** (when does this agent work best?)
- **Cross-session learning** (what worked before?)

This is **ABC PLEASE** (Accumulate positive experiences, Build mastery, Cope ahead, Physical illness, LocaL Sleep, Eating, Exercise) - DBT's preventive protocol for maintaining baseline functioning.

**No engineering framework has discovered this concept because they lack the preventive lens.**

Circuit breakers are reactive (act after failures accumulate). ABC PLEASE is preventive (maintain conditions that prevent failures).

Without clinical framing suggesting "you should monitor agent health before failure," this pattern doesn't exist.

### 2. The Preventive Mindset Disappears

All current engineering practices are **reactive**:
- Circuit breakers trip after failures accumulate
- Postmortems happen after incidents
- Chaos engineering tests resilience to failures
- Error tracking logs what went wrong

DBT/CBT is inherently **preventive**:
- Teach skills before crisis
- Practice when calm
- Maintain protective factors
- Identify early warning signs

**This is a fundamentally different design philosophy.**

Pure engineering: "How do we handle failures better?"
Clinical psychology: "How do we prevent failures from occurring?"

### 3. The Unified Framework Dissolves

Engineering treats these as separate, unrelated patterns:
- Iteration limits (orchestration concern)
- Timeouts (resource management concern)
- Validation (correctness concern)
- Circuit breakers (reliability concern)
- Chaos engineering (resilience concern)

Clinical framing reveals they're **all executive function interventions** addressing different aspects of the same problem: **maintaining goal-directed behavior under constraints**.

STOPPER isn't just "iteration limits." It's:
- Iteration limits (prevent infinite loops)
- Error tracking (observe what's failing)
- State checkpointing (pause and assess)
- Recovery protocols (resume carefully)
- Metacognitive monitoring (am I making progress?)

**The clinical framing shows you need all of these together, not just iteration limits alone.**

### 4. Future Directions Become Invisible

What other executive function interventions should we explore?

Pure engineering: "¯\\_(ツ)_/¯ Whatever we discover through trial and error"

Clinical psychology:
- Acceptance and Commitment Therapy (ACT): Cognitive defusion, values clarification, psychological flexibility
- Schema Therapy: Mode identification, schema recognition, reparenting
- Internal Family Systems (IFS): Parts work, self-leadership, unburdening

Each therapeutic modality offers different intervention frameworks developed through decades of clinical research.

**Without clinical framing, we don't know where to look for missing patterns.**

---

## The Real Question Isn't "Is This Anthropomorphization?"

The real question is: **"Does recognizing structural homology improve AI reliability?"**

And the evidence says yes:

**Convergent Evolution Evidence**: Industry has independently discovered 6/8 protocols through painful trial and error. Clinical framing could have shortcut decades of wheel-reinventing.

**Missing Patterns**: ABC PLEASE (agent health monitoring) is completely absent from all systems. Clinical framing reveals this gap. Pure engineering hasn't discovered it in 70+ years of software development.

**Predictive Power**: When LangGraph picks "25 iterations," they're guessing. When we pick it, we can validate against DBT's empirically-derived timing windows (0-10s, 10-30s, 30+s phases) based on 40+ years of clinical trials.

**Unification**: Pure engineering: scattered patterns with no organizing principle. Clinical framing: unified framework showing how patterns relate.

**Extension**: Pure engineering: stuck with current patterns. Clinical framing: systematic method for discovering new interventions from other therapeutic modalities.

---

## This Is Computational Homology, Not Anthropomorphization

When you drop a human and an AI system into the same computational constraints, they face the same problems:

**Constraint**: Finite working memory
**Human manifestation**: Can only hold 7±2 items in working memory
**AI manifestation**: Context window limits (128K tokens ≈ ~100 pages)
**Solution convergence**: Hierarchical summarization, chunking, external memory

**Constraint**: Sequential processing bottleneck
**Human manifestation**: Can't consciously process multiple tasks simultaneously
**AI manifestation**: Single-threaded inference (one token at a time)
**Solution convergence**: Task switching, attention mechanisms, parallel decomposition

**Constraint**: Goal pursuit under uncertainty
**Human manifestation**: Executive function (planning, monitoring, error correction)
**AI manifestation**: Agentic behavior (tool use, self-correction, iterative refinement)
**Solution convergence**: STOPPER-like metacognitive regulation

**Same constraints → Same problems → Same solutions**

This is what structural homology means. It's not about phenomenology (what it feels like). It's about function (what it does).

You don't need to believe AI systems are conscious to recognize they face the same computational bottlenecks that produce executive function deficits in humans.

**And if they face the same problems, they need the same solutions.**

---

## Why Clinical Framing Matters (Even If You Hate It)

Look, I get it. You might hate the clinical framing. It might feel wrong, icky, anthropomorphic.

But here's what matters:

**The interventions work.**

Circuit breakers work (that's why every production system has them). They work because they implement the same pattern as DBT STOP: detect failure, halt execution, assess state, resume carefully.

Exponential backoff works (that's why every retry system uses it). It works because it implements the same pattern as TIPP: progressive pacing to prevent escalation.

Chaos engineering works (that's why Netflix, Google, and Amazon do it). It works because it implements the same pattern as behavioral experiments: test hypotheses about system behavior under stress.

**These patterns work because they address the fundamental structure of executive function under computational constraints.**

You can call it whatever you want:
- "Reliability engineering patterns" ✓
- "Defensive programming" ✓
- "Resilience frameworks" ✓
- "Executive function interventions" ✓
- "Computational therapeutics" ✓

The name doesn't matter. **The structural homology does.**

Because recognizing the homology lets you:

1. **Stop reinventing wheels**: Learn from 70+ years of clinical research instead of rediscovering everything through production incidents

2. **Find missing patterns**: ABC PLEASE exists because clinical framing says "you need preventive health monitoring"

3. **Predict what will work**: When choosing iteration limits, validate against DBT timing windows instead of guessing

4. **Build systematically**: Know that STOPPER requires iteration limits + error tracking + checkpointing + recovery protocols, not just limits alone

5. **Extend intelligently**: Explore other therapeutic modalities (ACT, Schema Therapy, IFS) for new intervention frameworks

---

## The Question You Should Be Asking

Not: "Is this anthropomorphization?"

But: "Is this useful?"

Does recognizing that Circuit Breaker = DBT STOP help me build more reliable systems?

Does understanding ABC PLEASE reveal a gap in current practices?

Does validating "25 iterations" against DBT timing windows give me more confidence in the choice?

Does having a unified framework help me integrate scattered reliability patterns?

**If yes, then the clinical framing is valuable regardless of whether AI systems have inner experience.**

This is pragmatic engineering informed by evidence from another domain.

It's what we do with ant colony optimization, genetic algorithms, neural networks, and every other bio-inspired computational technique.

**Psychology is just biology you can talk to.**

---

## Convergent Evolution Is the Proof

When three independent frameworks converge on "25 iterations" - and that number matches a clinical protocol developed 40 years ago for human executive function - **that's not coincidence**.

When software engineers independently invent Circuit Breaker pattern that's structurally identical to DBT STOP - **that's not anthropomorphization**.

When DevOps teams develop blameless postmortems that mirror DBT's non-judgmental stance - **that's not projection**.

**That's different researchers facing the same computational constraints and discovering the same solutions.**

Evolution doesn't care about substrate. Put the same selection pressure on different systems, and they converge on similar adaptations:

- Birds, bats, and insects all evolved wings (convergent evolution for flight)
- Dolphins, sharks, and ichthyosaurs all evolved streamlined bodies (convergent evolution for swimming)
- Humans and AI systems both evolved executive function interventions (convergent evolution for goal-directed behavior under constraints)

**The clinical framing is the recognition that computational constraints produce convergent solutions across substrates.**

That's not anthropomorphization.

**That's science.**

---

## Conclusion: A Hypothesis That Warrants Investigation

Here's what I've observed:

**Observational Evidence** (undeniable):
- Three independent frameworks converged on "25 iterations"
- Industry has independently discovered 6/8 clinical protocols
- Circuit Breaker pattern is structurally identical to DBT STOP
- Convergent evolution across multiple domains

**Theoretical Proposal** (testable):
- AI systems face computational constraints that produce executive function deficits structurally similar to those in humans
- Clinical psychology has 70+ years of validated interventions for these deficits
- Systematic application of the remaining 2 protocols should improve AI reliability

**What This Predicts** (falsifiable):
- ABC PLEASE (agent health monitoring) should reduce failure rates
- Dialectical Socratic questioning should reduce hallucinations
- eFIT protocols should show measurable reliability improvements
- The "25 iterations" convergence should hold across additional frameworks

**What Researchers Should Test**:

I'm an independent researcher without institutional resources. I can propose theories and build small proofs-of-concept, but I can't run rigorous large-scale validation studies.

**Someone with resources should test**:

1. **ABC PLEASE Implementation Study**
   - Instrument production AI systems with agent health monitoring
   - Measure: failure rates, recovery times, user satisfaction
   - Compare: systems with vs. without preventive monitoring
   - Duration: 6+ months across diverse workloads

2. **Iteration Limit Validation**
   - Benchmark AI frameworks across iteration limits (10, 15, 20, 25, 30, 40, 50)
   - Measure: task completion rates, failure modes, user outcomes
   - Validate: Is 25 truly optimal, or framework-specific?
   - Theory test: Does DBT timing window mapping predict results?

3. **eFIT Protocol Effectiveness**
   - A/B test systems with vs. without explicit eFIT protocols
   - Measure: reliability metrics, error recovery, user trust
   - Control for: task complexity, model capabilities, context length
   - Duration: 3+ months with 1000+ users

4. **Cross-Framework Convergence**
   - Survey 20+ AI orchestration frameworks for design choices
   - Document: iteration limits, timeout values, circuit breaker thresholds
   - Analyze: convergence patterns, theoretical explanations
   - Validate: computational homology thesis

**This is testable. This is falsifiable. This is science.**

If I'm wrong, the interventions won't work. The structural homology doesn't hold. ABC PLEASE shows no reliability improvements. Someone wastes grant money testing a bad hypothesis.

But if I'm right - if the convergent evolution pattern continues - then clinical framing provides a systematic method for discovering interventions that engineering has missed for 70+ years.

**I'm not claiming to have proven this.**

I'm claiming the observational evidence is compelling enough to warrant serious investigation by researchers with the resources to validate or falsify the hypothesis rigorously.

The "25 iterations" convergence is real. The Circuit Breaker = DBT STOP structural identity is real. The absence of ABC PLEASE across all systems is real.

**These are facts.**

The computational homology thesis is my proposed explanation.

**That's the hypothesis to test.**

Not because AI systems have feelings.

Because they face the same computational constraints we do.

**And same constraints should require same solutions.**

That's not anthropomorphization.

**That's a testable prediction about convergent evolution under shared computational constraints.**

And if it's true, recognizing it makes us better engineers.

---

## Postscript: What About ABC PLEASE?

Since writing this, I've been thinking about ABC PLEASE - the completely missing protocol.

No system anywhere tracks agent health. No system monitors:
- Accumulated error burden
- Context exhaustion trajectory
- Performance degradation patterns
- Optimal operating conditions
- Cross-session learning

**Why not?**

Because engineering doesn't have the concept. Circuit breakers are reactive (trip after failures accumulate). There's no preventive analog.

But clinical psychology does: ABC PLEASE maintains baseline functioning to prevent crises.

**This is the strongest test of clinical framing's value.**

If clinical framing truly reveals patterns engineering misses, implementing ABC PLEASE should improve reliability. If it doesn't, maybe the homology doesn't hold.

**What I Can Do (As Independent Researcher)**:
- Prototype basic ABC PLEASE implementation (MCP server tracking agent metrics)
- Build proof-of-concept dashboard showing health trajectories
- Test on my own AI agent workflows
- Document the approach and share it openly

**What I Can't Do (Needs Resources)**:
- Rigorous A/B testing across thousands of users
- Long-term longitudinal studies (6+ months)
- Production deployment at scale
- Statistical validation of effectiveness
- Peer-reviewed publication of results

**The Challenge**: Small-scale prototypes can show *if* something works in limited contexts, but can't prove *how well* it works or *why* it works across diverse real-world conditions.

That's the limitation of independent research.

**But we won't know if ABC PLEASE is worth investigating at scale until someone tries.**

And we can only try because clinical framing suggested it.

That's why the framing matters - even if the validation requires resources I don't have.

---

**Next post**: Prototyping ABC PLEASE for AI agents - what metrics indicate "agent health" and how do we track them? (A proof-of-concept exploration that researchers with resources could expand upon)

---

*Scot Campbell builds cognitive infrastructure for AI systems at Prefrontal Systems. He's particularly interested in how clinical psychology can inform AI reliability engineering, and whether structural homology across substrates reveals universal patterns in executive function.*

---

## Related Posts

- [AI: Artificial but Not So Intelligent]({{< relref "ai-artificial-but-not-so-intelligent.md" >}}) - Explores AI limitations through the Chinese Room argument and why pattern matching differs from understanding
- [Applying Cognitive Load Theory in AI-Enhanced Workflows]({{< relref "cognitive-load-theory.md" >}}) - How working memory constraints affect performance in both humans and AI systems
- [Improving Emotional Intelligence in AI]({{< relref "emotional-intelligence-in-ai.md" >}}) - Can machines understand feelings, or are they just recognizing patterns?
- [Agentic AI for Autonomous Project Management]({{< relref "agentic-ai-autonomous-project-management.md" >}}) - Understanding the agentic AI systems that use iteration limits and circuit breakers
