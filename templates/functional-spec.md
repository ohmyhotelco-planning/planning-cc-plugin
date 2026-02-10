# {Feature Name} — Functional Specification

> **Status**: {DRAFT | REVIEWING | FINALIZED}
> **Author**: Planning Plugin (Auto-generated)
> **Created**: {date}
> **Last Updated**: {date}

---

## 1. Overview

### 1.1 Purpose
<!-- Why does this feature exist? What problem does it solve? -->

### 1.2 Target Users
<!-- Who will use this feature? List user roles/personas. -->

### 1.3 Success Metrics
<!-- How do we measure success? List KPIs or measurable outcomes. -->

---

## 2. User Stories

| ID | Role | Goal | Priority |
|----|------|------|----------|
| US-001 | As a {role} | I want to {goal} so that {benefit} | P0 |

---

## 3. Functional Requirements

### FR-001: {Requirement Title}

**Description**: {Detailed description}

**Business Rules**:
- BR-001: {rule}

**Acceptance Criteria**:
- [ ] AC-001: {criterion}

---

## 4. Screen Definitions

### Screen: {Screen Name}

**Purpose**: {What does this screen do?}

**Entry Points**: {How does the user reach this screen?}

**Layout**:
<!-- Describe the layout structure -->

**Components**:
| Component | Type | Behavior |
|-----------|------|----------|
| {name} | {type} | {description} |

**User Actions**:
| Action | Trigger | Result |
|--------|---------|--------|
| {action} | {trigger} | {expected result} |

---

## 5. Data Model

### Entity: {Entity Name}

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| id | UUID | Yes | Primary key |

**Relationships**:
- {Entity A} → {Entity B}: {relationship type and description}

---

## 6. API Design

### {METHOD} {/api/path}

**Description**: {What does this endpoint do?}

**Request**:
```json
{
}
```

**Response (200)**:
```json
{
}
```

**Error Responses**:
| Status | Code | Description |
|--------|------|-------------|
| 400 | INVALID_INPUT | {description} |

---

## 7. Error Handling

| Error Code | Condition | User Message | Resolution |
|------------|-----------|--------------|------------|
| {code} | {when does this occur?} | {message shown to user} | {how to resolve} |

---

## 8. Non-Functional Requirements

### 8.1 Performance
- {requirement}

### 8.2 Security
- {requirement}

### 8.3 Accessibility
- {requirement}

### 8.4 Internationalization
- {requirement}

---

## 9. Test Scenarios

### TS-001: {Test Scenario Title}

**Given**: {precondition}
**When**: {action}
**Then**: {expected result}

---

## 10. Open Questions

| ID | Question | Context | Status |
|----|----------|---------|--------|
| OQ-001 | {question} | {why this matters} | OPEN |

---

## 11. Review History

| Round | Planner Score | Tester Score | Key Decisions | Date |
|-------|---------------|--------------|---------------|------|
| 1 | {score}/10 | {score}/10 | {decisions made} | {date} |
