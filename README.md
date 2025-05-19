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
1 | Paspaudžiamas *preview* mygtukas | Pasirinktos platformos tekstūros „vaiduoklis“ rodomas žymeklio vietoje | Pasirinktos platformos tekstūros „vaiduoklis“ rodomas žymeklio vietoje
2 | Paspaudžiamas *shoot* mygtukas | Leistinoje vietoje (tuščioje erdvėje) sukuriama nauja platforma, o turimas kulkų skaičius sumažėja 1 | Leistinoje vietoje (tuščioje erdvėje) sukuriama nauja platforma, o turimas kulkų skaičius sumažėja 1
3 | Paspaudžiamas *reload* mygtukas | Žaidėjo turimų platformų skaičius tampa lygus ruože numatytai ribai, o prieš tai sukurtos platformos anuliuojamos | Žaidėjo turimų platformų skaičius tampa lygus ruože numatytai ribai, o prieš tai sukurtos platformos anuliuojamos
4 | Mygtukų *platform_1*, *platform_2*, *platform_3* spustelėjimas keičia sukuriamą platformą | Sukurta platforma išvaizda ir paskirtimi sutampa su tekstūros ir pavadinimo rodmenimis | Sukurta platforma išvaizda ir paskirtimi sutampa su tekstūros ir pavadinimo rodmenimis
5 | Žaidėjas sąveika su sukurta platforma | Žaidėjo ir platformos sąveikos efektai atitinka aprašymą vikyje | Žaidėjo ir platformos sąveikos efektai atitinka aprašymą vikyje

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
15 | Ypatingąsias galias suteikiantys objektai – korektiškas galios suteikimas | Žaidėjui suteikta ypatingoji galia po sąlyčio atitinka objektui priskirtąją vikio apraše | Sąlytis su konkrečiu objektu suteikė numatytą ypatingąją galią
16 | Ypatingąsias galias suteikiantys objektai – suteiktos galios laikinumas | Žaidėjui suteikta ypatingoji galia po tam tikro numatyto laiko atimama | Galios trukmė atitiko numatytąjį laiką
17 | Ypatingąsias galias suteikiantys objektai – sąlytis su žaidėju | Sąlyčio metu objektas pašalinamas iš lygio | Sąlyčio metu objektas pašalintas iš lygio
18 | Ypatingąsias galias suteikiantys objektai – atstatymas mirties ar *reload* spustelėjimo atvejais | Mirus ar perkrovus platformų šautuvą objektai atkuriami lygio plane numatytose pozicijose | Po mirties ar šautuvo perkrovimo objektai atstatyti numatytose pozicijose

### Trečiasis testas ###

Testo metu buvo tikrinamas spąstų bei mirties mechanizmo veikimas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Žaidėjo gyvybių skaičius sumažinamas iki 0 | Žaidėjas miršta (t.y. prisikelia paskutiniame aplankytame kontroliname punkte) | Žaidėjas mirė ir prisikėlė numatytoje vietoje
2 | Turimų ypatingųjų galių šalinimas mirties atveju | Po mirties (arba šautuvo perkrovimo) žaidėjui atimama prieš tai turima ypatingoji galia | Nurodytomis sąlygomis žaidėjas neteko turimos ypatingosios galios
2 | Spygliai – sąlytis su žaidėju | Žaidėjui daroma žala atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą
3 | Nuodingasis raugmedis – sąlytis su žaidėju | Žaidėjui daroma žala atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą
4 | Nuodingasis raugmedis – nuodų veikimas | Sąlyčio su spąstu nebeturįs žaidėjas dar tam tikrą laiką būna „apnuodytas“ ir toliau vikio aprašyme nurodytą laiką yra žalojamas | Sąlyčio nutraukimas dar tam tikrą laiką žalojo žaidėją
5 | Nuodingasis raugmedis – mirtis arba *reload* spustelėjimas | Žaidėjo „apnuodijimas“ gali būti iš anksto nutraukiamas numatytomis sąlygomis | Minėtomis sąlygomis „apnuodijimas“ nutrauktas
6 | Amžinoji ugnis – sąlytis su žaidėju | Žaidėjui daroma žala ir jos laipsninis didėjimas atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą. Užfiksuotas akivaizdus ilgainiui daromos žalos intensyvėjimas.
7 | „Vietnamo“ spąstai – sąlytis su žaidėju | Sąlyčio metu kamufliažo pakeitusio kito spąsto daroma žala atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą
8 | „Vietnamo“ spąstai – spąsto pasikeitimas | Vietoje originalaus spąsto toje pačioje vietoje atsiranda naujas | Vietoje originalaus spąsto toje pačioje vietoje atsirado naujas
9 | Lava lašantys vamzdžiai – sąlytis su žaidėju | Sąlyčio su lašančia iš vamzdžio lava metu žaidėjui daroma žala atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą
10 | Ugnies kolona – sąlytis su žaidėju | Žaidėjui daroma žala atitinka vikio aprašymą | Žaidėjui daroma žala atitiko vikio aprašymą

