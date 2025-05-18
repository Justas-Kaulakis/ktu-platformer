# 2D KTU platformer žaidimas 🎮 Escape Dungeon 🎮

Escape Dungeon – tai 2D galvosūkių platformeris, sukurtas Godot varikliu. Kiekvienas lygis išbandys tavo kūrybiškumą ir reakciją. Naudodamas unikalų platformas šaudantį ginklą, turėsi pabėgti iš paslaptingo požemio, pilno kliūčių ir iššūkių.

![image](https://github.com/user-attachments/assets/2bf9f618-71e8-4040-b305-1068721b9319)

### 🧩 Žaidimo ypatybės
Šaudyk savo platformas: Ginklas leidžia šaudyti skirtingų tipų platformas, kurios padės įveikti kliūtis ir pasiekti tikslą.

🟫 Statinė platforma – numatytoji, patikima platforma.

🔻 Dinaminė platforma – nukrenta, kai užlipi.

💥 Trapi platforma – subyra po trumpo laiko.

- Ir daug kitų!

### Progresas: Spręsk galvosūkius, tiksliai laiku atlik veiksmus ir surask raktą, kad atrakintum duris ir pabėgtum iš lygio.

🗝️ Surink raktus

🚪 Atverk duris (atidarytų / uždarytų animacijos)

## Muzika

Visa muzika ir garso efektai paimti iš [epidemicsound.com](www.epidemicsound.com) viešai prieinamos bibliotekos

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
