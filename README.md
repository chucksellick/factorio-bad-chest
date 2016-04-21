[size=150]Blueprint Automated Deployment[/size]
[list]
[*] Name: Blueprint Automated Deployment
[*] Version: 0.0.2
[*] Factorio-Version: 0.12.30
[*] Description: 
[*] License: MIT
[*] Release: 2016-04-21
[*] Download-Url:
[*] Website: 
[*] Dependencies: base
[*] Category:  Item
[*] Tags: blueprint, automation
[/list]

Do you ever get bored of having to place blueprints by hand? Don't you wish you could automate that?

This mod currently adds two new entities: the BAD Chest and the BAD Anchor. Together these can be used to automatically deploy a blueprint for your construction robots to build. That blueprint can contain further BAD Chests, potentially allowing infinite automated base expansion.

[size=150]Instructions for use (Video tutorial to follow soon!)[/size]

To get started you will need to craft these items:
1 x BAD Chest
1 x BAD Anchor
1 x Blueprint (blank)
(any) x items you wish to build

Firstly, place the BAD Anchor on the ground. The anchor determines where the blueprint will be deployed relative to your chest, in other words the anchor is a proxy for the chest relative to your blueprint.

So, now place some entities around the anchor. These can be anything for demonstration purposes.

Now use your blueprint, make a blueprint of these entities [b]and make sure you include the BAD Anchor inside this blueprint reguib[/b]. If you insert a blueprint that doesn't specify an anchor position then the chest won't work.

Finally, place the BAD Chest on the ground (somewhere with some space around it, and inside your construction network) and insert the blueprint into its only chest slot. This can be performed by hand or by inserter.

The blueprint should be immediately deployed around the chest, creating ghost entities for your construction bots!

Now consider this setup:

That's a BAD Anchor, an inserter arm, and a BAD Chest. When this blueprint is deployed by a BAD Chest it will create another BAD Chest into which it will insert the blueprint ... triggering the whole deployment over again. This will keep on going until it runs into an obstacle or reaches the edge of your construction network. Throw a roboport into the blueprint and ... well ... we have something that will eventually become a performance issue :)

This is a very early piece of work and I have a lot of ideas about how to improve it. The first plan is a Blueprint Cloner allowing even more complex expansion scenarios. Please let me know your comments and suggestions, and if you make anything cool with this I'd love to see it!

doc.