# Requirements Document:

### Scopul Proiectului

Acest proiect își propune să creeze o aplicație mobilă menită să ofere utilizatorilor o modalitate personalizată de a descoperi oportunități de carieră potrivite, facilitând o mai bună aliniere între interesele personale și cerințele locurilor de muncă disponibile. Aplicația va folosi teste de personalitate și interese care să identifice punctele forte, aptitudinile și preferințele fiecărui utilizator, recomandând astfel poziții profesionale și domenii de activitate ce li se potrivesc.
Prin această abordare, proiectul urmărește să contribuie la dezvoltarea personală și profesională a utilizatorilor, oferindu-le un suport bazat pe auto-cunoaștere și orientare în carieră.
Aplicația va transforma procesul tradițional de căutare a unui loc de muncă într-o experiență mai personalizată și intuitivă, sprijinindu-i pe cei care vor să găsească nu doar o simplă angajare, ci o carieră care să le aducă satisfacție și împlinire pe termen lung.

### Beneficii pentru Utilizatori și Societate
Personalizare și Relevanță: Utilizatorii obțin recomandări de job-uri care reflectă personalitatea și interesele lor, ceea ce le crește șansele de a găsi o carieră care să le ofere satisfacție.
Reducerea Stresului în Căutarea unui Loc de Muncă: Procesul de găsire a unui job poate fi stresant și confuz, mai ales pentru cei aflați la început de drum. Aplicația simplifică acest proces prin recomandări directe și personalizate, scurtând durata de căutare și efortul necesar.
Îmbunătățirea Potrivirii între Angajați și Angajatori: Recomandând locuri de muncă bazate pe un profil detaliat al personalității și dorințelor utilizatorului, aplicația contribuie la o mai bună potrivire între nevoile angajatorilor și abilitățile sau interesele candidaților.
Autocunoaștere și Dezvoltare Personală: Aplicația nu doar că oferă job-uri, dar încurajează utilizatorii să se cunoască mai bine și să exploreze cum preferințele lor de carieră evoluează în timp. Acest lucru poate duce la o carieră mai bine adaptată și la o satisfacție pe termen lung.

### Obiectivele Proiectului
Utilizatorii să aibă acces la teste de personalitate și de interese profesionale, care să le ofere o imagine clară asupra propriilor puncte forte și preferințe de carieră.
Utilizatorii să primească recomandări de job-uri personalizate pe baza unui profil obținut în urma testelor de personalitate și preferințe profesionale
Aplicația să respecte toate normele GDPR și să ofere un mediu sigur pentru colectarea, stocarea și utilizarea datelor personale
Aplicația să genereze un CV pe baza profilului utilizatorului
Utilizatorii să poată vizualiza rezultatele testelor de personalitate într-un format simplu și informativ
Adminii să aibă acces la rapoarte despre recenziile oferite de utilizatori privind satisfacția recomandărilor de job-uri făcute