### Ketvirtasis testas ###

Testo metu buvo tikrinamas vartotojo sąsajos rodmenų žaidimo metu korektiškumas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Žaidėjas atsiranda pasirinktame lygyje | Lygio informacijos skiltis korektiškai rodo lygio pavadinimą | Lygio informacijos skilties rodmenys atitiko pasirinktą lygį
2 | Lygiuose, kur tai yra nustatyta, žaidėjas mato valdymo instrukcijas | Valdymo instrukcijos atsiranda numatytuose lygiuose | Valdymo instrukcijos matomos tik numatytuose lygiuose.
3 | Valdymo instrukcijų pašalinimas iš ekrano | Paspaudus prie instrukcijos nurodytą klavišą, instrukcija pašalinama | Visos išvardintos instrukcijos po atitinkamų mygtukų paspaudimo pašalintos
4 | Valdymo instrukcijose nurodytų klavišų ir nustatymų meniu pakeitimų sąveika | Nustatymų meniu pakeisti instrukcijose nurodytų funkcijų klavišai gyvai yra atnaujinami ir instrukcijose | Klavišų pakeitimas nustatymuose atsispindėjo ir instrukcijose
5 | Platformų skaičiaus rodmenys atitinka kontrolinio punkto numatytas reikšmes | Rodomas maksimalus platformų skaičius yra lygus paskiausio kontrolio punkto numatytajai reikšmei | Kontrolinio punkto numatyta reikšmė ir platformų skaičiaus rodmenys sutapo
6 | Tam tikru metu esamas platformų skaičus (kairėje pasvirojo brūkšnio pusėje esanti reikšmė) reaguoja į platformų sukūrimą | Sukūrus platformą, esamas platformų skaičius sumažėja 1 | Sukūrus platformą, esamas platformų skaičius sumažėjo 1
7 | Esamo platformų skaičiaus atstatymas mirties ar šautuvo perkrovimo atvejais | Rodomas platformų skaičius išvardintais atvejais tampa lygus kontrolinio punkto numatytai reikšmei | Išvardintais atvejais rodomo platformų skaičiaus reikšmės sutapo su kontrolinio punkto numatytomis
8 | Platformos išrinkimas mygtukais *platform_1*, *platform_2*, *platform_3* išrenkama platforma | Rodoma platformos tekstūra ir pavadinimas atitinka platformos aprašymą vikyje | Rodoma platformos tekstūra ir pavadinimas atitiko platformos aprašymą vikyje
9 | Mygtukų *platform_1*, *platform_2*, *platform_3* spustelėjimas prie pasirinktos platformos pavadinimo teisingai rodo indeksą | Pasirinkus 1 platformą mygtuku *platform_1* 2 *platform_2* ir 3 *platform_3*, atitinkamai buvo atnaujintas prie platformos pavadinimo esanti indekso reikšmė | Indekso reikšmių kitimas atitiko pasirinktas platformas
10 | Platformos posūkio kampas kitimas spustelėjus *rotate* | Platformoms, kurioms tai galioja, rodomas posūkio kampas atitinka *preview* mygtuko rodmenis bei vikio aprašymą | Rodomas posūkio kampas buvo korektiškas abiem atvejais
11 | Rakto paėmimo faktas užfiksuotas apatinėje kairėje ekrano pusėje esančioje skiltyje | Po rakto paėmimo žaidėjui rodoma, jog jis turi tam tikros spalvos raktą | Paėmus mėlynos spalvos raktą, buvo matomas mėlynos spalvos rakto turėjimo pranešimas.
12 | Apie rakto paėmimą informuojantis pranešimas dingimas mirus, perkrovus šautuvą ar atrakinus vartus | Rakto paėmimo pranešimas dingsta nurodytomis sąlygomis | Nurodytomis sąlygomis rakto pranešimas dingo
13 | Sąlytis su ypatingųjų galių objektu apatinėje dešinėje ekrano pusėje sukuria atitinkamą pranešimą | Žaidėjui rodoma, jog jis tam tikrą laiką turi nurodytą galią | Po sąlyčio atsirado pranešimas su korektiškais laiko ir galios duomenimis.
14 | Ypatingosios galios galiojimo laiku pranešimas nuolat atnaujinamas naujausiais likučio duomenimis | Žaidėjui kas 0.1s rodoma naujausias galios galiojimo laikas | Nurodytais intervalais keitėsi galiojimo laiko rodmuo
15| Ypatingosios galios galiojimo pranešimas dingsta prieš galiojimo laiko baigimą tam tikrais atvejais | Žaidėjui mirus arba perkrovus šautuvą, ypatingosios galios galiojimo pranešimas dingsta iš anksto | Nurodytomis sąlygomis užfiksuotas pranešimo dingimas

