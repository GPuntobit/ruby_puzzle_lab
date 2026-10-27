---
updated: 2026-10-26
---
# Piano per completare Ruby Quest (ruby_puzzle_lab)

## Stato attuale

MVP funzionante: login Devise, lista livelli, pagina livello (blocchi drag-and-drop o risposta scritta, controllo soluzione, suggerimenti progressivi, link al livello successivo), pagina progressi. Il seed crea 4 livelli con i relativi suggerimenti.

## Task

### Bug
- [ ] I pulsanti "Gioca Piano 1–4" in `app/views/levels/index.html.erb` usano gli ID fissi `level_path(1..4)`: dopo un nuovo `db:seed` gli ID cambiano (es. 5–8) e i link danno 404.
- [ ] "Livello X di N" in `app/views/levels/show.html.erb` usa l'ID del database invece della posizione del livello.
- [ ] `LevelsController#check_solution`: una risposta sbagliata su un livello già completato rimette `completed: false`.

### Home e valori fissi (`app/views/levels/index.html.erb`)
- [ ] Lo stato "Lv 3 / 480 XP" e le voci "completed"/"in-progress" delle card dei Piani sono fissi: collegarli ai progressi reali (o rimuoverli).
- [ ] I pulsanti "Concept", "Mappa live", "Schemata puzzle" e "Progressione Ruby" puntano a `#`.
- [ ] Il pulsante "Implementa drag-and-drop in Gosu" porta alla lista dei livelli: definire la destinazione o rimuoverlo.

### Contenuti
- [ ] Aggiungere i livelli promessi dai Piani: Piano 1 (Fondamenta: if/else, Array/Hash, .each/.map, metodi), Piano 2 (Classi e Oggetti), Piano 3 (Blocchi e Proc), Piano 4 (Gestione Errori).
- [ ] Piano 5 — Boss finale "Golem Autonomo".
- [ ] Sistema XP/livello utente (oggi non esiste: nessun modello).

### Tipi di livello
- [ ] `debugging`: interfaccia dedicata con codice errato da correggere (oggi è un normale drag-and-drop con i blocchi già corretti).
- [ ] `fill-in-the-blank`: interfaccia con spazi da completare (oggi è un normale drag-and-drop).

### Pulizia
- [ ] Rimuovere i `console.log` di debug dallo script in `app/views/levels/show.html.erb`.
- [ ] Lista livelli: query N+1 su `level.user_progresses.find_by(user: current_user)`.
- [ ] Rimuovere `app/javascript/controllers/hello_controller.js` (non usato).
- [ ] Sostituire il README generato da Rails con istruzioni reali (setup, seed, utente demo).
