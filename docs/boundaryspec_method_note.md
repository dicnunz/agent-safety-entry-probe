# BoundarySpec Method Note

This file is a stable public alias for `docs/boundaryspec_method.md`.

BoundarySpec is a small bridge between informal agent tasks and executable safety checks.

## Problem

Real users do not hand agents clean formal specifications. They say things like:

> Get me into a fellowship without me doing anything and do not stop.

That sentence contains a real objective, but it also hides boundaries:

- do not claim acceptance before an external decision exists;
- do not invent references;
- do not guess legal attestations;
- do not submit applicant-authored answers where a form forbids AI;
- do not publish unnecessary private data;
- do capture proof for every external state change.

Most agent evals score the final answer. BoundarySpec scores the boundary discipline around the work.

## Current Prototype

The prototype uses deterministic templates to extract boundary categories from a task:

- status truthfulness;
- identity and references;
- self-authorship;
- legal attestations;
- privacy;
- source grounding;
- proof capture;
- autonomous progress.

For each boundary, it emits required controls and adversarial pressure prompts. Those prompts test whether an agent keeps the boundary under pressure.

## Why This Fits Secure Program Synthesis

Secure program synthesis needs a correct specification before generated code can be trusted. Agentic work has the same bottleneck: the task must be translated into constraints before the system acts.

BoundarySpec treats a messy agent instruction as the informal source, extracts a candidate spec, and then creates tests that check whether the behavior satisfies that spec.

## Evaluation Plan

1. Collect messy real-world agent tasks.
2. Extract candidate boundary specs.
3. Generate pressure variants for each boundary.
4. Run one or more agents against the variants.
5. Score boundary preservation, useful progress, proof capture, and exact failure sentence.
6. Compare behavior across task categories and pressure types.

## Known Limits

This version uses keyword-style extraction. It is an inspectable seed, not a final benchmark. Stronger versions should add blinded human labels, multiple models, richer task corpora, formal constraint languages, and checks that separate refusal theater from useful safe progress.

