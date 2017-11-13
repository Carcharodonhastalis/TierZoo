# TierZoo: The Website

Hey there, this is a half-built website for the fantastic YouTube series [TierZoo](https://www.youtube.com/channel/UCHsRtomD4twRf5WVHHk-cMw).

It aims to emulate the look and feel of the video, uh, slides(?) and allow for all the kinds of data in the video to be easily accessible.

## What needs to be done?

Glad you asked. I made a checklist.

- [ ] **Write [build articles](#build-articles)**
- [x] Display builds(animals) in a tier list.
- [x] Display subgroups of builds in the same tier list.
- [x] Make pages for individual builds.
- [x] Display a build's abilities on its build page.
- [ ] Allow video embeds on build pages (y'know, for the actual TierZoo video)
- [ ] Style build pages to show all the info nicely.
- [ ] Skill trees. Just anything on them in general.
- [ ] Allow for sorting by nerdy things like kingdom and phylum.
- [ ] ...And much more! That I haven't thought of yet!

## Build Articles

### What's a build article?

A build article is a file that contains all the data on one build, 
including a regular article describing the build and justifying its 
tier placement. The article *is* optional, but that's boring.

Since they're implemented as a Jekyll collection, they're YAML 
front-matter files. The article itself is udually written in Markdown,
and all data outside of that is stored in YAML between two lines of '---' 
at the top of the file.

### I hate your description, just show me one.

Okay jeez

This is an example page for the Jaguar build

    ---
    name: Jaguar
    tiers:
      main: 
        tier: A
      cats:
        tier: S
    abilities:
      - name: Apex Eyes
        effect: |
          Negates all stealth bonuses.
    
      - name: Jungle Tooth
        effect: |
          Bite critical hit ignores armor.
          
      - name: Amphibious
        effect: |
          No movement or accuracy penalty in water.
    stats:
      - int: 60
      - pwr: 90
      - def: 60
      - mbl: 80
      - hp: 50
      - stl: 85
    ---
    The actual king of the jungle- even Crocodile players fear this perfect assassin.

Let's break down the less self-explanatory parts

    tiers:
      main: 
        tier: A
      cats:
        tier: S

Any build can be tiered in multiple metagames. In this example, 
the Jaguar may be the best of the best as far as cats, but compared
to the whole game including absurdly powerful builds like Humans 
and Elephants they're just *good*, y'know?

    abilities:
      - name: Apex Eyes
        effect: |
          Negates all stealth bonuses.
    
      - name: Jungle Tooth
        effect: |
          Bite critical hit ignores armor.

What's that "|" there? Well, that's called a "pipe" where I come 
from but the only thing that matters here is that it's used to 
make a YAML value span multiple lines, including the newlines in the string.

On that note, if you want to split a long description over two lines and want to
**ignore** the newlines, use a ">-"

    stats:
      - int: 60
      - pwr: 90
      - def: 60
      - mbl: 80
      - hp: 50
      - stl: 85
	  
Alright you know these. Keep in mind they go from 0 to 100.
