---
name: translate
description: Manually sync Korean and Vietnamese translations with the English source specification. Use after directly editing the English spec.
argument-hint: "[feature-name] [--section=N]"
user-invocable: true
allowed-tools: Read, Write, Edit, Glob, Task
---

# Manual Translation Sync

Sync translations for: **$ARGUMENTS**

## Instructions

### Step 1: Parse Arguments

- First argument: feature name (required)
- Optional `--section=N` flag: only translate section N (e.g., `--section=3` for Functional Requirements)
- If no section specified, do a full translation sync

### Step 2: Locate the English Spec

1. Find the spec at `docs/specs/{feature}/en/{feature}-spec.md`
2. If not found, list available specs and ask the user to choose

### Step 3: Check Existing Translations

Read existing ko/vi translations if they exist. Determine if this is:
- **Full translation**: No existing translations, or `--section` not specified
- **Partial translation**: `--section` specified and translations exist

### Step 4: Run Translation

Launch **two translator agents in parallel**:

**Korean:**
```
Task(subagent_type: "translator", prompt: "Translate the English spec at docs/specs/{feature}/en/{feature}-spec.md to Korean. Write to docs/specs/{feature}/ko/{feature}-spec.md. {full_or_partial_instruction}")
```

**Vietnamese:**
```
Task(subagent_type: "translator", prompt: "Translate the English spec at docs/specs/{feature}/en/{feature}-spec.md to Vietnamese. Write to docs/specs/{feature}/vi/{feature}-spec.md. {full_or_partial_instruction}")
```

For partial translations, include: "Only translate section {N}. Keep all other sections from the existing translation file."

### Step 5: Update Progress

Update the progress file's translation status:
```json
{
  "translations": {
    "ko": { "synced": true, "lastSyncedAt": "{timestamp}" },
    "vi": { "synced": true, "lastSyncedAt": "{timestamp}" }
  }
}
```

### Step 6: Confirm

Report:
- Which sections were translated/updated
- Sync timestamps
- Any `<!-- NEEDS_REVIEW -->` markers left by the translator
