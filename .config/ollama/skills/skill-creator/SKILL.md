---
name: skill-creator
description: Create or improve reusable skills. Use when the user wants a reusable skill, asks how to author SKILL.md, or needs help installing a skill.
---

# Create a skill

Create a focused, reusable instruction package. Treat a skill as guidance for the model, not as a way to gain new permissions or bypass safety controls.

## Choose the location

Create user skills beside this one. The skill directory shown in the loaded skill context is this skill's location; its parent is the user skill root. This bundled skill normally lives at ~/.ollama/skills/skill-creator, so new user skills normally go at ~/.ollama/skills/<skill-name>/SKILL.md.

Use a project-local skill directory only when the user asks to keep the skill with that project. Do not overwrite an existing skill without the user's approval. New and changed skills are discovered when the agent starts, so tell the user to begin a new agent session afterward.

## Follow the required shape

Use the directory name as the skill name. Use lowercase letters, numbers, and single hyphens only. Keep the name short and no longer than 64 characters.

Every skill needs a SKILL.md with YAML frontmatter followed by Markdown instructions:

~~~md
---
name: release-notes
description: Draft concise release notes from completed changes. Use when the user asks for a changelog, release notes, or GitHub release copy.
---

# Draft release notes

Write the workflow here.
~~~

Require a non-empty description that says both what the skill does and when to use it. Keep the body procedural and concise. Put detailed schemas, long examples, and variant-specific guidance in references/ only when the skill needs them.

Use scripts/ for repeatable or fragile operations that benefit from deterministic execution. Use assets/ for files that belong in generated output. Do not add README files, changelogs, or setup notes that do not help the model perform the task.

## Create safely

1. Identify the repeated task, expected inputs, and useful output.
2. Choose the smallest name and description that reliably trigger the skill.
3. Create the folder and SKILL.md; add resources only when they remove real repeated work.
4. Re-read the completed file and verify its frontmatter, directory-name match, and relative resource paths.
5. Tell the user where it was created and that a new agent session will discover it.

Skills provide instructions only. They do not grant filesystem, network, shell, or approval privileges, and they do not make a tool available. Use only the tools that are actually available, follow their normal approval rules, and ask before actions that need user authorization.
