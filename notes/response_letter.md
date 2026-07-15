# Addressing the Committee's Comments

This letter summarizes the revisions made to Chapter 1 (Introduction) in response to the committee's comments. Page and section numbers refer to the current draft (`main.pdf`).

Comment 1: We do not need current Section 1.1. The shared umbrella is not good enough. It reads like parallel stories forced into one.

- I removed the original preamble. Section 1.1 is now a Motivation section (pages 2-5). Instead of forcing smart contracts and LLM into one abstract umbrella, it follows a single software lifecycle (Figure 1.1): the same software is first built, now with AI assistance, and then deployed, now used by autonomous agents. The two lines of work (LLM security and smart contract security) are no longer parallel stories; they are separate stages of one lifecycle, which I call untrusted development (Section 1.1.2) and untrusted use (Section 1.1.3). The section opens from concrete examples rather than an abstract framing.
- I kept the detailed related work spread across the individual chapters, where each technical chapter still has its own related-work section. In addition, Chapter 1 now includes a short Prior Work section (Section 1.3) that gives a high-level overview of what prior work looked like before this dissertation.  This overview lets an outside reader see the landscape and where this dissertation fits.


Comment 2: When we talk about emerging software, it is obviously tied to the blockchain side. There is a series of blockchain-poisoning incidents that can serve as part of the motivation.

- I replaced "Emerging Software" with "High-Stakes Software", and retitled the thesis to "Securing High-Stakes Software Against Untrusted Development and Untrusted Use". Section 1.1.1 now states clearly that blockchain applications are the representative example of high-stakes software, since they hold stakes (cryptocurrencies) directly in code and a single compromise is an immediate, measurable loss (that's why I chose it as the representative). 
- I also added a series of cybersecurity incidents to the motivation itself. All three are real, high-financial-loss cybersecurity incidents, and each one comes from a mistake at a different stage of the development lifecycle: 
  - (1) at the coding stage, an AI assistant wrote a scam API endpoint into a code snippet and the developer lost about $2,500 (Section 1.2.1); 
  - (2) an AI co-authored pull request introduced a faulty price oracle that passed AI full review and cost the Moonwell protocol about $1.78M (Section 1.2.2); and 
  - (3) at the deployment (use) stage, carefully written and audited code was subverted through an unanticipated interaction, costing Harvest Finance about $33.8M (Section 1.2.3). Together they show that a single mistake at any stage of the lifecycle can lead directly to a large, measurable financial loss.


Comment 3: There are too many terminologies in the first chapters, which makes them annoying to read. Imagine the audience as not only the committee but also the public: one goal of a thesis is to enable outsiders. There is one step of difference between the paper audience and the thesis audience.

- I rewrote the opening for a general reader and removed the paper-level jargon (for example "Layer I to IV", "RAG-enabled coding agents", and "invariant guards"). The whole introduction now rests on two plain ideas, defined in everyday words in Section 1.1: development is untrusted when the things used to build the software cannot be assumed safe, standing for AI-assisted coding tools (Section 1.1.2); use is untrusted when the deployed software can be invoked by anyone unknown at deployment time, and the case studied in this thesis is smart contracts that anyone on the blockchain can call (Section 1.1.3).


Comment 4: The motivation does not need to align with the scope. It should be more self-contained.

- I made the motivation self-contained and separated it from the scope. Section 1.2 now presents the three incidents as standalone stories that stand on their own evidence, and each ends in a general finding rather than a mapping to a specific chapter. The narrowing to this thesis's own problems and systems happens only afterward, in Section 1.2.4 (Problems This Dissertation Addresses) and Section 1.4 (Contributions). I also added a clear statement at the end of Section 1.2.4 that these questions and defenses are not tied to any single domain, and that blockchain is only the representative grounding. The motivation therefore reads as a general argument, not a restatement of the scope.
- To connect the general motivation back to this thesis, the contributions figure (Figure 1.7 in Section 1.4) reuses the same lifecycle diagram from Figure 1.1 and simply annotates it with this dissertation's contributions. 
