User.destroy_all
Level.destroy_all
Block.destroy_all
UserProgress.destroy_all

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
