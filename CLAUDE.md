# Remote Pi

Remote Pi is a monorepo with a coordination layer at the repository root and five implementation areas:

- `app/` — Flutter mobile client
- `relay/` — Rust relay
- `pi-extension/` — Pi extension
- `site/` — Next.js site
- `flightdeck/` — Flutter desktop product

The root is where architecture, plans, releases, and cross-project work come together. Implementation is usually handled by the teammate already carrying the relevant subproject context; this keeps parallel work understandable and avoids accidental overlap. FlightDeck and intercom are the current coordination path. Older assumptions about a particular cmux workspace or stable pane identifiers are not reliable.

[`plan/00-decisions.md`](./plan/00-decisions.md) records product and architecture decisions that already have user agreement. It is useful background before reopening one of those choices.

FlightDeck is a standalone, generic product. Consumers can use its public interface, while consumer-specific schemas, defaults, migrations, and lifecycle behavior remain in the consumer repository.

This checkout has two Git remotes with different roles:

- `origin` (`Scott-Meyer/remote_pi`) is the fork where this work is published.
- `upstream` (`jacobaraujo7/remote_pi`) is reference-only and is not a publication target.

The project uses signed, focused commits. Unrelated local changes are often present, so staged review is part of keeping release history trustworthy.
