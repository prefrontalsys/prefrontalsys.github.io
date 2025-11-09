---
title: "CortexGraph"
date: 2025-10-15
draft: false
description: "Temporal memory system with human-like forgetting curve"
---

## Overview

CortexGraph (formerly Mnemex) is a temporal memory system implementing human-like forgetting curves and memory consolidation patterns. Modeled after hippocampus-cortex interaction, it provides short-term to long-term memory transitions for AI systems.

## Key Features

### Temporal Decay
- Ebbinghaus forgetting curve implementation
- Spaced repetition for memory reinforcement
- Automatic garbage collection of unused memories
- Natural "Maslow effect" through conversation-based review

### Memory Consolidation
- Short-term memory (STM) with temporal decay
- Long-term memory (LTM) promotion for high-value memories
- Hippocampal bridge pattern for consolidation
- Integration with Obsidian vaults for permanent storage

### Graph-Based Organization
- Entity-relation knowledge graph
- Semantic similarity clustering
- Spreading activation for retrieval
- Explicit relation creation and tracking

## Technical Implementation

- **Storage**: JSON-based with optional Neo4j backend
- **Embeddings**: Semantic search with vector similarity
- **MCP Server**: Model Context Protocol integration
- **Python API**: Direct library usage for custom applications

## Publication

**Published**: PyPI package `mnemex`
**Test Coverage**: 98%+
**License**: Apache 2.0

## Links

- [GitHub Repository](https://github.com/mnemexai/mnemex)
- [PyPI Package](https://pypi.org/project/mnemex/)
- [Documentation](https://github.com/mnemexai/mnemex#readme)