### Penktasis testas ###

Testo metu buvo tikrinamas nustatymų meniu veikimas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Būdamas žaidime, žaidėjas paspaudžia *Pause game and open settings* klavišą | Atsidaro nustatymų meniu | Atidarytas nustatymų meniu
2 | Tiek žaidime, tiek tituliniame ekrane esantį meniu žaidėjas gali uždaryti *Pause game and open settings klavišu* | Meniu uždaromas paspaudus nurodytą klavišą | Abiem atvejais meniu užvertas
3 | Žaidimo metu atvertas nustatymų meniu stabdo žaidimo veiksmą | Žaidėjas negali judėti, gauti žalos, būti paveikiamas traukos jėgų, kurti naujų platformų ir pan. | Pastebėtas žaidimo veiksmo sustabdymas
4 | Atidarius meniu tituliname ekrane, žaidėjui draudžiama spausti bet kurį kitą ekrane matomą mygtuką | Būdamas nustatymų meniu žaidėjas negali, pavyzdžiui, spausti mygtuko *Play* | Pašalinių mygtukų spaudimas draudžiamas
5 | Tiek žaidime, tiek tituliname ekrane esantį meniu žaidėjas gali uždaryti spausdamas meniu viršuje esantį mygtuką "Back to main menu" ir grįžti į titulinį ekraną | Nurodytomis sąlygomis grįžtama į titulinį ekraną | Abiem atvejais įvykdytas tas pats veiksmas
6 | Žaidėjas gali keisti valdymo nustatymus | Paspaudęs ant atitinkamos funkcijos mygtuko ir įvedęs klavišą arba spustelėjęs pelės mygtuku, žaidėjas gali pakeisti funkciją įvykdantį klavišą/mygtuką | Sėkmingai pakeistas mygtukas/klavišas
7 | Žaidėjo keisti valdymo nustatymai matomi žaidime arba meniu manipuliacijose iš karto | Pakeitus, pavyzdžiui, *Pause game and open settings* iš *Escape* į *I*, nauju meniu uždarymo mygtuku tampa *I* | Padaryti pokyčiai iš karto matyti žaidime arba meniu manipuliacijose
8 | Žaidėjas gali atkurti numatytąsias valdymo nustatymų reikšmes | Numatytosios reikšmės visoms parinktims atstatomos paspaudus valdymo nustatymų skyriaus *Set defaults* mygtuką | Numatytosios parinktys atstatytos
9 | Žaidėjas gali keisti garso nustatatymus | Į norimą vietą nutempęs tam tikro garso takelio slankiklį, žaidėjas gali pakeisti takelio garsumą | Pakeistas takelio garsumas
10 | Žaidėjo keisti garso nustatymai matomi iš karto | Pakeitus, pavyzdžiui, *master* (bendrojo garso) takelio garsumą, pokytis girdimas iš karto | Pokytis buvo išgirstas
11 | Žaidėjas gali atkurti numatytąsias garso takelių garsumo reikšmes | Numatytosios reikšmės visiems garso takeliams atstatomos paspaudus garso nustatymų skyriaus *Set defaults* mygtuką | Numatytosios parinktys atstatytos
12 | Žaidėjas gali įjungti/išjungti viso ekrano rėžimą | Pažymėta *fullscreen* parinktis įjungia viso ekrano rėžimą (atžymėta – išjungia) | Perjungimas užfiksuotas
13 | Viso ekrano rėžimas įjungiamas iš karto | Parinkties pokyčiai įsigalioja netrukus po pakeitimo | Pakeitimų įsigaliojimas užfiksuotas
14 | Žaidėjas gali keisti veikėjo lytį pasirinkdamas vieną iš parinkčių | Galima keisti veikėjo lytį iš *male* į *female* ir atvirkščiai | Pakeitimas užfiksuotas
15 | Veikėjo lyties pokytis matomas iš karto | Veikėjo tekstūra ir garso efektai pereina iš *male* parinkčių į *female* ir atvirkščiai | Pakeitimas užfiksuotas

