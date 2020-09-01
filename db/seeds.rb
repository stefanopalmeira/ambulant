# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Cleaning database...'

Review.destroy_all
Order.destroy_all
Inventory.destroy_all
User.destroy_all

puts "Creating Users and Inventories..."

ovos1 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598906818/Ambulant%20seed/Carro-do-ovo_qqwvhr.jpg"
ovos2 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598979449/ovos_1_s9hylr.jpg"
ovos3 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598979609/aves_ovos_ernesto_de_souza--_jaoye0.jpg"
pamonha1 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598979523/8e3pemkdz3fzj64wsdditv0lp_doz1zy.jpg"
pamonha2 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598979523/pamonha-com-queijo_gfnmzu.jpg"
pamonha3 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598979818/pamonha-comida-de-rua-alex-silva-estadao_j9wuco.jpg"
limpeza2 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598906921/Ambulant%20seed/limpeza_ecq43i.jpg"
limpeza1 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598906921/Ambulant%20seed/limpeza3_myxgah.jpg"
sand1 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598907069/Ambulant%20seed/capa-43_czbbsn.jpg"
sand2 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598907069/Ambulant%20seed/wp-1460822800900_f9dx7b.jpg"
churras2 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598907178/Ambulant%20seed/vendedor-ambulante-que-cozinha-carne-em-espetos-127352487_jzzr7k.jpg"
churras3 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598907178/Ambulant%20seed/3368_espetinhos-geral_vqaox9.jpg"
churras1 = "https://res.cloudinary.com/dkljkjqlg/image/upload/v1598907214/Ambulant%20seed/churrasquinho_fyw9ji.jpg"

ovos = [ovos1, ovos2, ovos3]
pamonha =[pamonha1, pamonha2, pamonha3]
limpeza = [limpeza1, limpeza2]
churrasco = [churras1, churras2, churras3]
sanduiche = [sand1, sand2]


