# Sveiki atvykę į žaidimo „Dungeon Escape“ GitHub saugyklą!

![image](https://github.com/user-attachments/assets/2bf9f618-71e8-4040-b305-1068721b9319)

Įprastam vartotojui naudingos informacijos apie patį žaidimą rasite čia.

Programuotojams aktuali informacija pateikta žemiau.

## Žaidimo testavimas

Kiekvieno testo metu žaidimas paleidžiamas iš naujo. Visi tam tikro testo eksperimentai yra vykdomi tos pačios žaidimo sesijos metu.

### Pirmasis testas ###

Šio testu metu tikrinamas žaidėjo sąveika su platformų šautuvu ir jo kuriamomis platformomis.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Mygtukais *platform_1*, *platform_2*, *platform_3* išrenkama platforma | Rodoma platformos tekstūra ir pavadinimas atitinka platformą | Rodoma platformos tekstūra ir pavadinimas atitinka platformą
2 | Paspaudžiamas *preview* mygtukas | Pasirinktos platformos tekstūros „vaiduoklis“ rodomas žymeklio vietoje | Pasirinktos platformos tekstūros „vaiduoklis“ rodomas žymeklio vietoje
3 | Paspaudžiamas *shoot* mygtukas | Leistinoje vietoje (tuščioje erdvėje) sukuriama nauja platforma, o turimas kulkų skaičius sumažėja 1 | Leistinoje vietoje (tuščioje erdvėje) sukuriama nauja platforma, o turimas kulkų skaičius sumažėja 1
4 | Paspaudžiamas *reload* mygtukas | Žaidėjo turimų platformų skaičius tampa lygus ruože numatytai ribai, o prieš tai sukurtos platformos anuliuojamos | Žaidėjo turimų platformų skaičius tampa lygus ruože numatytai ribai, o prieš tai sukurtos platformos anuliuojamos
5 | Mygtukų *platform_1*, *platform_2*, *platform_3* spustelėjimas keičia sukuriamą platformą | Sukurta platforma išvaizda ir paskirtimi sutampa su tekstūros ir pavadinimo rodmenimis | Sukurta platforma išvaizda ir paskirtimi sutampa su tekstūros ir pavadinimo rodmenimis
6 | Žaidėjas sąveika su sukurta platforma | Žaidėjo ir platformos sąveikos efektai atitinka aprašymą vikyje | Žaidėjo ir platformos sąveikos efektai atitinka aprašymą vikyje

### Antrasis testas ###

Testo metu buvo tikrinamas lygio vidinių elementų veikimas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Žaidėjas miršta arba spusteli *reload* mygtuką | Atstatomos prarastos žaidėjo gyvybės | Atstatytos prarastos žaidėjo gyvybės
2 | Kontrolinis punktas – naujos prisikėlimo vietos priskyrimas | Nustatoma nauja prisikėlimo vieta mirties ar *reload* paspaudimo atvejais | Po mirties arba platformų šautuvo perkrovimo žaidėjas atsirado vėliausiai pasiekto kontrolinio punkto vietoje
3 | Kontrolinis punktas – naujų platformų ir bendro jų skaičiaus priskyrimas | Pasiekus kontrolinį punktą, žaidėjui priskiriamos naujam lygio ruožui reikalingos platformos ir numatytas jų bendras skaičius | Kiekvieno naujo ruožo kontrolinis punktas korektiškai priskyrė skirtingas platformas ir jų bendrą skaičių
4 | Kontrolinis punktas – tekstūros pasikeitimas po sąlyčio su žaidėju | Kontrolinis punktas vienintelį kartą pakeičia savo tekstūrą ir taip indikuoja, jog buvo aktyvuotas | Tik pirmą kartą pasiektas kontrolinis punktas keitė savo tekstūrą
5 | Kontrolinis punktas – žaidėjo prarastų gyvybių ir platformų šautuvo šovinių atstatymas, sukurtų platformų šalinimas | Žaidėjo sąlytis su kontroliniu punktu visais atvejais atkuria prarastas gyvybes ir turimą platformų skaičių, anuliuoja padarytą pažangą (kad nebūtų piktnaudžiaujama platformų skaičiaus atstatymu) | Sąlytis su kontroliniu punktu atkūrė nurodytus atributus ir panaikino prieš tai sukurtas platformas
6 | Žaidėjas paėmė raktą | Užfiksuotas rakto paėmimo faktas (t.y. leidžiama atidaryti lygio ruožo pabaigoje esančius vartus) | Po rakto paėmimo sąlytis su vartais juos atvėrė
7 | Raktą paėmęs žaidėjas miršta arba spusteli *reload* mygtuką | Raktas atstatomas į numatytą vietą, o užfiksuotas rakto paėmimas anuliuojamas (t.y. žaidėjas nebegali atidaryti ruožo pabaigos vartų) | Raktas atstatytas į numatytą vietą, o bandymas be jo atverti ruožo pabaigos vartus buvo nesėkmingas
8 | Vartai – praėjimo draudimas neturint rakto | Rakto neturinčiam žaidėjui vartai traktuojama kaip siena | Pastangos tiesiogiai praeiti pro vartus be rakto buvo nesėkmingos
9 | Vartai – leidimas praeiti turint raktą | Raktą turintis žaidėjas atrakina vartus, kurie nuo tos akimirkos traktuojami kaip tuščia erdvė | Pastangos tiesiogiai praeiti po vartus su raktu buvo sėkmingos
10 | Vartai – leidimas praeiti turint teisingą raktą | Žaidėjo turimo rakto spalva atitinka virš vartų esančią spalvą | Tam tikros spalvos raktas atrakino tik tos pačios spalvos vartus
11 | Vartai – tekstūros pasikeitimas po sąlyčio su raktą turinčiu žaidėju | Atrakinti vartai pakeičia savo tekstūrą ir taip indikuoja, jog buvo atrakinti | Vartų atrakinimas pakeitė jų tekstūrą
12 | Vartai – po atrakinimo žaidėjas miršta arba spusteli *reload* mygtuką | Vartai vėl užrakinami. Atitinkamai pasikeičia jų tekstūra. | Atrakinti vartai po mirties ar šautuvo perkrovimo vėl užsirakino
13 | Vartai – sąlytis su už vartų esančiu kontroliniu punktu | Vartai užrakinami | Vartai buvo užrakinti
14 | Lygio keitimo portalas – korektiškas perėjimas į kitą (t.y. kito lygio) sceną | Sąlytis su portalu keičia sceną, kurioje yra žaidėjas | Sąlyčio metu korektiškai ir sklandžiai keitėsi scena

### Trečiasis testas ###

Testo metu buvo tikrinamas spąstų bei mirties mechanizmų veikimas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Žaidėjas pasiekia S spalvos durys | Durys neatsidaro ir žaidėjas pro jas negali praeiti
2 | Žaidėjas paema S spalvos ranką | Žaidėjas turi S spalvos raktą ir gauna pranešimą, kad paėmė S spalvos raktą
3 | Žaidėjas pasieka S spalvos durys su S spalvos raktu | Durys atsidaro ir žaidėjas pro jas gali praeiti

### Ketvirtasis testas ###

Ketvirtas testas tikrina, ar lygio perėjimo sistema veikia teisingai

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Žaidėjas pasirenka 1 lygį | Žaidėjas atsiranda 1 lygyje | a
2 | Žaidėjas pasiekia 1 lygio galą | 2 lygio scena yra iš anksto užkraunama | b
3 | Žaidėjas paliečia portalą | Žaidėjas perkeliamas į 2 lygį | c

### Penktasis testas ###

Penktas testas tikrina, ar nustatymų pakeitimai veikia teisingai

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
Žignsnis 1 | Žaidėjas paspaudžia *pause* mygtuką | Atidaroma nustatymų lentelė
Žingsnis 2 | Žaidėjas pakeičia *jump* funkcijos mygtuką | Žaidėjas pašoka kada paspaudžiamas naujas *jump* mygtukas
Žingsnis 3 | Žaidėjas pakeičia garso nustatymus | Pagal naujus nustatymus garsai yra garsesni arba tylesni
Žingsnis 4 | Žaidėjas pakeičia *player* tekstūrą | *Player* tekstūra atitinka pasirinktą tekstūrą
Žingsnis 5 | Žaidėjas paspaudžia *pause* mygtuką | Uždaroma nustatymų lentelė ir pakeitimai išsaugomi
Žingsnis 6 | Žaidėjas uždaro ir vė įjungia žaidimą | Nauji nustatymai liko išsaugoti
