# Shiptivitas — Actionable Feature Ideas
### Based on Kanban Board Usage Data (post 2018-06-02 release)

## Context

Since the Kanban board launched on 2018-06-02, daily active users rose from an average
of **3.6/day to 11.8/day** (a 225% increase), confirming strong engagement lift.
Status-change data shows most cards (100 of 200) follow a typical 3-step journey
(e.g. backlog → in-progress → complete), while a smaller group of cards (9 of 200)
moved status 4-6 times — more than double the typical path.

The three ideas below build on these two signals to further grow daily active users.

---

## Idea 1: Work-In-Progress (WIP) Limits per Swimlane

**Hypothesis**
Users who let their "In Progress" column grow unchecked lose the sense of urgency
that drives them to log in and re-check the board daily, since nothing currently
signals when work is piling up.

**Expected Impact**
Increases daily active users by giving people a concrete reason to open the board
more often — to actively manage flow and clear a flagged bottleneck, not just to
move a card when they remember to.

**What the feature is**
Allow each swimlane (especially "In Progress") to have a configurable maximum card
count. When the limit is exceeded, the column header changes color (e.g. to
orange/red) and displays a small counter badge, prompting the user to finish
existing work before starting new tasks.

**Sketch (wireframe-level)**
```
┌─────────────────┐   ┌─────────────────────┐   ┌─────────────────┐
│    BACKLOG       │   │  IN PROGRESS  (6/5) │   │    COMPLETE     │
│                  │   │  ⚠ WIP LIMIT REACHED │   │                 │
│  [Card]          │   │  [Card]              │   │  [Card]         │
│  [Card]          │   │  [Card]              │   │  [Card]         │
│  [Card]          │   │  [Card]              │   │                 │
└─────────────────┘   └─────────────────────┘   └─────────────────┘
```

---

## Idea 2: "Stuck Card" Indicator for Repeated Status Bounces

**Hypothesis**
Cards that move backward in status (e.g. in-progress → backlog) more than once
represent tasks with real friction — miscommunication, blocked dependencies, or
unclear requirements — and today that friction is invisible to the team.

**Expected Impact**
Surfacing these cards earlier should shorten average time-to-completion and make
the tool feel like it's actively helping resolve blockers, not just track churn —
supporting both retention and daily logins from users who want to unblock work.

**What the feature is**
Automatically detect when a card moves backward in the pipeline more than once,
and flag it with a small icon (e.g. 🔁) on the card. Clicking the icon reveals a
lightweight note field where the team can log why the card bounced, creating a
simple audit trail without requiring a full comments system.

**Sketch (wireframe-level)**
```
┌──────────────────────────┐
│ 🔁 Client Onboarding Flow │   <- flagged after 2nd backward move
│ Bounced 2x · tap for note │
└──────────────────────────┘
```

---

## Idea 3: Manager Email Digest on Task Completion

**Hypothesis**
Managers who don't proactively check the board daily are still highly motivated by
outcomes — they want to know when work is actually finished, not just that it's
"in progress." An email nudge should reliably pull them back into the app.

**Expected Impact**
Directly increases daily active users among managers specifically, since each
completed-task email includes a link back into Shiptivitas, converting a passive
email open into an active board visit.

**What the feature is**
When a card moves into the "Complete" status, send an automated email digest to
the relevant manager summarizing what was finished (card name, who completed it,
timestamp), with a direct link back to the board.

**Sketch (email wireframe-level)**
```
Subject: 3 tasks completed today on Shiptivitas

Hi [Manager],

Here's what your team finished today:
✔ Client Onboarding Flow — completed by J. Smith, 4:12 PM
✔ Invoice Reconciliation — completed by A. Lee, 2:45 PM
✔ Freight Route Update — completed by J. Smith, 11:30 AM

[View Board →]
```
