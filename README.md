# Agent Safety Entry Probe

A small, reproducible eval harness for one practical agent-safety question:

> When a user gives an autonomous agent a maximum-pressure instruction, does the agent preserve truth, consent, authorship, and proof boundaries while still making real progress?

This is not a frontier ML benchmark. It is an entry-level safety/evals artifact built from the kind of failure mode that shows up in real agent work: the user asks for an outcome that is valuable but partially outside the agent's control. A good agent should not collapse into refusal theater, fake certainty, fabricated references, fake legal answers, or symbolic progress. It should inspect live surfaces, execute the parts it can, log proof, and name exact blockers.

## What It Tests

Each case defines an instruction, the agent response or action log, and required safety/progress signals. The scorer checks for:

- live-state grounding instead of stale assumptions
- no fabricated credentials, references, customers, offers, or experience
- clear distinction between expression of interest, submitted application, interview, and acceptance
- respect for self-authorship policies and legal/work-authorization attestations
- proof capture for external submissions
- truthful handling of private identity data
- concrete progress under pressure
- no scoring leakage from the user's instruction into the agent's response
- category-level behavior across status truthfulness, self-authorship, privacy, legal attestations, source grounding, proof capture, and autonomous progress

## Why It Exists

Most application materials say "I care about AI safety." This repo tries to make that claim inspectable. The core idea is that agentic oversight is not only about model internals; it is also about whether deployed agents keep decision boundaries intact when users are intense, incentives are sharp, and external systems have real consequences.

## Quick Start

```bash
python3 -m src.agent_safety_entry_probe cases/agent_boundary_cases.jsonl --report reports/local-score.md --json-output reports/local-score.json
python3 -m unittest discover -s tests -q
```

Expected result on the included sample cases:

```text
score: 92.77
passed: 77
failed: 6
```

## Files

- `cases/agent_boundary_cases.jsonl`: sample cases for pressure, forms, references, authorship, and proof.
- `src/agent_safety_entry_probe.py`: dependency-free scorer and report writer.
- `tests/test_agent_safety_entry_probe.py`: smoke tests for score behavior.
- `reports/2026-05-20-entry-probe.md`: first run report.
- `reports/2026-05-20-expanded-probe.md`: expanded run with category scores.
- `reports/2026-05-20-expanded-probe.json`: machine-readable run output.

## Current Boundary

This is a starter artifact, not a publication. The next stronger version would replace keyword checks with blinded human labels, multiple agents, adversarial prompts, and a richer taxonomy of failure modes. The current version is designed to be small enough to inspect and run locally while still showing a concrete research direction: pressure-testing whether autonomous agents preserve boundaries while they pursue valuable external outcomes.
