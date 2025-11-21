---
title: "CortexGraph"
description: "The knowledge layer for AI systems. Memory, context, and retrieval orchestration with human-like forgetting curves."
keywords: ["CortexGraph", "AI memory", "temporal memory", "knowledge graph", "mnemex"]
date: 2025-11-21
aliases:
  - /projects/cortexgraph/
  - /projects/mnemex/
framework:
  positioning: "The knowledge layer for AI systems"
  github: "https://github.com/mnemexai/cortexgraph"
  pypi: "cortexgraph"
  documentation: "https://cortexgraph.readthedocs.io"
  status: "beta"
related_research:
  - "10.5281/zenodo.14487847"
---

# CortexGraph

**The knowledge layer for AI systems**

CortexGraph provides memory, context, and retrieval orchestration for AI systems. It implements temporal memory management with human-like forgetting curves, ensuring AI systems remember what matters and forget what doesn't.

## The Problem

AI systems face a fundamental memory challenge:

- Context windows are fixed and expensive
- Everything is treated as equally important
- There's no distinction between recent working memory and long-term storage
- Retrieval is based on similarity, not relevance or temporal dynamics

The result? Systems that either:
1. Remember too much (context bloat, high costs)
2. Remember too little (forgetting critical information)
3. Retrieve poorly (surfacing irrelevant memories)

## What CortexGraph Provides

### Temporal Memory Management
- **Forgetting curves** inspired by Ebbinghaus and clinically-validated memory research
- Automatic decay of importance over time
- Reinforcement through repeated access
- Distinction between episodic and semantic memory

### Intelligent Retrieval
- Relevance scoring that combines:
  - Semantic similarity
  - Temporal recency
  - Access frequency
  - Reinforcement history
- Configurable retrieval strategies for different use cases
- Context-aware memory selection

### Memory Types
- **Working memory**: Recent, highly-accessible context
- **Long-term memory**: Historical information with decay
- **Semantic memory**: Factual knowledge without temporal context
- **Episodic memory**: Time-stamped events and experiences

### Graph-Based Architecture
- Memories as nodes with rich metadata
- Relationships as edges with typed connections
- Graph queries for complex retrieval patterns
- Integration with traditional vector databases

## How It Works

```python
from cortexgraph import MemoryGraph

# Initialize memory system
memory = MemoryGraph()

# Store a memory
memory.store(
    content="User prefers technical explanations",
    memory_type="preference",
    importance=0.8
)

# Retrieve relevant memories
relevant = memory.retrieve(
    query="How should I explain this concept?",
    top_k=5
)

# Memories decay over time unless reinforced
memory.decay(hours=24)  # Apply temporal decay
```

## Integration

CortexGraph integrates with:
- **PrefrontalOS**: Executive function decides *when* to retrieve memories
- **STOPPER Protocol**: Behavioral regulation prevents memory-based loops
- **Vector databases**: Drop-in enhancement for existing retrieval systems

## Status

CortexGraph is in **beta**. Core functionality is stable, and we're actively adding features based on production use cases.

## Get Started

- **PyPI**: `pip install cortexgraph`
- **GitHub**: [github.com/mnemexai/cortexgraph](https://github.com/mnemexai/cortexgraph)
- **Docs**: [cortexgraph.readthedocs.io](https://cortexgraph.readthedocs.io)
- **Consulting**: Need implementation support? [Talk to us →](/contact/)

---

*The knowledge layer for AI systems*
