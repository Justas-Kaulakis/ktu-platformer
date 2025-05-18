# 2D KTU platformer žaidimas

Dabar sukūriau Godot 2d Platformer šabloną. Galima apsidairyt ir pamatysit kaip kas atrodo.

# 2D Platformer

This demo is a pixel art 2D platformer with graphics and sound.

It shows you how to code characters and physics-based objects
in a real game context. This is a relatively complete demo
where the player can jump, walk on slopes, fire bullets,
interact with enemies, and more. It contains one closed
level, and the player is invincible, unlike the enemies.

You will find most of the demo’s content in the `level.tscn` scene.
You can open it from the default `game.tscn` scene, or double
click on `level.tscn` in the `src/level/` directory.

We invite you to open the demo's GDScript files in the editor as
they contain a lot of comments that explain how each class works.

Language: GDScript

Renderer: Compatibility

Check out this demo on the asset library: https://godotengine.org/asset-library/asset/120

## Features

- Side-scrolling player controller using [`KinematicBody2D`](https://docs.godotengine.org/en/latest/classes/class_kinematicbody2d.html).
	- Can walk on and snap to slopes.
	- Can shoot, including while jumping.
- Enemies that crawl on the floor and change direction when they encounter an obstacle.
- Camera that stays within the level’s bounds.
- Supports keyboard and gamepad controls.
- Platforms that can move in any direction.
- Gun that shoots bullets with rigid body (natural) physics.
- Collectible coins.
- Pause and pause menu.
- Pixel art visuals.
- Sound effects and music.

## Screenshots

![2D Platformer](screenshots/platformer.webp)

## Music

[*Pompy*](https://soundcloud.com/madbr/pompy) by Hubert Lamontagne (madbr)

## Testavimas

Kiekvieno testo metu žaidimas paleidžiamas iš naujo.

Pirmas testas tikrina, ar žaidėjas gali padėti ir sąveikauti su padėta platforma.  
Žingsnio nr | Aprašymas | Tikėtinas rezultatas 
--- | --- | ---
Žignsnis 1 | Pasirenkama dingstanti platforma | Platformos peržiūros textūra tampa dingstančios platformos textūra
Žingsnis 2 | Paspaudžiamas *preview* mygtukas | Dingstančios platformos textūra atsiranda žymeklio pozicijoje
Žingsnis 3 | Paspaudžiamas *shoot* mygtukas ant leistinos vietos | Dingstanti platforma atsiranda žymeklio pozicijoje ir ten pasilieka
Žingsnis 4 | Žaidėjas pasiekia padėtą platformą | Žaidėjas susiduria su platforma
Žingsnis 5 | Praeina 1,5 sekundės | Dingsta padėta dingstanti platforma 

Antras testas tikrina, ar perkrovimo funkcija veikia teisingai 
Žingsnio nr | Aprašymas | Tikėtinas rezultatas 
--- | --- | ---
Žignsnis 1 | Žaidėjas pasiekia kontrolinį punktą | Nauja atsikėlimo pozicija tampa pasiekto kontrolinio punkto pozicija
Žingsnis 2 | Padedama platforma | Išnaudotų platformų skaičius tampa 1
Žingsnis 3 | Žaidėjas paliečia spąstą | Žaidėjo gyvybės taškai sumažėja
Žingsnis 4 | Žaidėjas paspaudžia *reload* mygtuką | Žaidėjas atsiranda atsikėlimo pozicijoje, išnaudotų platformų skaičius tampa 0, atstatomi gyvybės taškai

Trečias testas tikrina, ar durys veikia teisingai
Žingsnio nr | Aprašymas | Tikėtinas rezultatas 
--- | --- | ---
Žignsnis 1 | Žaidėjas pasiekia S spalvos durys | Durys neatsidaro ir žaidėjas pro jas negali praeiti
Žingsnis 2 | Žaidėjas paema S spalvos ranką | Žaidėjas turi S spalvos raktą ir gauna pranešimą, kad paėmė S spalvos raktą
Žingsnis 3 | Žaidėjas pasieka S spalvos durys su S spalvos raktu | Durys atsidaro ir žaidėjas pro jas gali praeiti

Ketvirtas testas tikrina, ar lygio perėjimo sistema veikia teisingai 
Žingsnio nr | Aprašymas | Tikėtinas rezultatas 
--- | --- | ---
Žignsnis 1 | Žaidėjas pasirenka 1 lygį | Žaidėjas atsiranda 1 lygyje
Žingsnis 2 | Žaidėjas pasiekia 1 lygio galą | 2 lygio scena yra iš anksto užkraunama
Žingsnis 3 | Žaidėjas paliečia portalą | Žaidėjas perkeliamas į 2 lygį

Penktas testas tikrina, ar nustatymų pakeitimai veikia teisingai
Žingsnio nr | Aprašymas | Tikėtinas rezultatas 
--- | --- | ---
Žignsnis 1 | Žaidėjas paspaudžia *pause* mygtuką | Atidaroma nustatymų lentelė
Žingsnis 2 | Žaidėjas pakeičia *jump* funkcijos mygtuką | Žaidėjas pašoka kada paspaudžiamas naujas *jump* mygtukas
Žingsnis 3 | Žaidėjas pakeičia garso nustatymus | Pagal naujus nustatymus garsai yra garsesni arba tylesni
Žingsnis 4 | Žaidėjas pakeičia *player* tekstūrą | *Player* tekstūra atitinka pasirinktą tekstūrą
Žingsnis 5 | Žaidėjas paspaudžia *pause* mygtuką | Uždaroma nustatymų lentelė ir pakeitimai išsaugomi
Žingsnis 6 | Žaidėjas uždaro ir vė įjungia žaidimą | Nauji nustatymai liko išsaugoti
