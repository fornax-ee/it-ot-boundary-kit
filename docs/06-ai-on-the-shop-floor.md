# 06 AI on the shop floor

Most corporate AI policies are written for office workers: one person, one laptop, one account. A local GPU server in a factory is used very differently.

## Three ways a local AI server is used

| Mode | Example | Identity |
|---|---|---|
| **Personal chat** | an engineer asks questions about a drawing | personal company account, own chat history |
| **Workstation chat** | a shared terminal at a line: "what's the next order, where's the drawing?" | the **workstation**, optionally a worker code in the app |
| **Application backend** | a quality inspection app sends photos, an MES app asks "when will order X be ready?" | the application's own service account or key |

A rule like "everyone logs in with a personal account, no shared accounts" works for mode 1 and breaks modes 2 and 3.

## Rules that work for all three

- **Personal chat:** company account, personal history, the user can delete their own conversations.
- **Workstation chat:** bound to the workstation, not a person. It sees only what that workstation needs (orders, drawings, instructions, production status). Prices, margins and personal data are not reachable from it. Because conversations are shared, no personal data is entered.
- **Applications:** own service account or key, never in code; user authentication is the application's job.
- The model API is reachable **only from the internal network and approved applications**, never from the internet.
- Document search respects existing permissions: a user or workstation sees only documents it could open anyway.

## Logging without surveillance

Do **not** log prompt and response content by default.

- Content logs duplicate confidential data and create a new store that administrators can read.
- The EU AI Act's logging obligations target high-risk systems (e.g. recruitment, worker evaluation). Typical shop-floor uses such as quality inspection or production queries are not in that category.
- Log **technical metadata**: who or which application, when, which model. Keep it like other system logs.
- Images and results produced by production apps (e.g. inspection photos) are **production data**, with retention decided by the plant, not AI logs.

## Models

- Install models only from trusted sources (the publisher's official page), preferably in `safetensors` format.
- Every model used in production goes into the AI system register with source and version.
- Pin embedding model versions: different versions produce incompatible vectors.

## Training

Office users get an introductory AI course before they get an account. Shop-floor users of a workstation chat get a short on-the-job briefing instead. Both are documented; that covers the AI literacy obligation without sending the whole factory to a classroom.
