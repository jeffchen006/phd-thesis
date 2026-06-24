


Level 1: A lightweight unifying formal view.
This explains the shared thesis idea: high-stakes software behavior is shaped by some weakly trusted or adversarial influence, and your defenses constrain the resulting behavior.



Level 2: Domain-specific formalizations.
Keep your current blockchain formalization and AI formalization. They are doing real technical work. For blockchain, your draft already formalizes Ethereum as a state-transition system with execution relation q \xrightarrow{\tau} q' or q \xrightarrow{\tau} \bot.   For AI systems, your draft already formalizes direct LLM code generation as c = M(p) and retrieval-augmented agents as y = A(p, R(p,D)).   Those are useful and should stay.




Add a short section, maybe in Chapter 1 or the beginning of Chapter 2, called something like:

A Common View: Behavior Under Untrusted Influence

Then define the common pattern:

Let a system instance be described by:

\mathcal{S} = (\mathcal{X}, \mathcal{I}, \mathcal{B}, F, \mathsf{Bad}, \mathsf{Def})

where:

x \in \mathcal{X}

is the current system context or state,

i \in \mathcal{I}

is an external influence that may be benign, weakly trusted, or adversarial,

b = F(x,i) \in \mathcal{B}

is the resulting behavior, output, or action,

\mathsf{Bad}(b)

is a security-relevant predicate identifying harmful outcomes, and

\mathsf{Def}

is a defense mechanism that constrains, rejects, audits, or modifies behavior.


This abstraction is not intended to replace the domain-specific semantics used in the technical chapters. Instead, it identifies the common shape of the four problems studied in the dissertation: an external influence shapes high-stakes behavior, and a practical defense constrains that behavior before or during execution.


The dissertation uses a common abstraction to describe where defenses intervene, but it does not impose a single operational semantics on all systems. Smart contracts require a transaction-level semantics over blockchain state, because attacks are expressed through state transitions, call trees, rollback behavior, and asset movement. LLM-based coding systems require a generation- and retrieval-level semantics, because risks arise from prompts, model outputs, retrieved evidence, and generated artifacts. The common abstraction therefore serves as an organizing layer; each technical chapter then instantiates it with the formal model needed for that domain.


Nick Feng’s thesis is a useful model here. It does not force every contribution into the same low-level formalism at the start. Instead, it introduces a workflow of satisfiability-based reasoning and asks three organizing questions: how to model the problem, how to trust the result, and how to encode reasoning tasks.   Then the thesis maps contributions back to those workflow questions.  

\text{untrusted influence} \rightarrow \text{software behavior} \rightarrow \text{security-relevant outcome} \rightarrow \text{defense}

Alicia Grubb’s thesis is also a useful model because it introduces a broad problem, narrows scope, uses concrete examples, and only then states the gap and research question. She explicitly says what her dissertation considers and what it does not consider.   Then she uses examples and modeler questions before stating the gap and central research question.   You can follow that pattern: broad motivation, concrete AI/payment/DeFi example, then your formal abstraction, then the concrete chapters.


This dissertation studies systems in which an external influence i affects a high-stakes behavior b = F(x,i). The defense problem is to design mechanisms \mathsf{Def} that reduce the probability or feasibility of \mathsf{Bad}(b) under adversarial or weakly trusted i, while preserving acceptable behavior on benign inputs.

Do not rewrite your papers around “high-stakes systems.” Keep the strong domain-specific formalizations. Add a short unifying abstraction that explains why those formalizations belong in the same thesis.



This thesis studies how to defend high-stakes software behavior when the inputs that shape that behavior cannot be fully trusted.

