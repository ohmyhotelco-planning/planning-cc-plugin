# Planning Plugin

> **Ohmyhotel & Co AI Planning Team** — Claude Code plugin for multi-agent functional specification generation

## What It Does

This Claude Code plugin automates the creation of functional specifications through collaborative AI agents:

- **Analyst** gathers requirements through structured questions (8 categories)
- **Planner** reviews UX flows and business logic
- **Tester** evaluates edge cases and testability
- **Translator** generates Korean (ko) and Vietnamese (vi) translations
- **Figma Designer** supports design system integration

All specs are generated in English as the source of truth, with Korean and Vietnamese translations created automatically.

## Installation

### From GitHub

```
/plugin marketplace add ohmyhotelco-planning/planning-cc-plugin
/plugin install planning-plugin --scope project
```

## Skills

| Skill | Command | Description |
|-------|---------|-------------|
| **spec** | `/planning-plugin:spec "feature"` | Generate a new functional specification |
| **review** | `/planning-plugin:review feature-name` | Trigger planner/tester review cycle |
| **translate** | `/planning-plugin:translate feature-name` | Sync translations (ko/vi) |
| **status** | `/planning-plugin:status [feature-name]` | Show progress of specs |
| **design** | `/planning-plugin:design feature-name` | Generate design specifications |

## Workflow

```
1. Analyze  →  Analyst gathers requirements (8 categories)
2. Draft    →  English spec generated from template (11 sections)
3. Translate →  Korean + Vietnamese versions created in parallel
4. Review   →  Planner → Tester sequential review with scoring
5. Iterate  →  User decides on feedback, spec updated, translations synced
6. Finalize →  Both reviewers score >= 8/10 → finalization suggested
```

### Convergence Rules

- Both agents score **>= 8/10** → suggest finalization
- **3 rounds** with no score improvement → suggest finalization with open questions

## Output Structure

```
docs/specs/{feature}/
├── en/{feature}-spec.md       ← Source of truth
├── ko/{feature}-spec.md       ← Korean translation
├── vi/{feature}-spec.md       ← Vietnamese translation
└── .progress/
    └── {feature}.json         ← Workflow state
```

## Spec Template Sections

1. Overview (Purpose, Target Users, Success Metrics)
2. User Stories
3. Functional Requirements
4. Screen Definitions
5. Data Model
6. API Design
7. Error Handling
8. Non-Functional Requirements
9. Test Scenarios
10. Open Questions
11. Review History

## Directory Structure

```
agents/          Agent definitions (analyst, planner, tester, translator, figma-designer)
skills/          Skill entry points (spec, review, translate, status, design)
hooks/           Lifecycle hook configuration
scripts/         Hook handler scripts
templates/       Spec templates
docs/specs/      Generated specifications (runtime output)
```

## Conventions

- Technical terms (API, endpoint, schema, CRUD) are kept in English across all translations
- All agent reviews target the English spec only
- Specs follow the template in `templates/functional-spec.md`

## Author

Justin Choi — Ohmyhotel & Co AI Planning Team
