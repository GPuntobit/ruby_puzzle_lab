User.destroy_all
Level.destroy_all
Block.destroy_all
UserProgress.destroy_all
Hint.destroy_all

User.create!(email: "demo@example.com", password: "password123", password_confirmation: "password123")

levels = Level.create!([
  {
    title: "Ciao, Mondo!",
    description: "Usa il blocco 'puts' e la stringa 'Ciao, mondo!' per stampare il messaggio.",
    level_type: "drag-and-drop",
    solution: "puts \"Ciao, mondo!\""
  },
  {
    title: "Somma Semplice",
    description: "Usa le variabili 'a' e 'b' e l'operatore '+' per calcolare la somma.",
    level_type: "drag-and-drop",
    solution: "a = 5\nb = 3\nputs a + b"
  },
  {
    title: "Risolvi l'Errore",
    description: "Trova e correggi l'errore nel codice per stampare 'Ruby è divertente!'.",
    level_type: "debugging",
    solution: 'puts "Ruby è divertente!"'
  },
  {
    title: "Completa il Metodo",
    description: "Completa il metodo 'saluta' per stampare 'Ciao, [nome]!'.",
    level_type: "fill-in-the-blank",
    solution: "def saluta(nome)\nputs \"Ciao, \" + nome + \"!\"\nend"
  }
])

levels[0].blocks.create!([
  { content: "puts" },
  { content: '"Ciao, mondo!"' }
])

levels[1].blocks.create!([
  { content: "a = 5" },
  { content: "b = 3" },
  { content: "puts" },
  { content: "a + b" }
])

levels[2].blocks.create!([
  { content: "puts" },
  { content: '"Ruby è divertente!"' }
])

levels[3].blocks.create!([
  { content: "def saluta(nome)" },
  { content: "puts" },
  { content: '"Ciao, " + nome + "!"' },
  { content: "end" }
])

# Add hints for Level 1 - Ciao, Mondo!
levels[0].hints.create!([
  { content: "Usa il metodo 'puts' per stampare output", hint_order: 1 },
  { content: "Combina 'puts' con la stringa 'Ciao, mondo!'", hint_order: 2 },
  { content: "La soluzione è: puts \"Ciao, mondo!\"", hint_order: 3 }
])

# Add hints for Level 2 - Somma Semplice
levels[1].hints.create!([
  { content: "Prima assegna i valori alle variabili 'a' e 'b'", hint_order: 1 },
  { content: "Poi usa 'puts' per stampare il risultato di 'a + b'", hint_order: 2 },
  { content: "La soluzione è: a = 5, b = 3, puts a + b", hint_order: 3 }
])

# Add hints for Level 3 - Risolvi l'Errore
levels[2].hints.create!([
  { content: "Controlla la sintassi della stringa", hint_order: 1 },
  { content: "Assicurati di usare le virgolette corrette", hint_order: 2 },
  { content: "La soluzione è: puts \"Ruby è divertente!\"", hint_order: 3 }
])

# Add hints for Level 4 - Completa il Metodo
levels[3].hints.create!([
  { content: "Il metodo deve accettare un parametro 'nome'", hint_order: 1 },
  { content: "Usa l'operatore '+' per concatenare le stringhe", hint_order: 2 },
  { content: "La soluzione è: def saluta(nome) puts \"Ciao, \" + nome + \"!\" end", hint_order: 3 }
])