# Use Case Diagram
![image]([https://drive.google.com/drive/u/0/folders/1kPcQPdSxHoKuWAF2GODNjC55BMY5LLde](https://github.com/DutuMaria/FindMyPath/blob/main/use_case_diagram.png))

# User Stories
## User stories inițiale

1. User Story 1
   - Ca utilizator, vreau să pot crea un cont astfel încât să pot accesa datele profilului și istoricul rezultatelor testului de carieră.
2. User Story 2
   - Ca utilizator autentificat, vreau să pot modifica informațiile din profilul meu, astfel încât datele să rămână actuale.
3. User Story 3
   - Ca utilizator, vreau să am posibilitatea de a-mi șterge contul și toate datele asociate profilului astfel încât să îmi pot retrage informațiile din platformă.
4. User Story 4
   - Ca utilizator, vreau să pot vizualiza informații despre test înainte de începere, astfel încât să știu cum funcționează.
5. User Story 5
   - Ca utilizator autentificat, vreau să pot accesa și completa testul de carieră astfel încât să pot primi recomandări personalizate de job-uri.
6. User Story 6
   - Ca utilizator, vreau să pot sări peste anumite întrebări, astfel încât să nu fiu forțat să răspund la întrebări care nu mi se potrivesc sau care mă incomodează.
7. User Story 7
   - Ca utilizator care a primit recomandări de carieră, vreau să pot vizualiza opțiunile grupate în funcție de nivelul de compatibilitate, pentru a înțelege clar ce joburi sunt mai potrivite nevoilor mele
8. User Story 8
   - Ca utilizator, vreau să pot vedea informații detaliate despre fiecare carieră recomandată, pentru a înțelege mai bine ce presupune fiecare opțiune.
9. User Story 9
   - Ca utilizator, vreau să pot salva rezultatele testului, astfel încât să le pot consulta mai târziu.
10. User Story 10
   - Ca utilizator care a primit recomandări de carieră, vreau să pot da o nota de la 1 la 5 atât rezultatului generat de test, cât și experienței avute pe parcursul testului, astfel încât să se poată urmări nivelul de satisfacție al serviciilor oferite.
11. User Story 11
   - Ca utilizator, vreau să mă pot autentifica în contul meu, astfel încât să reiau testul dacă doresc.
12. User Story 12
   - Ca utilizator care și-a completat profilul personal, vreau să am posibilitatea de a genera un CV pe baza acestor informații pentru a avea un document gata de utilizat.
13. User Story 13
   - Ca utilizator care a finalizat testul vreau să am opțiunea de a adăuga informații noi despre mine (aptitudini) la profil obținute pe parcursul testului, astfel încât să am datele actualizate.
14. User Story 14
   - Ca administrator, vreau să am acces la rapoarte despre recenziile oferite de utilizatori astfel încât să pot urmări satisfacția recomandărilor de job-uri făcute.
15. User Story 15
   - Ca administrator, vreau să pot actualiza conținutul testelor (întrebări, opțiuni de răspuns, descrieri) astfel încât aplicația să rămână relevantă și atractivă pentru utilizatori.


## Rafinare user stories
### User Story 6
- **Original**: „Ca utilizator, vreau să pot sări peste anumite întrebări, astfel încât să nu fiu forțat să răspund la întrebări care nu mi se potrivesc sau care mă incomodează.”
- **Problemă**: Nu este complet testabilă; expresia „întrebări care nu mi se potrivesc” este vagă și poate induce ambiguitate asupra scopului funcționalității.
- **Rafinat**: „Ca utilizator, vreau să pot sări peste întrebările incomode sau opționale din test, astfel încât să completez doar răspunsurile care mă reprezintă.”
- **Justificare**: Versiunea clarificată specifică că întrebările vor fi fie marcate ca „opționale”, fie definite ca „incomode”, făcând user story-ul mai testabil și estimabil.

### User Story 7
- **Original**: „Ca utilizator care a primit recomandari de cariera, vreau sa pot vizualiza optiunile grupate in functie de nivelul de compatibilitate, pentru a intelege clar ce joburi sunt mai potrivite nevoilor mele.”
- **Problemă**: Nu este suficient de mică; gruparea opțiunilor în funcție de compatibilitate poate implica mai multe niveluri de detaliu și complexitate.
- **Rafinat**: „Ca utilizator, vreau să văd recomandările de cariere împărțite în 3 niveluri de compatibilitate (înalt, mediu, scăzut), pentru a înțelege ce opțiuni sunt mai potrivite pentru mine.”
- **Justificare**: Adăugarea a trei niveluri face funcționalitatea mai mică, estimabilă și testabilă, oferind un mod clar de grupare.


### User Story 10
- **Original**: „Ca utilizator care a primit recomandări de carieră, vreau să pot da o notă de la 1 la 5 atât rezultatului generat de test, cât și experienței avute pe parcursul testului, astfel încât să se poată urmări nivelul de satisfacție al serviciilor oferite.”
- **Problemă**: Este prea mare și nu este complet independentă; implică evaluarea a două aspecte separate (rezultatul testului și experiența testului), ceea ce poate îngreuna testarea și implementarea.
- **Rafinat**:
    - „Ca utilizator, vreau să dau o notă de la 1 la 5 rezultatului testului, pentru a reflecta cât de mult se potrivesc recomandările cu așteptările mele.”
    - „Ca utilizator, vreau să dau o notă de la 1 la 5 experienței de completare a testului, pentru a exprima satisfacția mea față de proces.”
- **Justificare**: Împărțirea în două user stories le face independente, mai mici, și testabile separat.

### User Story 12
- **Original**: „Ca utilizator care și-a completat profilul personal, vreau să am posibilitatea de a genera un CV pe baza acestor informații pentru a avea un document gata de utilizat.”
- **Problemă**: Nu este suficient de estimabilă și mică; generarea unui CV poate implica un număr mare de variabile și informații.
- **Rafinat**: „Ca utilizator cu profil complet, vreau să genereze automat un CV simplificat cu informațiile de bază (nume, educație, experiență) pentru a avea un document util.”
- **Justificare**: Specificarea câmpurilor de bază face user story-ul mic, estimabil, și testabil prin generarea unui CV cu structura definită.


### User Story 13
- **Original**: „Ca utilizator care a finalizat testul vreau să am opțiunea de a adăuga informații noi despre mine (aptitudini) la profil obținute pe parcursul testului, astfel încât să am datele actualizate.”
- **Probleme**:
    - Nu este complet independentă; depinde de finalizarea testului, ceea ce poate crea o legătură cu alte funcționalități și poate afecta testabilitatea.
    - Formularea „opțiunea de a adăuga informații noi” poate fi interpretată în mai multe feluri, făcând-o mai greu de estimat și implementat.
- **Rafinat**: „Ca utilizator, vreau să pot adăuga aptitudinile nou descoperite în profilul meu după finalizarea testului, pentru a-mi păstra datele actualizate.”
- **Justificare**:
    - Independentă: Aceasta clarifică faptul că acțiunea de a adăuga aptitudini este o opțiune disponibilă imediat după test, dar nu depinde de el în mod strict, ceea ce o face mai flexibilă și independentă.
    - Mică și Estimabilă: Prin clarificarea că e vorba de aptitudinile descoperite, se simplifică implementarea și estimarea.
    - Testabilă: Actualizarea aptitudinilor poate fi verificată prin modificarea profilului, oferind o bază clară pentru testare.


## User stories rafinate

1. User Story 1
    - Ca utilizator, vreau să pot crea un cont astfel încât să pot accesa datele profilului și istoricul rezultatelor testului de carieră.
2. User Story 2
    - Ca utilizator autentificat, vreau să pot modifica informațiile din profilul meu, astfel încât datele să rămână actuale.
3. User Story 3
    - Ca utilizator, vreau să am posibilitatea de a-mi șterge contul și toate datele asociate profilului astfel încât să îmi pot retrage informațiile din platforma.
4. User Story 4
    - Ca utilizator, vreau să pot vizualiza informații despre test înainte de începere, astfel încât să știu cum funcționează.
5. User Story 5
    - Ca utilizator autentificat, vreau să pot accesa și completa testul de carieră astfel încât să pot primi recomandări personalizate de job-uri.
6. User Story 6
    - Ca utilizator, vreau să pot sări peste întrebările incomode sau opționale din test, astfel încât să completez doar răspunsurile care mă reprezintă.
7. User Story 7
    - Ca utilizator, vreau să văd recomandările de cariere împărțite în 3 niveluri de compatibilitate (înalt, mediu, scăzut), pentru a înțelege ce opțiuni sunt mai potrivite pentru mine.
8. User Story 8
    - Ca utilizator, vreau să pot vedea informații detaliate despre fiecare carieră recomandată, pentru a înțelege mai bine ce presupune fiecare opțiune.
9. User Story 9
    - Ca utilizator, vreau să pot salva rezultatele testului, astfel încât să le pot consulta mai târziu.
10. User Story 10
    - Ca utilizator, vreau să dau o notă de la 1 la 5 rezultatului testului, pentru a reflecta cât de mult se potrivesc recomandările cu așteptările mele.
11. User Story 11
    - Ca utilizator, vreau să dau o notă de la 1 la 5 experienței de completare a testului, pentru a exprima satisfacția mea față de proces.
12. User Story 12
    - Ca utilizator, vreau să mă pot autentifica în contul meu, astfel încât să reiau testul dacă doresc.
13. User Story 13
    - Ca utilizator cu profil complet, vreau să genereze automat un CV simplificat cu informațiile de bază pentru a avea un document util.
14. User Story 14
    - Ca utilizator, vreau să pot adăuga aptitudinile nou descoperite în profilul meu după finalizarea testului, pentru a-mi păstra datele actualizate.
15. User Story 15
    - Ca administrator, vreau să am acces la rapoarte despre recenziile oferite de utilizatori astfel încât să pot urmări satisfacția recomandărilor de job-uri făcute.
16. User Story 16
    - Ca administrator, vreau să pot actualiza conținutul testelor (întrebări, opțiuni de răspuns, descrieri) astfel încât aplicația să rămână relevantă și atractivă pentru utilizatori.


## User stories prioritizate și estimate

### User Story 1
Crearea contului + vizualizare date profil și istoricul testelor
- **Prioritate**: Ridicată
- **Justificare**: Crearea unui cont este fundamentală pentru a permite accesul la profil și istoric. Fără aceasta, utilizatorii nu pot utiliza majoritatea funcțiilor aplicației.
- **Estimare**: 8
- **Justificare**: Necesită 3 ecrane pentru formularul de înregistrare + profil + istoric, conexiune cu backendul pentru salvarea profilului.
  
### User Story 2
Modificarea informațiilor din profil.
- **Prioritate**: Medie
- **Justificare**: Posibilitatea de a edita profilul asigură actualitatea datelor, însă nu este vitală în faza inițială de utilizare.
- **Estimare**: 3
- **Justificare**: Frontend simplu pentru editarea datelor de profil și backend pentru actualizarea acestora. Este o funcționalitate directă, ușor de integrat.

### User Story 3
Ștergerea contului și a datelor asociate.
- **Prioritate**: Ridicată
- **Justificare**: Respectă dreptul la protecția datelor și oferă utilizatorilor control asupra informațiilor lor, fiind o caracteristică crucială pentru conformitatea GDPR
- **Estimare**: 3
- **Justificare**: Necesită siguranța ștergerii tuturor datelor asociate profilului și istoricului, implicând backendul și baza de date.

### User Story 4
Vizualizarea informațiilor despre test înainte de începere.
- **Prioritate**: Medie
- **Justificare**: Ajută utilizatorii să se familiarizeze cu structura testului, crescând astfel încrederea în aplicație, dar nu este absolut necesară pentru utilizarea acesteia.
- **Estimare**: 2
- **Justificare**: Afișarea de informații statice este simplu de implementat și necesită doar frontend și acces minim la backend pentru afișarea textului explicativ.

### User Story 5
Accesarea și completarea testului de carieră.
- **Prioritate**: Ridicată
- **Justificare**: Completarea testului de carieră este scopul principal al aplicației
- **Estimare**: 5
- **Justificare**: Implică afișarea și gestionarea unui set de întrebări, colectarea răspunsurilor și gestionarea fluxului testului, necesită integrarea algoritmului de decizie.

### User Story 6
Săritul peste întrebări incomode/opționale.
- **Prioritate**: Scăzută
- **Justificare**: Deși oferă flexibilitate și confort utilizatorilor, nu este esențială pentru funcționarea de bază a aplicației.
- **Estimare**: 3
- **Justificare**: Necesită o structură dinamică de test pentru a sări peste întrebări pe baza preferințelor și opțiuni de actualizare a datelor pentru a reflecta schimbările.

### User Story 7: Vizualizarea recomandărilor de cariere în 3 niveluri de compatibilitate.
- **Prioritate**: Medie
- **Justificare**: Organizarea recomandărilor ajută utilizatorii să înțeleagă mai bine opțiunile, însă poate fi implementată și într-o etapă ulterioară.
- **Estimare**: 13
- **Justificare**: Necesită funcționalitatea de calcul pentru clasificarea compatibilității (în C) și frontend pentru afișarea diferitelor niveluri de compatibilitate.
  
### User Story 8: Vizualizarea detaliată a carierelor recomandate.
- **Prioritate**: Ridicată
- **Justificare**: Oferirea de detalii asupra fiecărei cariere recomandate adaugă valoare experienței utilizatorului și este o funcție utilă pentru a sprijini deciziile de carieră.
- **Estimare**: 3
- **Justificare**: Este mai simplă, implicând doar afișarea informațiilor statice despre cariere pe baza datelor preexistente.

### User Story 9
Salvarea rezultatelor testului.
- **Prioritate**: Ridicată
- **Justificare**: Permite consultarea ulterioară a rezultatelor și îmbunătățește experiența utilizatorului în cazul reluării testului.
- **Estimare**: 3
- **Justificare**: Necesită backend pentru stocarea și accesul la istoricul testelor, dar este o operație standard de salvare și recuperare a datelor.

### User Story 10
Acordarea unei note de la 1 la 5 pentru rezultatul testului.
- **Prioritate**: Medie
- **Justificare**: Ajută la înțelegerea gradului de satisfacție al utilizatorului față de recomandări, fiind o funcție utilă, dar nu esențială.
- **Estimare**: 2
- **Justificare**: O funcționalitate simplă de captare și salvare a unui scor, ușor de implementat în backend.

### User Story 11
Acordarea unei note pentru experiența de completare a testului.
- **Prioritate**: Scăzută
- **Justificare**: Deși oferă feedback asupra experienței utilizatorului, impactul asupra funcționalității aplicației este redus.
- **Estimare**: 2
- **Justificare**: Similar cu user story-ul anterior, implicând doar captarea unei note și salvarea acesteia.

### User Story 12
Autentificare și reluarea testului.
- **Prioritate**: Ridicată
- **Justificare**: Autentificarea este esențială pentru accesul la profil și pentru reluarea testului, fiind o funcție necesară pentru protecția datelor utilizatorilor.
- **Estimare**: 3
- **Justificare**: Autentificarea este o funcționalitate standard, dar stocarea progresului testului pentru reluare necesită integrare suplimentară.

### User Story 13
Generarea automată a unui CV simplificat.
- **Prioritate**: Scăzută
- **Justificare**: Funcție suplimentară care adaugă valoare, dar nu este esențială pentru funcționarea de bază a aplicației.
- **Estimare**: 8
- **Justificare**: Generarea CV-ului implică preluarea informațiilor din profil și formatarea acestora într-un document (ex. PDF), ceea ce necesită mai multe etape de procesare a datelor.

### User Story 14: Adăugarea aptitudinilor descoperite în profil.
- **Prioritate**: Scăzută
- **Justificare**: Permite actualizarea profilului în funcție de descoperirile din test, fiind o funcție utilă pentru utilizatori, dar nu esențială.
- **Estimare**: 5
- **Justificare**: Integrarea cu testul pentru a adăuga aptitudinile rezultate, implică conexiune cu backendul și salvarea datelor în profilul utilizatorului.

### User Story 15
Accesul administratorului la rapoarte despre recenziile oferite.
- **Prioritate**: Scăzută
- **Justificare**: Este util pentru îmbunătățirea aplicației, dar nu afectează experiența directă a utilizatorului.
- **Estimare**: 8
- **Justificare**: Generarea unui raport necesită acces la feedback-ul colectat și o interfață de administrare pentru afișarea acestuia.

### User Story 16: Actualizarea conținutului testelor de către administrator.
- **Prioritate**: Medie
- **Justificare**: Important pentru a menține relevanța aplicației pe termen lung, însă nu este necesar pentru utilizatorii finali la lansarea inițială.
- **Estimare**: 8
- **Justificare**: Necesită opțiuni de CRUD pentru teste și întrebări, astfel încât administratorul să poată actualiza conținutul. Implică și actualizări de UI și control al versiunilor întrebărilor.