u1 = User.create!(email: 'jose@ambulant.com', password: '123123', name: 'Jose da Silva',
                  bio: 'Adoro servir meus clientes e trazer meus produtos com a melhor qualidade até eles.',
                  lat: -19.922681, long:-43.941139, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u2 = User.create!(email: 'maria@ambulant.com', password: '123123', name: 'Maria Oliveira',
                  bio: 'Estou sempre disponível pra atender os pedidos dos clientes com rapidez e bom atendimento.',
                  lat: -19.925263, long:-43.941139, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u3 = User.create!(email: 'antonio@ambulant.com', password: '123123', name: 'Antonio Pereira',
                  bio: 'Eu e minha esposa temos muito gosto em ir por todos os bairros e distribuir bons produtos e alegria.',
                  lat: -19.924214, long:-43.937360, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u4 = User.create!(email: 'joao@ambulant.com', password: '123123', name: 'João dos Santos',
                  bio: 'Sempre trabalhei com vendas, de casa em casa, e estou pronto para servir ainda mais, agora, com o Ambulant.',
                  lat: -19.927523, long:-43.943458, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u5 = User.create!(email: 'ana@ambulant.com', password: '123123', name: 'Ana Maria',
                  bio: 'Meus produtos são todos produzidos e vendidos com muito carinho',
                  lat: -19.918243, long:-43.939936, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u6 = User.create!(email: 'ricardo@ambulant.com', password: '123123', name: 'Ricardo Marinho',
                  bio: 'Adoro servir meus clientes e trazer meus produtos com a melhor qualidade até eles.',
                  lat: -19.916710, long:-43.935814, seller: true, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u7 = User.create!(email: 'bruna@ambulant.com', password: '123123', name: 'Bruna Carvalho',
                  bio: 'Estou sempre disponível pra atender os pedidos dos clientes com rapidez e bom atendimento.',
                  lat: -19.919695, long:-43.941053, address: 'Rua dos Tamôios, 500 - Centro, Belo Horizonte - MG, 30120-050')
u8 = User.create!(email: 'elena@ambulant.com', password: '123123', name: 'Elena Carneiro',
                  bio: 'Tenho muito gosto em ir por todos os bairros e distribuir bons produtos e alegria.',
                  lat: -19.927119, long:-43.945004, address: 'R. Santa Catarina, 859 - Centro, Belo Horizonte - MG, 30170-080')
u9 = User.create!(email: 'marcos@ambulant.com', password: '123123', name: 'Marcos Palmeira',
                  bio: 'Sempre trabalhei com vendas, de casa em casa, e estou pronto para servir ainda mais, agora, com o Ambulant.',
                  lat: -19.923690, long:-43.918378, address:'R. Niquelina, 93 - Santa Efigênia, Belo Horizonte - MG, 30260-100')
u10 = User.create!(email: 'renata@ambulant.com', password: '123123', name: 'Renata Queiroz',
                  bio: 'Meus produtos são todos produzidos e vendidos com muito carinho',
                  lat: -19.904443, long:-43.958945, address: 'Rua Frei Orlando, 291 - Alto Caiçaras, Belo Horizonte - MG, 31230-120')

i1 = Inventory.new(name: 'Ovos', 
               description: 'Ovos frescos de granja.')
i1.selling_user = u1
ovos.each_with_index do |ovo_url, index|
  file = URI.open(ovo_url)
  i1.photos.attach(io: file, filename: "ovo#{index}.jpg", content_type: 'image/jpg')
end
i1.save!
i2 = Inventory.new(name: 'Produtos de limpeza', 
               description: 'Todos os tipos de produtos pra sua casa ficar limpinha!')
i2.selling_user = u3
limpeza.each_with_index do |limpeza_url, index|
  file = URI.open(limpeza_url)
  i2.photos.attach(io: file, filename: "limpeza#{index}.jpg", content_type: 'image/jpg')
end
i2.save!
i3 = Inventory.new(name: 'Pamonha', 
               description: 'Pamonha quentinha e outros produtos deliciosos para você.')
i3.selling_user = u3
pamonha.each_with_index do |pamonha_url, index|
  file = URI.open(pamonha_url)
  i3.photos.attach(io: file, filename: "pamonha#{index}.jpg", content_type: 'image/jpg')
end
i3.save!
i4 = Inventory.new(name: 'Churrasquinho', 
               description: 'Churrasquinho de carne, frango e linguiça de primeira qualidade!')
i4.selling_user = u4
churrasco.each_with_index do |churrasco_url, index|
  file = URI.open(churrasco_url)
  i4.photos.attach(io: file, filename: "churrasco#{index}.jpg", content_type: 'image/jpg')
end
i4.save!
i5 = Inventory.new(name: 'Sanduíche natural', 
               description: 'Sanduíches naturais, fresquinhos e saudáveis.')
i5.selling_user = u5
sanduiche.each_with_index do |sanduiche_url, index|
  file = URI.open(sanduiche_url)
  i5.photos.attach(io: file, filename: "sanduiche#{index}.jpg", content_type: 'image/jpg')
end
i5.save!
i6 = Inventory.new(name: 'Churrasquinho', 
description: 'Churrasquinho de carne, frango e linguiça de primeira qualidade!')
i6.selling_user = u6
churrasco.each_with_index do |churrasco_url, index|
  file = URI.open(churrasco_url)
  i6.photos.attach(io: file, filename: "churrasco#{index}.jpg", content_type: 'image/jpg')
end
i6.save!
i7 = Inventory.new(name: 'Sanduíche natural', 
description: 'Sanduíches naturais, fresquinhos e saudáveis.')
i7.selling_user = u1
sanduiche.each_with_index do |sanduiche_url, index|
  file = URI.open(sanduiche_url)
  i7.photos.attach(io: file, filename: "sanduiche#{index}.jpg", content_type: 'image/jpg')
end
i7.save!
i8 = Inventory.new(name: 'Pamonha', 
description: 'Pamonha quentinha e outros produtos deliciosos para você.')
i8.selling_user = u2
pamonha.each_with_index do |pamonha_url, index|
  file = URI.open(pamonha_url)
  i8.photos.attach(io: file, filename: "pamonha#{index}.jpg", content_type: 'image/jpg')
end
i8.save!
i9 = Inventory.new(name: 'Produtos de limpeza', 
description: 'Todos os tipos de produtos pra sua casa ficar limpinha!')
i9.selling_user = u3
limpeza.each_with_index do |limpeza_url, index|
  file = URI.open(limpeza_url)
  i9.photos.attach(io: file, filename: "limpeza#{index}.jpg", content_type: 'image/jpg')
end
i9.save!
i10 = Inventory.new(name: 'Ovos', 
description: 'Ovos frescos de granja.')
i10.selling_user = u4
ovos.each_with_index do |ovo_url, index|
  file = URI.open(ovo_url)
  i10.photos.attach(io: file, filename: "ovo#{index}.jpg", content_type: 'image/jpg')
end
i10.save!

o1 = Order.new(completed: true)
o1.inventory = i1
o1.user = u7
o1.save!

o2 = Order.new(completed: true)
o2.inventory = i2
o2.user = u8
o2.save!

o3 = Order.new(completed: true)
o3.inventory = i3
o3.user = u9
o3.save!

o4 = Order.new(completed: true)
o4.inventory = i4
o4.user = u10
o4.save!

o5 = Order.new(completed: true)
o5.inventory = i5
o5.user = u7
o5.save!

o6 = Order.new(completed: true)
o6.inventory = i6
o6.user = u8
o6.save!

o7 = Order.new(completed: true)
o7.inventory = i7
o7.user = u9
o7.save!

o8 = Order.new(completed: true)
o8.inventory = i8
o8.user = u10
o8.save!

o9 = Order.new(completed: true)
o9.inventory = i9
o9.user = u7
o9.save!

o10 = Order.new(completed: true)
o10.inventory = i10
o10.user = u10
o10.save!

r1 = Review.new(description: "Excelente produto e qualidade!", rating:5 )
r1.order = o1
r1.save!

r2 = Review.new(description: "Excelente produto e qualidade!", rating:5 )
r2.order = o2
r2.save!

r3 = Review.new(description: "Muito bom!", rating:4 )
r3.order = o3
r3.save!

r4 = Review.new(description: "Muito bom!", rating:4 )
r4.order = o4
r4.save!

r5 = Review.new(description: "Vale a pena experimentar", rating:3 )
r5.order = o5
r5.save!

r6 = Review.new(description: "Vale a pena experimentar", rating:3 )
r6.order = o6
r6.save!

r7 = Review.new(description: "Poderia ser um pouco melhor", rating:2 )
r7.order = o7
r7.save!

r8 = Review.new(description: "Poderia ser um pouco melhor", rating:2 )
r8.order = o8
r8.save!

r9 = Review.new(description: "Não recomendo de forma alguma", rating:1 )
r9.order = o9
r9.save!

r10 = Review.new(description: "Não recomendo de forma alguma", rating:1 )
r10.order = o10
r10.save!

puts "Users, inventories and everything else created, son!!"