### Šeštasis testas ###

Testo metu buvo tikrinamas titulinio ekrano mygtukų ir jų atidaromų meniu veikimas.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Mygtuko *Play* veikimas | Atidaromas lygių pasirinkimo meniu | Atidarytas lygių pasirinkimo meniu
2 | Mygtuko *Options* veikimas | Atidaromas nustatymų meniu | Atidarytas nustatymų meniu
3 | Mygtuko *Quit* veikimas | Žaidimas uždaromas | Žaidimas uždarytas
4 | Mygtuko *Credits* veikimas | Atidaroma speciali scena, dėkojanti žaidėjams už žaidimo išbandymą ir išvardijanti jo kūrėjus | Scenos atidarymas ir jos turinio atitikimas užfiksuotas
5 | Lygių pasirinkimo meniu – parinktis "Back to main menu" | Žaidėjas grąžinamas į titulinį ekraną | Žaidėjas grąžintas į titulinį ekraną
6 | Lygių pasirinkimo meniu – vieno iš išvardintų lygių pasirinkimas | Žaidėjas perkeliamas į norimą lygį | Žaidėjas perkeltas į norimą lygį
7 | Lygių pasirinkimo meniu – *Pause game and open settings* klavišas | Žaidėjas taipogi grąžinamas į titulinį ekraną | Žaidėjas grąžintas į titulinį ekraną
8 | Titrų scena – parinktis "Back to menu" | Žaidėjas grąžinamas į titulinį ekraną | Žaidėjas grąžintas į titulinį ekraną

### Septintasis testas ###

Testo metu buvo tikrinami žaidimo gebėjimai rašyti į failą bei iš jo skaityti.

Eksperimento nr. | Aprašymas | Teorinis rezultatas | Praktinis rezultatas
--- | --- | --- | ---
1 | Nustatymų failo *settings.ini* kūrimas | Pirmąkart leidžiant žaidimą sugeneruojamas nustatymų failas su numatytomis parinktimis | Nustatymų failas su numatytomis parinktis buvo sugeneruotas
2 | Nustatymų meniu ir nustatymų failo turinių atitikimas | Keičiant nustatymų failo turinį, keičiasi ir nustatymo meniu turinys (ir atvirkščiai) | Užfiksuotas turinio kitimas abiem atvejais
3 | Tam tikrų nustatymų failo parinkčių eilučių ištrynimas | Žaidimas aptiks trūkstamas eilutes ir jas iš naujo sukurs | Žaidimas ištrintas eilutes aptiko ir sukūrė iš naujo
