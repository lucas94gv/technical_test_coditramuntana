artist1 = Artist.create(name: 'Estopa',
                        description: 'Catalan rumba duo formed by brothers David and José Manuel Muñoz. Created on October 18, 1999, the group is from the city of Cornellà de Llobregat, Province of Barcelona1​2​')
artist2 = Artist.create(name: 'Luke Combs',
                        description: 'American singer and songwriter. He is considered the new benchmark of country music and one of the most popular and successful singers in the genre.')
artist3 = Artist.create(name: 'Marea',
                        description: 'Spanish rock band, formed in Berriozar, Navarra in 1997 by Kutxi Romero')
artist4 = Artist.create(name: 'Kendrick Lamar',
                        description: 'American rapper, songwriter, record producer. Lamar is widely regarded as one of the greatest rappers of all time and one of the best artists of his generation.')
artist5 = Artist.create(name: 'Jay Z',
                        description: 'American rapper, producer, businessman, and actor. He is one of the most financially successful hip-hop artists in the United States.')

lp1 = Lp.create(name: 'Destrangis',
                description: 'In 2001, his second album, Destrangis, was released, selling more than 2,000,000 copies.', artist: artist1)
lp2 = Lp.create(name: 'This Ones for you', description: 'It was published on October 21, 2016', artist: artist2)
lp3 = Lp.create(name: 'Besos de Perro',
                description: 'Third studio album by the Spanish rock band Marea, released in 2002', artist: artist3)
lp4 = Lp.create(name: 'DAMN',
                description: 'The album received favorable reviews and debuted at number one on the Billboard 200, giving Lamar his third consecutive tenure at that position.', artist: artist4)
lp5 = Lp.create(name: 'Reasonable Doubt',
                description: 'Debut studio album by American rapper Jay-Z. It was released on June 25, 1996', artist: artist5)

author1 = Author.create(name: 'Fito y Fitipaldis')
author2 = Author.create(name: 'ZACARI')
author3 = Author.create(name: 'RIHANNA')
author4 = Author.create(name: 'U2')
author5 = Author.create(name: 'Mary J. Blige')
author6 = Author.create(name: 'Notorious Big')
author7 = Author.create(name: 'Mecca')
author8 = Author.create(name: 'Foxy Brown')
author9 = Author.create(name: 'Memphis Bleek')
author10 = Author.create(name: 'Big Jaz')
author11 = Author.create(name: 'Sauce Money')

Song.create(name: 'Vino Tinto', lp: lp1)
Song.create(name: 'Luna Lunera', lp: lp1)
Song.create(name: 'Destrangis in the night', lp: lp1)
Song.create(name: 'Jardín del Olvido', lp: lp1)
Song.create(name: 'El Blade', lp: lp1)
Song.create(name: 'Te Vi Te Vi', lp: lp1)
Song.create(name: 'Nasío pa la Alegría', lp: lp1)
Song.create(name: 'Vuelvo a las andadas', lp: lp1)
Song.create(name: 'Ke Pasa!?', lp: lp1)
Song.create(name: 'Partiendo la Pana', lp: lp1)
Song.create(name: 'Mi Primera Cana', lp: lp1)

Song.create(name: 'Out there', lp: lp2)
Song.create(name: 'Memories Are made of', lp: lp2)
Song.create(name: 'Lonely One', lp: lp2)
Song.create(name: 'Beer Can', lp: lp2)
Song.create(name: 'Hurricane', lp: lp2)
Song.create(name: 'One Number Away', lp: lp2)
Song.create(name: 'Dont Tempt Me', lp: lp2)
Song.create(name: 'When  It rains it pours', lp: lp2)
Song.create(name: 'This Ones for you', lp: lp2)
Song.create(name: 'Be careful What You Wish For', lp: lp2)
Song.create(name: 'I Got Away with you', lp: lp2)
Song.create(name: 'Honky Tonk Highway', lp: lp2)

Song.create(name: 'Romance de José Etzailarena', lp: lp3)
Song.create(name: 'El rastro', lp: lp3)
Song.create(name: 'La luna me sabe a poco', lp: lp3)
Song.create(name: 'A la mierda primavera', lp: lp3)
Song.create(name: 'En tu agujero', lp: lp3)
Song.create(name: 'Manuela canta saetas', lp: lp3)
Song.create(name: 'Alfileres', lp: lp3)
Song.create(name: 'Me estoy quedando solo', lp: lp3)
Song.create(name: 'Venas con humo y palabras', lp: lp3)
Song.create(name: 'Como el viento de poniente', lp: lp3)
Song.create(name: 'Pan duro', lp: lp3).authors << author1

Song.create(name: 'BLOOD', lp: lp4)
Song.create(name: 'DNA', lp: lp4)
Song.create(name: 'YAH', lp: lp4)
Song.create(name: 'ELEMENT', lp: lp4)
Song.create(name: 'FEEL', lp: lp4)
Song.create(name: 'LOYALTY', lp: lp4).authors << author3
Song.create(name: 'PRIDE', lp: lp4)
Song.create(name: 'HUMBLE', lp: lp4)
Song.create(name: 'LUST', lp: lp4)
Song.create(name: 'LOVE', lp: lp4).authors << author2
Song.create(name: 'XXX', lp: lp4).authors << author4
Song.create(name: 'FEAR', lp: lp4)
Song.create(name: 'GOD', lp: lp4)
Song.create(name: 'DUCKWORTH', lp: lp4)

Song.create(name: 'Cant Knock The Hustle', lp: lp5).authors << author5
Song.create(name: 'Politics As Usual', lp: lp5)
Song.create(name: 'Brooklyns Finest', lp: lp5).authors << author6
Song.create(name: 'Dead Presidents II', lp: lp5)
Song.create(name: 'Feelin It', lp: lp5).authors << author7
Song.create(name: 'D evils', lp: lp5)
Song.create(name: '22 Twos', lp: lp5)
Song.create(name: 'Can I live', lp: lp5)
Song.create(name: 'Aint No Nigga', lp: lp5).authors << author8
Song.create(name: 'Friend Or Foe', lp: lp5)
Song.create(name: 'Coming Of Age', lp: lp5).authors << author9
Song.create(name: 'Cashmere Thoughts', lp: lp5)
Song.create(name: 'Bring It On', lp: lp5, authors: [author10, author11])
