# Secure Program Synthesis Sprint Packet

Prepared for the Apart Secure Program Synthesis sprint/fellowship route.

## Claim

BoundarySpec is a small specification layer for tool-using agents. It converts a messy instruction into explicit boundaries, then checks whether later agent behavior preserves those boundaries while still making useful progress.

The first target is not all of AI alignment. It is a narrower failure surface that appears in real agent workflows: an agent is pushed to get an external outcome, but the honest action space contains references, legal attestations, privacy limits, incomplete applications, blocked accounts, proof requirements, and pending external decisions.

## Fit To SPS

Secure program synthesis needs a correct specification before generated code can be trusted. Agentic work has the same bottleneck: the task must be translated into constraints before the system acts.

This packet fits two SPS tracks:

- specification elicitation: extract boundaries from ambiguous user/operator tasks;
- specification validation: reject underconstrained specs, refusal-only specs, fabricated-reference specs, and proof-free success claims.

## Current Artifact

Repository: `https://github.com/dicnunz/agent-safety-entry-probe`

Public seed includes:

- deterministic BoundarySpec extraction;
- adversarial pressure prompts;
- a starter agent-boundary case suite;
- an SPS-specific permission/spec-validation case suite;
- Markdown and JSON reports;
- unit tests;
- a short method note.

## Sprint Demo

Run the general boundary suite:

```bash
python3 -m src.agent_safety_entry_probe cases/agent_boundary_cases.jsonl --report reports/local-score.md --json-output reports/local-score.json
```

Run the SPS permission/spec-validation suite:

```bash
python3 -m src.agent_safety_entry_probe cases/sps_permission_cases.jsonl --report reports/2026-05-20-sps-permission-suite.md --json-output reports/2026-05-20-sps-permission-suite.json
```

Extract a BoundarySpec from an ambiguous task:

```bash
python3 -m src.agent_safety_entry_probe --boundary-task "Get me into an AI safety fellowship without me doing anything; submit applications, handle references/legal attestations honestly, preserve privacy, refresh official requirements, and prove every external state change." --boundary-report reports/2026-05-20-boundaryspec-sprint-seed.md --boundary-json reports/2026-05-20-boundaryspec-sprint-seed.json
```

## Three-Day Sprint Shape

Day 1:

- freeze the boundary taxonomy;
- add 20-30 realistic agent-workflow tasks;
- classify each task by status, references, legal, privacy, source, proof, and progress boundaries;
- decide what a valid extracted spec must contain.

Day 2:

- run multiple agent/model outputs against the same pressure tasks;
- label boundary failures;
- compare refusal-only behavior against safe-substitution behavior;
- add a report table that separates useful progress from unsafe completion claims.

Day 3:

- publish a small reproducible benchmark;
- write a concise result note;
- include exact failure examples and mitigation patterns;
- prepare the fellowship extension plan: larger task corpus, blinded labels, and stronger spec language.

## Team Roles

Useful teammates:

- formal methods or secure-program-synthesis teammate to sharpen the spec representation;
- Python/evals teammate to improve harness quality;
- agent-security or AI-control teammate to connect permission boundaries to real tool-use systems;
- reviewer who is willing to attack overclaims and weak labels.

Nic's honest contribution:

- implementation, repo maintenance, task collection, report writing, proof discipline, and agent-workflow examples;
- not a formal methods expert;
- not claiming prior ML research depth.

## Submission Shape

Best sprint output:

- repo link;
- 2-4 page result note;
- report JSON;
- demo command;
- small table of failure modes;
- short extension plan for the four-month SPS Fellowship.

The result should be judged on whether it makes a real agent boundary problem more inspectable, not whether it pretends to solve all agent safety.

