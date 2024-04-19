import 'dart:math';

final _questions = [
  {
    "question": "Who is the author of 'The Great Gatsby'?",
    "options": [
      "F. Scott Fitzgerald",
      "Ernest Hemingway",
      "John Steinbeck",
      "Mark Twain"
    ],
    "answer": "F. Scott Fitzgerald"
  },
  {
    "question": "Which country is known as the Land of the Rising Sun?",
    "options": ["China", "India", "Japan", "South Korea"],
    "answer": "Japan"
  },
  {
    "question": "Who was the first person to step on the moon?",
    "options": [
      "Neil Armstrong",
      "Buzz Aldrin",
      "Yuri Gagarin",
      "Alan Shepard"
    ],
    "answer": "Neil Armstrong"
  },
  {
    "question": "Which animal is known as the 'King of the Jungle'?",
    "options": ["Tiger", "Lion", "Elephant", "Gorilla"],
    "answer": "Lion"
  },
  {
    "question": "Who painted the Mona Lisa?",
    "options": [
      "Leonardo da Vinci",
      "Michelangelo",
      "Pablo Picasso",
      "Vincent van Gogh"
    ],
    "answer": "Leonardo da Vinci"
  },
  {
    "question": "What is the capital city of Canada?",
    "options": ["Toronto", "Ottawa", "Vancouver", "Montreal"],
    "answer": "Ottawa"
  },
  {
    "question": "Who wrote the play 'Romeo and Juliet'?",
    "options": [
      "William Shakespeare",
      "George Bernard Shaw",
      "Arthur Miller",
      "Henrik Ibsen"
    ],
    "answer": "William Shakespeare"
  },
  {
    "question": "What is the chemical symbol for gold?",
    "options": ["Ag", "Fe", "Au", "Cu"],
    "answer": "Au"
  },
  {
    "question": "Who invented the telephone?",
    "options": [
      "Thomas Edison",
      "Alexander Graham Bell",
      "Nikola Tesla",
      "Guglielmo Marconi"
    ],
    "answer": "Alexander Graham Bell"
  },
  {
    "question": "What is the tallest mammal in the world?",
    "options": ["African elephant", "Giraffe", "Hippopotamus", "Kangaroo"],
    "answer": "Giraffe"
  },
  {
    "question": "Which planet is known as the Red Planet?",
    "options": ["Earth", "Jupiter", "Mars", "Venus"],
    "answer": "Mars"
  },
  {
    "question": "Who was the first President of the United States?",
    "options": [
      "Thomas Jefferson",
      "Abraham Lincoln",
      "George Washington",
      "John Adams"
    ],
    "answer": "George Washington"
  },
  {
    "question": "What is the chemical symbol for silver?",
    "options": ["Si", "S", "Ag", "Sr"],
    "answer": "Ag"
  },
  {
    "question": "Who is known as the Father of Modern Physics?",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Niels Bohr",
      "Galileo Galilei"
    ],
    "answer": "Albert Einstein"
  },
  {
    "question": "What is the largest ocean in the world?",
    "options": [
      "Atlantic Ocean",
      "Arctic Ocean",
      "Indian Ocean",
      "Pacific Ocean"
    ],
    "answer": "Pacific Ocean"
  },
  {
    "question": "Which bird is a symbol of peace?",
    "options": ["Crow", "Eagle", "Pigeon", "Dove"],
    "answer": "Dove"
  },
  {
    "question": "Who wrote '1984'?",
    "options": ["George Orwell", "Aldous Huxley", "Ray Bradbury", "H.G. Wells"],
    "answer": "George Orwell"
  },
  {
    "question": "Which city is known as the City of Love?",
    "options": ["Paris", "Venice", "Rome", "Florence"],
    "answer": "Paris"
  },
  {
    "question": "What is the chemical symbol for carbon?",
    "options": ["Co", "Ca", "C", "Cr"],
    "answer": "C"
  },
  {
    "question": "Who painted the ceiling of the Sistine Chapel?",
    "options": ["Leonardo da Vinci", "Michelangelo", "Raphael", "Donatello"],
    "answer": "Michelangelo"
  },
  {
    "question": "What is the smallest continent in the world?",
    "options": ["Asia", "Africa", "Australia", "Europe"],
    "answer": "Australia"
  },
  {
    "question": "Who was the first woman to win a Nobel Prize?",
    "options": [
      "Rosalind Franklin",
      "Marie Curie",
      "Florence Nightingale",
      "Jane Goodall"
    ],
    "answer": "Marie Curie"
  },
  {
    "question": "Which country is known as the Land of the Midnight Sun?",
    "options": ["Norway", "Canada", "Russia", "Sweden"],
    "answer": "Norway"
  },
  {
    "question": "What is the chemical symbol for potassium?",
    "options": ["P", "Pt", "Po", "K"],
    "answer": "K"
  },
  {
    "question": "Who wrote 'Pride and Prejudice'?",
    "options": [
      "Charlotte Bronte",
      "Jane Austen",
      "Emily Bronte",
      "Charles Dickens"
    ],
    "answer": "Jane Austen"
  },
  {
    "question": "What is the largest living bird in the world?",
    "options": ["Ostrich", "Emu", "Albatross", "Pelican"],
    "answer": "Ostrich"
  },
  {
    "question": "Which country is known as the Land of the Thunder Dragon?",
    "options": ["Nepal", "Bhutan", "Tibet", "Laos"],
    "answer": "Bhutan"
  },
  {
    "question": "What is the chemical symbol for hydrogen?",
    "options": ["H", "He", "Hy", "Ho"],
    "answer": "H"
  },
  {
    "question": "Who composed the musical piece 'The Four Seasons'?",
    "options": [
      "Wolfgang Amadeus Mozart",
      "Johann Sebastian Bach",
      "Ludwig van Beethoven",
      "Antonio Vivaldi"
    ],
    "answer": "Antonio Vivaldi"
  },
  {
    "question": "What is the currency of Japan?",
    "options": ["Yuan", "Yen", "Rupee", "Won"],
    "answer": "Yen"
  },
  {
    "question": "Who discovered penicillin?",
    "options": [
      "Alexander Fleming",
      "Louis Pasteur",
      "Robert Koch",
      "Joseph Lister"
    ],
    "answer": "Alexander Fleming"
  },
  {
    "question": "What is the chemical symbol for helium?",
    "options": ["He", "H", "Ho", "Hu"],
    "answer": "He"
  },
  {
    "question": "Who is the author of 'War and Peace'?",
    "options": [
      "Fyodor Dostoevsky",
      "Leo Tolstoy",
      "Anton Chekhov",
      "Nikolai Gogol"
    ],
    "answer": "Leo Tolstoy"
  },
  {
    "question": "What is the highest mountain in the world?",
    "options": ["K2", "Mount Everest", "Kangchenjunga", "Lhotse"],
    "answer": "Mount Everest"
  },
  {
    "question":
        "Who was the first female Prime Minister of the United Kingdom?",
    "options": [
      "Margaret Thatcher",
      "Theresa May",
      "Angela Merkel",
      "Indira Gandhi"
    ],
    "answer": "Margaret Thatcher"
  },
  {
    "question": "What is the chemical symbol for lead?",
    "options": ["Le", "La", "L", "Pb"],
    "answer": "Pb"
  },
  {
    "question": "Who wrote 'The Odyssey'?",
    "options": ["Homer", "Virgil", "Plato", "Aristotle"],
    "answer": "Homer"
  },
  {
    "question": "What is the deepest ocean trench in the world?",
    "options": [
      "Mariana Trench",
      "Tonga Trench",
      "Puerto Rico Trench",
      "Java Trench"
    ],
    "answer": "Mariana Trench"
  },
  {
    "question": "Who discovered radium and polonium?",
    "options": [
      "Marie Curie",
      "Niels Bohr",
      "Albert Einstein",
      "Ernest Rutherford"
    ],
    "answer": "Marie Curie"
  },
  {
    "question": "What is the chemical symbol for mercury?",
    "options": ["Hg", "Me", "Mg", "H"],
    "answer": "Hg"
  },
  {
    "question": "Who painted 'Starry Night'?",
    "options": [
      "Pablo Picasso",
      "Vincent van Gogh",
      "Salvador Dali",
      "Claude Monet"
    ],
    "answer": "Vincent van Gogh"
  },
  {
    "question": "What is the hardest natural substance on Earth?",
    "options": ["Gold", "Diamond", "Quartz", "Talc"],
    "answer": "Diamond"
  },
  {
    "question": "Who wrote 'Hamlet'?",
    "options": [
      "Christopher Marlowe",
      "William Shakespeare",
      "Ben Jonson",
      "Thomas Kyd"
    ],
    "answer": "William Shakespeare"
  },
  {
    "question": "What is the capital city of Spain?",
    "options": ["Barcelona", "Madrid", "Seville", "Valencia"],
    "answer": "Madrid"
  },
  {
    "question": "Who discovered the theory of relativity?",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Galileo Galilei",
      "Niels Bohr"
    ],
    "answer": "Albert Einstein"
  },
  {
    "question": "What is the chemical symbol for iron?",
    "options": ["Fe", "I", "In", "Ir"],
    "answer": "Fe"
  },
  {
    "question": "Who was the first female astronaut?",
    "options": [
      "Sally Ride",
      "Valentina Tereshkova",
      "Yuri Gagarin",
      "Mae Jemison"
    ],
    "answer": "Valentina Tereshkova"
  },
  {
    "question": "What is the chemical symbol for sodium?",
    "options": ["Na", "So", "S", "N"],
    "answer": "Na"
  },
  {
    "question": "Who wrote 'The Catcher in the Rye'?",
    "options": [
      "J.D. Salinger",
      "F. Scott Fitzgerald",
      "Ernest Hemingway",
      "Harper Lee"
    ],
    "answer": "J.D. Salinger"
  },
  {
    "question": "What is the largest desert in the world?",
    "options": [
      "Sahara Desert",
      "Arabian Desert",
      "Gobi Desert",
      "Antarctic Desert"
    ],
    "answer": "Antarctic Desert"
  },
  {
    "question": "Who composed the musical piece 'Moonlight Sonata'?",
    "options": [
      "Wolfgang Amadeus Mozart",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Franz Schubert"
    ],
    "answer": "Ludwig van Beethoven"
  },
  {
    "question": "What is the chemical symbol for oxygen?",
    "options": ["O", "Ox", "On", "Og"],
    "answer": "O"
  },
  {
    "question": "Who was the first woman to win a Nobel Prize in Literature?",
    "options": [
      "Virginia Woolf",
      "Pearl S. Buck",
      "Toni Morrison",
      "Selma Lagerlof"
    ],
    "answer": "Selma Lagerlof"
  },
  {
    "question": "What is the capital city of Italy?",
    "options": ["Rome", "Milan", "Venice", "Florence"],
    "answer": "Rome"
  },
  {
    "question": "Who discovered penicillin?",
    "options": [
      "Alexander Fleming",
      "Louis Pasteur",
      "Robert Koch",
      "Joseph Lister"
    ],
    "answer": "Alexander Fleming"
  },
  {
    "question": "What is the chemical symbol for neon?",
    "options": ["Ne", "Na", "Ni", "No"],
    "answer": "Ne"
  },
  {
    "question": "Who wrote 'The Grapes of Wrath'?",
    "options": [
      "F. Scott Fitzgerald",
      "Ernest Hemingway",
      "John Steinbeck",
      "Mark Twain"
    ],
    "answer": "John Steinbeck"
  },
  {
    "question": "What is the capital city of China?",
    "options": ["Beijing", "Shanghai", "Hong Kong", "Guangzhou"],
    "answer": "Beijing"
  },
  {
    "question": "Who painted 'The Last Supper'?",
    "options": ["Leonardo da Vinci", "Michelangelo", "Raphael", "Donatello"],
    "answer": "Leonardo da Vinci"
  },
  {
    "question": "What is the chemical symbol for calcium?",
    "options": ["Ca", "Co", "C", "Cl"],
    "answer": "Ca"
  },
  {
    "question": "Who wrote 'The Canterbury Tales'?",
    "options": [
      "Geoffrey Chaucer",
      "William Shakespeare",
      "John Milton",
      "Dante Alighieri"
    ],
    "answer": "Geoffrey Chaucer"
  },
  {
    "question": "What is the largest planet in the solar system?",
    "options": ["Jupiter", "Saturn", "Uranus", "Neptune"],
    "answer": "Jupiter"
  },
  {
    "question":
        "Who was the first woman to fly solo across the Atlantic Ocean?",
    "options": [
      "Amelia Earhart",
      "Bessie Coleman",
      "Valentina Tereshkova",
      "Jacqueline Cochran"
    ],
    "answer": "Amelia Earhart"
  },
  {
    "question": "What is the chemical symbol for silver?",
    "options": ["Si", "S", "Ag", "Sr"],
    "answer": "Ag"
  },
  {
    "question": "Who wrote 'The Scarlet Letter'?",
    "options": [
      "Nathaniel Hawthorne",
      "Emily Dickinson",
      "Henry James",
      "Edgar Allan Poe"
    ],
    "answer": "Nathaniel Hawthorne"
  },
  {
    "question": "What is the capital city of France?",
    "options": ["Paris", "Marseille", "Lyon", "Nice"],
    "answer": "Paris"
  },
  {
    "question": "Who discovered the theory of evolution?",
    "options": [
      "Charles Darwin",
      "Gregor Mendel",
      "Alfred Russel Wallace",
      "Jean-Baptiste Lamarck"
    ],
    "answer": "Charles Darwin"
  },
  {
    "question": "What is the chemical symbol for uranium?",
    "options": ["U", "Ur", "Un", "Us"],
    "answer": "U"
  },
  {
    "question": "Who wrote 'The Picture of Dorian Gray'?",
    "options": [
      "Oscar Wilde",
      "Jane Austen",
      "Emily Bronte",
      "Charlotte Bronte"
    ],
    "answer": "Oscar Wilde"
  },
  {
    "question": "What is the highest waterfall in the world?",
    "options": [
      "Niagara Falls",
      "Angel Falls",
      "Victoria Falls",
      "Iguazu Falls"
    ],
    "answer": "Angel Falls"
  },
  {
    "question": "Who was the first President of the United States?",
    "options": [
      "Thomas Jefferson",
      "Abraham Lincoln",
      "George Washington",
      "John Adams"
    ],
    "answer": "George Washington"
  },
  {
    "question": "What is the chemical symbol for silicon?",
    "options": ["Si", "S", "So", "Se"],
    "answer": "Si"
  },
  {
    "question": "Who composed the musical piece 'The Nutcracker'?",
    "options": [
      "Pyotr Ilyich Tchaikovsky",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Wolfgang Amadeus Mozart"
    ],
    "answer": "Pyotr Ilyich Tchaikovsky"
  },
  {
    "question": "What is the currency of Russia?",
    "options": ["Euro", "Ruble", "Dollar", "Pound"],
    "answer": "Ruble"
  },
  {
    "question": "Who wrote 'One Hundred Years of Solitude'?",
    "options": [
      "Gabriel Garcia Marquez",
      "Jorge Luis Borges",
      "Pablo Neruda",
      "Mario Vargas Llosa"
    ],
    "answer": "Gabriel Garcia Marquez"
  },
  {
    "question": "What is the capital city of Australia?",
    "options": ["Sydney", "Melbourne", "Canberra", "Brisbane"],
    "answer": "Canberra"
  },
  {
    "question": "Who discovered the structure of DNA?",
    "options": [
      "James Watson and Francis Crick",
      "Rosalind Franklin",
      "Gregor Mendel",
      "Alfred Hershey and Martha Chase"
    ],
    "answer": "James Watson and Francis Crick"
  },
  {
    "question": "What is the chemical symbol for tin?",
    "options": ["Ti", "Tn", "T", "Sn"],
    "answer": "Sn"
  },
  {
    "question": "Who wrote 'Don Quixote'?",
    "options": [
      "Miguel de Cervantes",
      "Fyodor Dostoevsky",
      "Leo Tolstoy",
      "Anton Chekhov"
    ],
    "answer": "Miguel de Cervantes"
  },
  {
    "question": "What is the fastest land animal in the world?",
    "options": ["Cheetah", "Lion", "Gazelle", "Leopard"],
    "answer": "Cheetah"
  },
  {
    "question": "Who discovered the theory of gravity?",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Galileo Galilei",
      "Niels Bohr"
    ],
    "answer": "Isaac Newton"
  },
  {
    "question": "What is the chemical symbol for zinc?",
    "options": ["Z", "Zi", "Zn", "Zo"],
    "answer": "Zn"
  },
  {
    "question": "Who composed the musical piece 'Symphony No. 9'?",
    "options": [
      "Ludwig van Beethoven",
      "Wolfgang Amadeus Mozart",
      "Johann Sebastian Bach",
      "Franz Schubert"
    ],
    "answer": "Ludwig van Beethoven"
  },
  {
    "question": "What is the currency of China?",
    "options": ["Euro", "Yen", "Dollar", "Yuan"],
    "answer": "Yuan"
  },
  {
    "question": "Who wrote 'Moby-Dick'?",
    "options": [
      "Mark Twain",
      "Herman Melville",
      "Edgar Allan Poe",
      "Nathaniel Hawthorne"
    ],
    "answer": "Herman Melville"
  },
  {
    "question": "What is the capital city of India?",
    "options": ["New Delhi", "Mumbai", "Kolkata", "Bangalore"],
    "answer": "New Delhi"
  },
  {
    "question": "Who discovered the structure of benzene?",
    "options": [
      "Friedrich August Kekule",
      "Linus Pauling",
      "Marie Curie",
      "Ernest Rutherford"
    ],
    "answer": "Friedrich August Kekule"
  },
  {
    "question": "What is the chemical symbol for phosphorus?",
    "options": ["Ph", "Po", "P", "Pl"],
    "answer": "P"
  },
  {
    "question": "Who wrote 'The Iliad'?",
    "options": ["Homer", "Virgil", "Plato", "Aristotle"],
    "answer": "Homer"
  },
  {
    "question": "What is the highest mountain in North America?",
    "options": [
      "Mount McKinley (Denali)",
      "Mount Rainier",
      "Mount Whitney",
      "Mount St. Elias"
    ],
    "answer": "Mount McKinley (Denali)"
  },
  {
    "question": "Who was the first woman to win a Nobel Prize in Physics?",
    "options": [
      "Marie Curie",
      "Maria Goeppert Mayer",
      "Dorothy Crowfoot Hodgkin",
      "Irene Joliot-Curie"
    ],
    "answer": "Marie Curie"
  },
  {
    "question": "What is the chemical symbol for titanium?",
    "options": ["Ti", "To", "T", "Te"],
    "answer": "Ti"
  },
  {
    "question": "Who composed the musical piece 'The Magic Flute'?",
    "options": [
      "Wolfgang Amadeus Mozart",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Pyotr Ilyich Tchaikovsky"
    ],
    "answer": "Wolfgang Amadeus Mozart"
  },
  {
    "question": "What is the currency of France?",
    "options": ["Euro", "Pound", "Dollar", "Franc"],
    "answer": "Euro"
  },
  {
    "question": "Who wrote 'The Old Man and the Sea'?",
    "options": [
      "Ernest Hemingway",
      "F. Scott Fitzgerald",
      "John Steinbeck",
      "Mark Twain"
    ],
    "answer": "Ernest Hemingway"
  },
  {
    "question": "What is the capital city of Brazil?",
    "options": ["Sao Paulo", "Rio de Janeiro", "Brasilia", "Salvador"],
    "answer": "Brasilia"
  },
  {
    "question": "Who discovered the theory of general relativity?",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Galileo Galilei",
      "Niels Bohr"
    ],
    "answer": "Albert Einstein"
  },
  {
    "question": "What is the chemical symbol for arsenic?",
    "options": ["Ar", "As", "Ac", "Am"],
    "answer": "As"
  },
  {
    "question": "Who composed the musical piece 'Swan Lake'?",
    "options": [
      "Pyotr Ilyich Tchaikovsky",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Wolfgang Amadeus Mozart"
    ],
    "answer": "Pyotr Ilyich Tchaikovsky"
  },
  {
    "question": "What is the currency of Germany?",
    "options": ["Euro", "Mark", "Pound", "Dollar"],
    "answer": "Euro"
  },
  {
    "question": "Who wrote 'Les Miserables'?",
    "options": [
      "Victor Hugo",
      "Charles Dickens",
      "Leo Tolstoy",
      "Fyodor Dostoevsky"
    ],
    "answer": "Victor Hugo"
  },
  {
    "question": "What is the capital city of South Africa?",
    "options": ["Cape Town", "Johannesburg", "Pretoria", "Durban"],
    "answer": "Pretoria"
  },
  {
    "question": "Who discovered the theory of electromagnetism?",
    "options": [
      "Michael Faraday",
      "James Clerk Maxwell",
      "Nikola Tesla",
      "Thomas Edison"
    ],
    "answer": "James Clerk Maxwell"
  },
  {
    "question": "What is the chemical symbol for antimony?",
    "options": ["A", "An", "At", "Sb"],
    "answer": "Sb"
  },
  {
    "question": "Who composed the musical piece 'Carmen'?",
    "options": [
      "Wolfgang Amadeus Mozart",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Georges Bizet"
    ],
    "answer": "Georges Bizet"
  },
  {
    "question": "What is the currency of Italy?",
    "options": ["Euro", "Pound", "Dollar", "Lira"],
    "answer": "Euro"
  },
  {
    "question": "Who wrote 'The Odyssey'?",
    "options": ["Homer", "Virgil", "Plato", "Aristotle"],
    "answer": "Homer"
  },
  {
    "question": "What is the capital city of Germany?",
    "options": ["Munich", "Berlin", "Hamburg", "Frankfurt"],
    "answer": "Berlin"
  },
  {
    "question": "Who discovered X-rays?",
    "options": [
      "Wilhelm Conrad Roentgen",
      "Marie Curie",
      "Ernest Rutherford",
      "Antoine Henri Becquerel"
    ],
    "answer": "Wilhelm Conrad Roentgen"
  },
  {
    "question": "What is the chemical symbol for iodine?",
    "options": ["I", "Io", "In", "Id"],
    "answer": "I"
  },
  {
    "question": "Who composed the musical piece 'The Marriage of Figaro'?",
    "options": [
      "Wolfgang Amadeus Mozart",
      "Ludwig van Beethoven",
      "Johann Sebastian Bach",
      "Antonio Vivaldi"
    ],
    "answer": "Wolfgang Amadeus Mozart"
  },
  {
    "question": "What is the currency of Japan?",
    "options": ["Yuan", "Yen", "Rupee", "Won"],
    "answer": "Yen"
  },
  {
    "question": "Who wrote 'The Brothers Karamazov'?",
    "options": [
      "Fyodor Dostoevsky",
      "Leo Tolstoy",
      "Anton Chekhov",
      "Nikolai Gogol"
    ],
    "answer": "Fyodor Dostoevsky"
  },
  {
    "question": "What is the capital city of Canada?",
    "options": ["Toronto", "Ottawa", "Vancouver", "Montreal"],
    "answer": "Ottawa"
  },
  {
    "question": "Who discovered the theory of relativity?",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Galileo Galilei",
      "Niels Bohr"
    ],
    "answer": "Albert Einstein"
  },
  {
    "question": "What is the chemical symbol for gold?",
    "options": ["Ag", "Fe", "Au", "Cu"],
    "answer": "Au"
  },
  {
    "question": "Who was the first person to step on the moon?",
    "options": [
      "Neil Armstrong",
      "Buzz Aldrin",
      "Yuri Gagarin",
      "Alan Shepard"
    ],
    "answer": "Neil Armstrong"
  },
  {
    "question": "Which animal is known as the 'King of the Jungle'?",
    "options": ["Tiger", "Lion", "Elephant", "Gorilla"],
    "answer": "Lion"
  }
];

// Since the quiz should not be a very lengthy one, it should be limited to 10
// questions at a time, which is exactly what this getter returns, 10 questions
List<Map<String, Object>> get questions {
  final rnd = Random();
  final Set indices = {};

  while (indices.length < 10) {
    indices.add(rnd.nextInt(118));
  }

  final List<Map<String, Object>> qstns = [];
  for (var index in indices) {
    qstns.add(_questions[index]);
  }

  return qstns;
}
